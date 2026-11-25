import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../app_state.dart';
import '../../data/analytics.dart';
import '../../data/bundle.dart';
import '../../data/export_excel.dart';
import '../../data/picklists.dart';
import '../../data/units.dart';
import '../../theme.dart';
import '../land/land_card.dart';
import '../land/land_sections.dart';
import '../people/person_card.dart';
import '../widgets/brand.dart';
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
    final db = AppState.db;
    return BrandPage(
      title: 'වාර්තා',
      subtitle: 'සංඛ්‍යාලේඛන, ලැයිස්තු, දත්ත පරීක්ෂාව',
      icon: Icons.bar_chart_rounded,
      body: StreamBuilder<Snapshot>(
        stream: db.watchSnapshot(),
        builder: (context, snap) {
          final s = snap.data;
          final now = DateTime.now();
          final issues = s == null ? 0 : qualityReport(s).fold<int>(0, (a, q) => a + q.hits.length);
          final lists = s == null ? 0 : readyLists.where((r) => r.run(s, now).isNotEmpty).length;
          return GridView.count(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.95,
            children: [
              _HubTile(Icons.insights_rounded, Brand.slate, 'වසම් සංඛ්‍යාලේඛන',
                  'ජනගහනය, නිවාස, ඉඩම්, ගස්, සතුන්', () => push(context, const StatsScreen())),
              _HubTile(Icons.list_alt_rounded, Brand.terracotta, 'සූදානම් ලැයිස්තු',
                  'ලැයිස්තු ${readyLists.length} • දත්ත ඇති $lists', () => push(context, const ReadyListsScreen())),
              _HubTile(Icons.fact_check_rounded, Brand.gold, 'දත්ත පරීක්ෂාව',
                  issues == 0 ? 'ගැටලු නැත' : 'පරීක්ෂා කිරීමට $issues', () => push(context, const QualityScreen()),
                  badge: issues == 0 ? null : '$issues'),
              _HubTile(Icons.table_view_rounded, Brand.olive, 'Excel අපනයනය',
                  'සියලු දත්ත එක් ගොනුවකට', () => _export(context)),
            ],
          );
        },
      ),
    );
  }
}

class _HubTile extends StatelessWidget {
  const _HubTile(this.icon, this.color, this.title, this.sub, this.onTap, {this.badge});
  final IconData icon;
  final Color color;
  final String title, sub;
  final VoidCallback onTap;
  final String? badge;

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
          side: const BorderSide(color: Brand.line),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Stack(
            children: [
              Positioned(
                right: -18,
                bottom: -18,
                child: Icon(icon, size: 110, color: color.withValues(alpha: 0.07)),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
                        child: Icon(icon, color: Colors.white, size: 28),
                      ),
                      const Spacer(),
                      if (badge != null)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(color: Brand.warn, borderRadius: BorderRadius.circular(10)),
                          child: Text(badge!,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
                        ),
                    ]),
                    const Spacer(),
                    Text(title,
                        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Brand.brownDark)),
                    const SizedBox(height: 2),
                    Text(sub, maxLines: 2, style: const TextStyle(fontSize: 13, color: Brand.muted)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

// ===================================================================
// Village filter (in the header)
// ===================================================================

Widget _villageChips(Snapshot s, String? value, ValueChanged<String?> onChanged) => HeaderChips(items: [
      ('මුළු වසම', value == null, () => onChanged(null)),
      for (final v in s.villages) (v.name, value == v.id, () => onChanged(v.id)),
    ]);

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

  Widget? _counter(String title, IconData icon, Color color, Counter c, String? list,
      {List<String>? order, String suffix = ''}) {
    if (c.counts.isEmpty) return null;
    final entries = order == null
        ? c.sorted()
        : [
            for (final k in [...order, 'unknown'])
              if (c.counts[k] != null) MapEntry(k, c.counts[k]!),
          ];
    final max = entries.map((e) => e.value).reduce((a, b) => a > b ? a : b);
    return SectionCard(
      title: title,
      icon: icon,
      color: color,
      trailing: Pill(nf.format(c.total), color: color),
      children: [
        for (final e in entries)
          BarRow(
            e.key == 'unknown' ? 'සඳහන් කර නැත' : list == null ? e.key : pl(list, e.key),
            e.value,
            max,
            color: color,
            suffix: suffix,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final db = AppState.db;
    return StreamBuilder<Snapshot>(
      stream: db.watchSnapshot(),
      builder: (context, snap) {
        final all = snap.data;
        if (all == null) {
          return const BrandPage(title: 'වසම් සංඛ්‍යාලේඛන', body: Center(child: CircularProgressIndicator()));
        }
        final s = all.forVillage(_village);
        final st = computeStats(s);
        return BrandPage(
          title: 'වසම් සංඛ්‍යාලේඛන',
          subtitle: 'සජීවී — ඇතුළත් කරන විට ස්වයංක්‍රීයව යාවත්කාලීන වේ',
          headerChild: _villageChips(all, _village, (v) => setState(() => _village = v)),
          body: ListView(
            padding: const EdgeInsets.only(bottom: 40),
            children: [
              SectionCard(
                title: 'සාරාංශය',
                icon: Icons.dashboard_rounded,
                children: [
                  const SizedBox(height: 4),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                    MiniStat(Icons.groups_rounded, nf.format(st.population), 'ජනගහනය', Brand.brown),
                    MiniStat(Icons.man_rounded, nf.format(st.male), 'පුරුෂ', Brand.slate),
                    MiniStat(Icons.woman_rounded, nf.format(st.female), 'ස්ත්‍රී', Brand.terracotta),
                  ]),
                  const SizedBox(height: 12),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                    MiniStat(Icons.family_restroom_rounded, nf.format(st.familiesCount), 'පවුල්', Brand.clay),
                    MiniStat(Icons.home_rounded, nf.format(st.housesCount), 'නිවාස', Brand.gold),
                    MiniStat(Icons.landscape_rounded, nf.format(st.landsCount), 'ඉඩම්', Brand.olive),
                  ]),
                  if (st.away > 0)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Center(child: Pill('තාවකාලිකව නැති ${st.away}', color: Brand.muted)),
                    ),
                ],
              ),
              ...[
                _counter('වයස් කාණ්ඩ', Icons.cake_rounded, Brand.brown, st.ageGroup, null, order: ageGroups),
                _counter('ජාතිය', Icons.diversity_3_rounded, Brand.clay, st.ethnicity, PL.ethnicity),
                _counter('ආගම', Icons.temple_buddhist_rounded, Brand.gold, st.religion, PL.religion),
                _counter('අධ්‍යාපනය', Icons.school_rounded, Brand.slate, st.education, PL.education),
                _counter('රැකියාව', Icons.work_rounded, Brand.brownMid, st.occupation, PL.occupation),
                _counter('ආබාධිත', Icons.accessible_rounded, Brand.terracotta, st.disability, PL.disability),
                _counter('විවාහක තත්ත්වය', Icons.favorite_rounded, Brand.terracotta, st.civilStatus, PL.civilStatus),
                _counter('ඡන්ද හිමි (18+)', Icons.how_to_vote_rounded, Brand.slate, st.voters, PL.yesNoUnknown),
                _counter('සුබසාධන ප්‍රතිලාභ', Icons.volunteer_activism_rounded, Brand.olive, st.welfare, PL.welfare),
                _counter('මාසික ආදායම', Icons.payments_rounded, Brand.gold, st.income, PL.incomeRange),
                _counter('නිවසට අයිතිය', Icons.key_rounded, Brand.clay, st.tenure, PL.tenure),
                _counter('ඉන්ධන', Icons.local_fire_department_rounded, Brand.terracotta, st.fuel, PL.cookingFuel),
                _counter('නිවාස — ස්ථිරභාවය', Icons.home_rounded, Brand.gold, st.permanence, PL.permanence),
                _counter('නිවාස — තත්ත්වය', Icons.construction_rounded, Brand.warn, st.condition, PL.condition),
                _counter('ජල මූලාශ්‍රය', Icons.water_drop_rounded, Brand.slate, st.water, PL.water),
                _counter('වැසිකිළි', Icons.wc_rounded, Brand.brownMid, st.toilet, PL.toilet),
                _counter('විදුලිය', Icons.bolt_rounded, Brand.gold, st.electricity, PL.electricity),
                _counter('සියලු ගොඩනැගිලි', Icons.home_work_rounded, Brand.clay, st.buildingType, PL.buildingType),
              ].whereType<Widget>(),
              if (st.landsCount > 0)
                SectionCard(
                  title: 'ඉඩම්',
                  icon: Icons.landscape_rounded,
                  color: Brand.olive,
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 6),
                  children: [
                    InfoRow('මුළු ප්‍රමාණය', '${formatExtent(st.totalExtent)} (${formatHectares(st.totalExtent)})'),
                    InfoRow('ආරවුල් ඇති ඉඩම්', '${st.disputes}'),
                  ],
                ),
              ...[
                _counter('ඉඩම් — අයිතිය', Icons.gavel_rounded, Brand.olive, st.ownership, PL.ownership),
                _counter('ඉඩම් — භාවිතය', Icons.grass_rounded, Brand.olive, st.landUse, PL.landUse),
                _counter('ගස් (ගණනය කළ)', Icons.park_rounded, Brand.ok, st.treeCounts, PL.treeCountSpecies),
                _counter('වටිනා / දැව ගස්', Icons.forest_rounded, Brand.ok, st.treeSingles, PL.treeSingleSpecies),
                _counter('බෝග (පර්චස්)', Icons.agriculture_rounded, Brand.gold, st.cropPerches, PL.crop),
                _counter('බෝග (පැළ)', Icons.spa_rounded, Brand.gold, st.cropPlants, PL.crop),
                _counter('සතුන්', Icons.pets_rounded, Brand.slate, st.animals, PL.animal),
              ].whereType<Widget>(),
              if (st.dailyMilk > 0)
                ListCard(
                  margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  icon: Icons.local_drink_rounded,
                  color: Brand.slate,
                  title: 'දෛනික කිරි නිෂ්පාදනය',
                  subtitle: 'ලීටර් ${st.dailyMilk.toStringAsFixed(1)}',
                ),
            ],
          ),
        );
      },
    );
  }
}

// ===================================================================
// Ready-made lists
// ===================================================================

const _listIcons = <String, (IconData, Color)>{
  'elderly60': (Icons.elderly_rounded, Brand.brown),
  'alone70': (Icons.elderly_woman_rounded, Brand.terracotta),
  'under5': (Icons.child_care_rounded, Brand.gold),
  'school': (Icons.school_rounded, Brand.slate),
  'disabled': (Icons.accessible_rounded, Brand.terracotta),
  'away': (Icons.flight_takeoff_rounded, Brand.slate),
  'no_nic': (Icons.badge_rounded, Brand.warn),
  'welfare': (Icons.volunteer_activism_rounded, Brand.olive),
  'poor_houses': (Icons.house_siding_rounded, Brand.warn),
  'temp_houses': (Icons.cottage_rounded, Brand.clay),
  'no_toilet': (Icons.wc_rounded, Brand.brownMid),
  'no_power': (Icons.power_off_rounded, Brand.gold),
  'unsafe_water': (Icons.water_drop_rounded, Brand.slate),
  'state_land': (Icons.account_balance_rounded, Brand.olive),
  'disputes': (Icons.gavel_rounded, Brand.warn),
  'milk': (Icons.local_drink_rounded, Brand.slate),
  'dogs': (Icons.pets_rounded, Brand.clay),
  'timber': (Icons.forest_rounded, Brand.ok),
  'hazard_trees': (Icons.warning_rounded, Brand.warn),
};

(IconData, Color) listIcon(String id) => _listIcons[id] ?? (Icons.list_rounded, Brand.brownMid);

class ReadyListsScreen extends StatelessWidget {
  const ReadyListsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final db = AppState.db;
    return BrandPage(
      title: 'සූදානම් ලැයිස්තු',
      subtitle: 'එක තට්ටුවකින් — Excel ලෙසද ලබාගත හැක',
      body: StreamBuilder<Snapshot>(
        stream: db.watchSnapshot(),
        builder: (context, snap) {
          final s = snap.data;
          if (s == null) return const Center(child: CircularProgressIndicator());
          final now = DateTime.now();
          return ListView(
            padding: const EdgeInsets.fromLTRB(0, 14, 0, 32),
            children: [
              for (final r in readyLists)
                () {
                  final n = r.run(s, now).length;
                  final (icon, color) = listIcon(r.id);
                  return ListCard(
                    icon: icon,
                    color: color,
                    title: r.title,
                    trailing: Pill('$n', color: n == 0 ? Brand.muted : color),
                    onTap: () => push(context, ListResultScreen(list: r)),
                  );
                }(),
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
        return BrandPage(
          title: widget.list.title,
          subtitle: all == null ? null : 'ප්‍රතිඵල ${hits.length}',
          actions: [
            if (hits.isNotEmpty)
              HeaderAction(Icons.ios_share_rounded,
                  () => shareFile(buildListWorkbook(widget.list.title, hits), '${widget.list.id}-${stamp()}.xlsx'),
                  tooltip: 'Excel'),
          ],
          headerChild: all == null ? null : _villageChips(all, _village, (v) => setState(() => _village = v)),
          body: all == null
              ? const Center(child: CircularProgressIndicator())
              : HitList(hits, iconColor: listIcon(widget.list.id)),
        );
      },
    );
  }
}

class HitList extends StatelessWidget {
  const HitList(this.hits, {super.key, this.iconColor});
  final List<ListHit> hits;
  final (IconData, Color)? iconColor;

  @override
  Widget build(BuildContext context) {
    if (hits.isEmpty) {
      return ListView(children: const [EmptyHint('කිසිවක් නැත', icon: Icons.check_circle_outline_rounded)]);
    }
    final color = iconColor?.$2 ?? Brand.brownMid;
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(0, 14, 0, 32),
      itemCount: hits.length,
      itemBuilder: (context, i) {
        final h = hits[i];
        return ListCard(
          leading: Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: color.withValues(alpha: 0.13), shape: BoxShape.circle),
            child: Text('${i + 1}', style: TextStyle(color: color, fontWeight: FontWeight.w800)),
          ),
          title: h.title,
          subtitle: h.subtitle,
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
    return StreamBuilder<Snapshot>(
      stream: db.watchSnapshot(),
      builder: (context, snap) {
        final s = snap.data;
        final sections = s == null ? <QualitySection>[] : qualityReport(s);
        final total = sections.fold<int>(0, (a, q) => a + q.hits.length);
        return BrandPage(
          title: 'දත්ත පරීක්ෂාව',
          subtitle: s == null ? null : (total == 0 ? 'සියල්ල හරි ✓' : 'පරීක්ෂා කිරීමට $total ක් ඇත'),
          body: s == null
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  padding: const EdgeInsets.fromLTRB(0, 14, 0, 32),
                  children: [
                    for (final q in sections)
                      ListCard(
                        icon: q.hits.isEmpty ? Icons.check_circle_rounded : Icons.error_outline_rounded,
                        color: q.hits.isEmpty ? Brand.ok : Brand.warn,
                        title: q.title,
                        trailing: Pill('${q.hits.length}', color: q.hits.isEmpty ? Brand.ok : Brand.warn),
                        onTap: q.hits.isEmpty
                            ? null
                            : () => push(
                                  context,
                                  BrandPage(title: q.title, subtitle: '${q.hits.length}', body: HitList(q.hits)),
                                ),
                      ),
                  ],
                ),
        );
      },
    );
  }
}
