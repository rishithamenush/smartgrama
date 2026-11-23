import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../app_state.dart';
import '../../data/analytics.dart';
import '../../data/bundle.dart';
import '../../data/database.dart';
import '../land/land_sections.dart';
import '../land/land_wizard.dart';
import '../reports/reports_screen.dart';
import '../settings/settings_screen.dart';
import '../widgets/common.dart';
import 'land_list_screen.dart';
import '../../theme.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key, required this.onOpenTab});
  final ValueChanged<int> onOpenTab;

  @override
  Widget build(BuildContext context) {
    final db = AppState.db;
    final nf = NumberFormat.decimalPattern();
    return StreamBuilder<(Division?, Snapshot)>(
      stream: db.watchLoad([...db.recordTables, db.divisions],
          () async => (await db.loadDivision(), await db.loadSnapshot())),
      builder: (context, snap) {
        final data = snap.data;
        final division = data?.$1;
        final s = data?.$2;
        return Scaffold(
          appBar: AppBar(
            title: Text(division == null ? 'SmartGrama' : '${division.code} — ${division.name}'),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () => push(context, const SettingsScreen()),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => startNewLand(Navigator.of(context)),
            icon: const Icon(Icons.add_home_work),
            label: const Text('නව ස්ථානයක්'),
          ),
          body: s == null
              ? const Center(child: CircularProgressIndicator())
              : _body(context, s, nf),
        );
      },
    );
  }

  Widget _body(BuildContext context, Snapshot s, NumberFormat nf) {
    final st = computeStats(s);
    final progress = surveyProgress(s);
    final done = progress.fold<int>(0, (a, p) => a + p.done);
    final target = progress.fold<int>(0, (a, p) => a + p.target);
    final overall = target == 0 ? 0.0 : done / target;
    final today = DateTime.now();
    final todayCount = s.lands
        .where((l) =>
            l.createdAt.year == today.year && l.createdAt.month == today.month && l.createdAt.day == today.day)
        .length;
    final issues = qualityReport(s).fold<int>(0, (a, q) => a + q.hits.length);

    return ListView(
      padding: const EdgeInsets.only(bottom: 96),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
          child: GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1.05,
            children: [
              StatTile('ජනගහනය', nf.format(st.population), Icons.people, onTap: () => onOpenTab(4)),
              StatTile('පවුල්', nf.format(st.familiesCount), Icons.family_restroom, onTap: () => onOpenTab(4)),
              StatTile('නිවාස', nf.format(st.housesCount), Icons.home, onTap: () => onOpenTab(4)),
              StatTile('ඉඩම්', nf.format(st.landsCount), Icons.landscape, onTap: () => onOpenTab(1)),
              StatTile('ගස්', nf.format(st.treesTotal), Icons.park, onTap: () => onOpenTab(4)),
              StatTile('සතුන්', nf.format(st.animalsTotal), Icons.pets, onTap: () => onOpenTab(4)),
            ],
          ),
        ),
        if (issues > 0)
          Card(
            color: Brand.warnBg,
            child: ListTile(
              leading: Icon(Icons.rule, color: Brand.warn),
              title: Text('දත්ත පරීක්ෂා කිරීමට $issues ක් ඇත'),
              subtitle: const Text('හැඳුනුම්පත්, GPS, ඡායාරූප, අනුපිටපත්…'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => push(context, const QualityScreen()),
            ),
          ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Expanded(
                    child: Text('සමීක්ෂණ ප්‍රගතිය', style: Theme.of(context).textTheme.titleMedium),
                  ),
                  Text('${(overall * 100).round()}%', style: Theme.of(context).textTheme.titleLarge),
                ]),
                const SizedBox(height: 6),
                LinearProgressIndicator(value: overall.clamp(0, 1), minHeight: 10),
                const SizedBox(height: 4),
                Text('අද ඇතුළත් කළ ස්ථාන: $todayCount'),
                const Divider(),
                for (final v in s.villages) ...[
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(v.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                  ),
                  for (final p in progress.where((p) => p.group.villageId == v.id))
                    InkWell(
                      onTap: () => push(context, LandListScreen(initialGroupId: p.group.id)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(children: [
                          SizedBox(width: 80, child: Text(p.group.code)),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                value: p.fraction.clamp(0, 1),
                                minHeight: 12,
                                color: p.fraction >= 1 ? Brand.ok : null,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 90,
                            child: Text(
                              '${p.done}/${p.target}${p.fraction >= 1 ? ' ✅' : ''}',
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ]),
                      ),
                    ),
                ],
                if (s.groups.any((g) => g.expectedLands == null))
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      'ඉඟිය: සැකසුම් → ගම්මාන හා ගෘහ කණ්ඩායම් හි "දළ ඉඩම් ගණන" ඇතුළත් කළ විට ප්‍රගතිය නිවැරදිව පෙන්වයි.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
