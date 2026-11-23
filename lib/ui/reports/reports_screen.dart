import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../app_state.dart';
import '../../data/analytics.dart';
import '../../data/bundle.dart';
import '../../data/export_excel.dart';
import '../../data/picklists.dart';
import '../../data/units.dart';
import '../land/land_card.dart';
import '../land/land_sections.dart';
import '../people/person_card.dart';
import '../widgets/common.dart';

/// Hub: statistics, ready-made lists, data quality and Excel export.
class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  Future<void> _export(BuildContext context) async {
    if (!await confirm(
        context,
        'Excel ගොනුවේ සියලු පුද්ගලික තොරතුරු (නම්, හැඳුනුම්පත් අංක, දුරකථන) ඇතුළත් වේ.\n'
        'නිල කටයුතු සඳහා පමණක්, ආරක්ෂිතව බෙදාගන්න.',
        ok: 'අපනයනය කරන්න')) {
      return;
    }
    final s = await AppState.db.loadSnapshot();
    final bytes = buildDivisionWorkbook(s);
    await shareFile(bytes, 'SmartGrama-${stamp()}.xlsx');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('වාර්තා')),
      body: ListView(
        children: [
          _tile(context, Icons.bar_chart, 'වසම් සංඛ්‍යාලේඛන',
              'ජනගහනය, නිවාස, ඉඩම්, ගස්, සතුන්', () => push(context, const StatsScreen())),
          _tile(context, Icons.list_alt, 'සූදානම් ලැයිස්තු',
              'වැඩිහිටියන්, අබලන් නිවාස, කිරි ගවයින් ඇති පවුල්…', () => push(context, const ReadyListsScreen())),
          _tile(context, Icons.rule, 'දත්ත ගුණාත්මකභාවය',
              'අසම්පූර්ණ, අනුපිටපත්, වලංගු නැති දත්ත', () => push(context, const QualityScreen())),
          _tile(context, Icons.table_view, 'Excel ලෙස අපනයනය',
              'සියලු දත්ත එක් ගොනුවකට', () => _export(context)),
        ],
      ),
    );
  }

  Widget _tile(BuildContext context, IconData icon, String title, String sub, VoidCallback onTap) => Card(
        child: ListTile(
          leading: CircleAvatar(child: Icon(icon)),
          title: Text(title),
          subtitle: Text(sub),
          trailing: const Icon(Icons.chevron_right),
          onTap: onTap,
        ),
      );
}

// ===================================================================
// Village filter shared by report screens
// ===================================================================

class _VillageFilter extends StatelessWidget {
  const _VillageFilter({required this.s, required this.value, required this.onChanged});
  final Snapshot s;
  final String? value;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 52,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: ChoiceChip(
                  label: const Text('මුළු වසම'), selected: value == null, onSelected: (_) => onChanged(null)),
            ),
            for (final v in s.villages)
              Padding(
                padding: const EdgeInsets.only(right: 6),
                child: ChoiceChip(
                    label: Text(v.name), selected: value == v.id, onSelected: (_) => onChanged(v.id)),
              ),
          ],
        ),
      );
}

// ===================================================================
// Statistics
// ===================================================================

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});
  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  String? _village;
  final nf = NumberFormat.decimalPattern();

  List<Widget> _counter(String title, Counter c, String? list,
      {String Function(String)? label, List<String>? order}) {
    if (c.counts.isEmpty) return const [];
    final entries = order == null
        ? c.sorted()
        : [
            for (final k in [...order, 'unknown'])
              if (c.counts[k] != null) MapEntry(k, c.counts[k]!),
          ];
    final max = entries.map((e) => e.value).reduce((a, b) => a > b ? a : b);
    return [
      SectionTitle(title),
      for (final e in entries)
        BarRow(
          label?.call(e.key) ??
              (e.key == 'unknown' ? 'සඳහන් කර නැත' : list == null ? e.key : pl(list, e.key)),
          e.value,
          max,
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final db = AppState.db;
    return Scaffold(
      appBar: AppBar(title: const Text('වසම් සංඛ්‍යාලේඛන')),
      body: StreamBuilder<Snapshot>(
        stream: db.watchSnapshot(),
        builder: (context, snap) {
          final all = snap.data;
          if (all == null) return const Center(child: CircularProgressIndicator());
          final s = all.forVillage(_village);
          final st = computeStats(s);
          return ListView(
            padding: const EdgeInsets.only(bottom: 32),
            children: [
              _VillageFilter(s: all, value: _village, onChanged: (v) => setState(() => _village = v)),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Wrap(
                    spacing: 24,
                    runSpacing: 8,
                    children: [
                      _big('ජනගහනය', st.population),
                      _big('පුරුෂ', st.male),
                      _big('ස්ත්‍රී', st.female),
                      _big('පවුල්', st.familiesCount),
                      _big('නිවාස', st.housesCount),
                      _big('ඉඩම්', st.landsCount),
                      _big('තාවකාලිකව නැති', st.away),
                    ],
                  ),
                ),
              ),
              ..._counter('වයස් කාණ්ඩ', st.ageGroup, null, order: ageGroups),
              ..._counter('ජාතිය', st.ethnicity, PL.ethnicity),
              ..._counter('ආගම', st.religion, PL.religion),
              ..._counter('අධ්‍යාපනය', st.education, PL.education),
              ..._counter('රැකියාව', st.occupation, PL.occupation),
              ..._counter('ආබාධිත', st.disability, PL.disability),
              ..._counter('විවාහක තත්ත්වය', st.civilStatus, PL.civilStatus),
              ..._counter('ඡන්ද හිමි (18+)', st.voters, PL.yesNoUnknown),
              ..._counter('සුබසාධන ප්‍රතිලාභ (පවුල්)', st.welfare, PL.welfare),
              ..._counter('මාසික ආදායම (පවුල්)', st.income, PL.incomeRange),
              ..._counter('නිවසට අයිතිය', st.tenure, PL.tenure),
              ..._counter('ඉන්ධන', st.fuel, PL.cookingFuel),
              ..._counter('නිවාස — ස්ථිරභාවය', st.permanence, PL.permanence),
              ..._counter('නිවාස — තත්ත්වය', st.condition, PL.condition),
              ..._counter('ජල මූලාශ්‍රය', st.water, PL.water),
              ..._counter('වැසිකිළි', st.toilet, PL.toilet),
              ..._counter('විදුලිය', st.electricity, PL.electricity),
              ..._counter('සියලු ගොඩනැගිලි', st.buildingType, PL.buildingType),
              if (st.landsCount > 0) ...[
                const SectionTitle('ඉඩම්'),
                InfoRow('මුළු ප්‍රමාණය', '${formatExtent(st.totalExtent)} (${formatHectares(st.totalExtent)})'),
                InfoRow('ආරවුල් ඇති ඉඩම්', '${st.disputes}'),
              ],
              ..._counter('ඉඩම් — අයිතිය', st.ownership, PL.ownership),
              ..._counter('ඉඩම් — භාවිතය', st.landUse, PL.landUse),
              ..._counter('ගස් (ගණනය කළ)', st.treeCounts, PL.treeCountSpecies),
              ..._counter('වටිනා / දැව ගස්', st.treeSingles, PL.treeSingleSpecies),
              ..._counter('බෝග (පර්චස්)', st.cropPerches, PL.crop),
              ..._counter('බෝග (පැළ ගණන)', st.cropPlants, PL.crop),
              ..._counter('සතුන්', st.animals, PL.animal),
              if (st.dailyMilk > 0) InfoRow('දෛනික කිරි නිෂ්පාදනය', 'ලීටර් ${st.dailyMilk.toStringAsFixed(1)}'),
            ],
          );
        },
      ),
    );
  }

  Widget _big(String label, int v) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(nf.format(v), style: Theme.of(context).textTheme.headlineSmall),
          Text(label),
        ],
      );
}

// ===================================================================
// Ready-made lists
// ===================================================================

class ReadyListsScreen extends StatelessWidget {
  const ReadyListsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final db = AppState.db;
    return Scaffold(
      appBar: AppBar(title: const Text('සූදානම් ලැයිස්තු')),
      body: StreamBuilder<Snapshot>(
        stream: db.watchSnapshot(),
        builder: (context, snap) {
          final s = snap.data;
          if (s == null) return const Center(child: CircularProgressIndicator());
          final now = DateTime.now();
          return ListView(
            children: [
              for (final r in readyLists)
                ListTile(
                  leading: const Icon(Icons.list),
                  title: Text(r.title),
                  trailing: Text('${r.run(s, now).length}', style: Theme.of(context).textTheme.titleMedium),
                  onTap: () => push(context, ListResultScreen(list: r)),
                ),
            ],
          );
        },
      ),
    );
  }
}

class ListResultScreen extends StatefulWidget {
  const ListResultScreen({super.key, required this.list});
  final ReadyList list;
  @override
  State<ListResultScreen> createState() => _ListResultScreenState();
}

class _ListResultScreenState extends State<ListResultScreen> {
  String? _village;

  @override
  Widget build(BuildContext context) {
    final db = AppState.db;
    return StreamBuilder<Snapshot>(
      stream: db.watchSnapshot(),
      builder: (context, snap) {
        final all = snap.data;
        final hits = all == null ? <ListHit>[] : widget.list.run(all.forVillage(_village), DateTime.now());
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.list.title),
            actions: [
              IconButton(
                tooltip: 'Excel',
                icon: const Icon(Icons.ios_share),
                onPressed: hits.isEmpty
                    ? null
                    : () => shareFile(buildListWorkbook(widget.list.title, hits),
                        '${widget.list.id}-${stamp()}.xlsx'),
              ),
            ],
          ),
          body: all == null
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    _VillageFilter(s: all, value: _village, onChanged: (v) => setState(() => _village = v)),
                    Expanded(child: HitList(hits)),
                  ],
                ),
        );
      },
    );
  }
}

class HitList extends StatelessWidget {
  const HitList(this.hits, {super.key});
  final List<ListHit> hits;

  @override
  Widget build(BuildContext context) {
    if (hits.isEmpty) return const EmptyHint('කිසිවක් නැත', icon: Icons.check_circle_outline);
    return ListView.builder(
      itemCount: hits.length,
      itemBuilder: (context, i) {
        final h = hits[i];
        return ListTile(
          leading: CircleAvatar(child: Text('${i + 1}', style: const TextStyle(fontSize: 12))),
          title: Text(h.title),
          subtitle: Text(h.subtitle),
          onTap: h.personId != null
              ? () => push(context, PersonCard(personId: h.personId!))
              : h.landId != null
                  ? () => push(context, LandCard(landId: h.landId!))
                  : null,
        );
      },
    );
  }
}

// ===================================================================
// Data quality
// ===================================================================

class QualityScreen extends StatelessWidget {
  const QualityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final db = AppState.db;
    return Scaffold(
      appBar: AppBar(title: const Text('දත්ත ගුණාත්මකභාවය')),
      body: StreamBuilder<Snapshot>(
        stream: db.watchSnapshot(),
        builder: (context, snap) {
          final s = snap.data;
          if (s == null) return const Center(child: CircularProgressIndicator());
          final sections = qualityReport(s);
          return ListView(
            children: [
              for (final q in sections)
                ListTile(
                  leading: Icon(
                    q.hits.isEmpty ? Icons.check_circle : Icons.warning_amber,
                    color: q.hits.isEmpty ? Colors.green : Colors.orange.shade800,
                  ),
                  title: Text(q.title),
                  trailing: Text('${q.hits.length}', style: Theme.of(context).textTheme.titleMedium),
                  onTap: q.hits.isEmpty
                      ? null
                      : () => push(
                            context,
                            Scaffold(appBar: AppBar(title: Text(q.title)), body: HitList(q.hits)),
                          ),
                ),
            ],
          );
        },
      ),
    );
  }
}
