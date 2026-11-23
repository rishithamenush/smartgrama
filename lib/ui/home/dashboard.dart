import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../app_state.dart';
import '../../data/analytics.dart';
import '../../data/bundle.dart';
import '../../data/database.dart';
import '../../theme.dart';
import '../land/land_sections.dart';
import '../land/land_wizard.dart';
import '../reports/reports_screen.dart';
import '../settings/settings_screen.dart';
import '../widgets/art.dart';
import 'land_list_screen.dart';

/// මුල් පිටුව — greeting header with village scene, survey progress ring,
/// the main "new place" action, division at a glance, shortcuts, data
/// checks and per-village progress.
class Dashboard extends StatelessWidget {
  const Dashboard({super.key, required this.onOpenTab});
  final ValueChanged<int> onOpenTab;

  @override
  Widget build(BuildContext context) {
    final db = AppState.db;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: StreamBuilder<(Division?, Snapshot)>(
          stream: db.watchLoad([...db.recordTables, db.divisions],
              () async => (await db.loadDivision(), await db.loadSnapshot())),
          builder: (context, snap) {
            final data = snap.data;
            if (data == null) return const Center(child: CircularProgressIndicator());
            return _Body(division: data.$1, s: data.$2, onOpenTab: onOpenTab);
          },
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.division, required this.s, required this.onOpenTab});
  final Division? division;
  final Snapshot s;
  final ValueChanged<int> onOpenTab;

  @override
  Widget build(BuildContext context) {
    final nf = NumberFormat.decimalPattern();
    final st = computeStats(s);
    final progress = surveyProgress(s);
    final done = progress.fold<int>(0, (a, p) => a + p.done);
    final verified = progress.fold<int>(0, (a, p) => a + p.verified);
    final target = progress.fold<int>(0, (a, p) => a + p.target);
    final overall = target == 0 ? 0.0 : (done / target).clamp(0.0, 1.0);
    final now = DateTime.now();
    final todayCount = s.lands
        .where((l) => l.createdAt.year == now.year && l.createdAt.month == now.month && l.createdAt.day == now.day)
        .length;
    final issues = qualityReport(s).fold<int>(0, (a, q) => a + q.hits.length);
    final top = MediaQuery.of(context).padding.top;
    final officer = (division?.officerName ?? '').trim();

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        // ---------------------------------------------------------- header
        Stack(
          children: [
            BrandHeader(height: top + 238),
            Padding(
              padding: EdgeInsets.fromLTRB(18, top + 8, 8, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const AppLogo(size: 40),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('SmartGrama',
                                style: TextStyle(color: Brand.gold, fontWeight: FontWeight.w800, fontSize: 17)),
                            Text('ග්‍රාම නිලධාරී වසම් තොරතුරු',
                                style: TextStyle(color: Colors.white70, fontSize: 12)),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.settings_outlined, color: Colors.white),
                        onPressed: () => push(context, const SettingsScreen()),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Text('${timeGreeting(now)},',
                      style: const TextStyle(color: Colors.white70, fontSize: 15)),
                  Text(officer.isEmpty ? 'ආයුබෝවන්!' : 'ආයුබෝවන් $officer',
                      style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 6),
                  Text(
                    [
                      if (division != null) '${division!.code} — ${division!.name}',
                      if ((division?.dsDivision ?? '').isNotEmpty) division!.dsDivision,
                    ].join('  •  '),
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.14),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      const Icon(Icons.calendar_today_rounded, size: 14, color: Brand.goldLight),
                      const SizedBox(width: 6),
                      Text(sinhalaDate(now), style: const TextStyle(color: Brand.goldLight, fontSize: 12)),
                    ]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, top + 206, 16, 0),
              child: _ProgressCard(
                overall: overall,
                done: done,
                target: target,
                verified: verified,
                today: todayCount,
              ),
            ),
          ],
        ),

        // ---------------------------------------------------------- main action
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
          child: _NewPlaceButton(onTap: () => startNewLand(Navigator.of(context))),
        ),

        if (issues > 0)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            child: Material(
              color: Brand.warnBg,
              borderRadius: BorderRadius.circular(16),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () => push(context, const QualityScreen()),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(children: [
                    const IconBadge(Icons.fact_check_outlined, Brand.warn, size: 40),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('දත්ත පරීක්ෂා කිරීමට $issues ක් ඇත',
                            style: const TextStyle(fontWeight: FontWeight.w700, color: Brand.warn)),
                        const Text('හැඳුනුම්පත්, GPS, ඡායාරූප, අනුපිටපත්…',
                            style: TextStyle(fontSize: 12, color: Brand.brownMid)),
                      ]),
                    ),
                    const Icon(Icons.chevron_right, color: Brand.warn),
                  ]),
                ),
              ),
            ),
          ),

        // ---------------------------------------------------------- at a glance
        const _SectionHeader('වසම එක බැල්මෙන්', Icons.insights_rounded),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.count(
            crossAxisCount: 3,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.92,
            children: [
              _StatTile('ජනගහනය', nf.format(st.population), Icons.groups_rounded, Brand.brown,
                  sub: 'පු ${st.male} • ස්ත්‍රී ${st.female}', onTap: () => push(context, const StatsScreen())),
              _StatTile('පවුල්', nf.format(st.familiesCount), Icons.family_restroom_rounded, Brand.terracotta,
                  onTap: () => push(context, const StatsScreen())),
              _StatTile('නිවාස', nf.format(st.housesCount), Icons.home_rounded, Brand.gold,
                  onTap: () => push(context, const StatsScreen())),
              _StatTile('ඉඩම්', nf.format(st.landsCount), Icons.landscape_rounded, Brand.olive,
                  onTap: () => onOpenTab(1)),
              _StatTile('ගස්', nf.format(st.treesTotal), Icons.park_rounded, Brand.ok,
                  onTap: () => push(context, const StatsScreen())),
              _StatTile('සතුන්', nf.format(st.animalsTotal), Icons.pets_rounded, Brand.slate,
                  onTap: () => push(context, const StatsScreen())),
            ],
          ),
        ),

        // ---------------------------------------------------------- shortcuts
        const _SectionHeader('ඉක්මන් ප්‍රවේශය', Icons.bolt_rounded),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              _Shortcut('සෙවීම', Icons.search_rounded, Brand.brownMid, () => onOpenTab(2)),
              _Shortcut('සිතියම', Icons.map_rounded, Brand.olive, () => onOpenTab(3)),
              _Shortcut('ලැයිස්තු', Icons.list_alt_rounded, Brand.terracotta,
                  () => push(context, const ReadyListsScreen())),
              _Shortcut('වාර්තා', Icons.bar_chart_rounded, Brand.slate, () => onOpenTab(4)),
            ],
          ),
        ),

        // ---------------------------------------------------------- villages
        const _SectionHeader('ගම්මාන අනුව ප්‍රගතිය', Icons.holiday_village_rounded),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 8, 14, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final v in s.villages) ...[
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 2),
                    child: Row(children: [
                      const Icon(Icons.location_on_rounded, size: 16, color: Brand.gold),
                      const SizedBox(width: 4),
                      Text(v.name, style: const TextStyle(fontWeight: FontWeight.w700, color: Brand.brownDark)),
                    ]),
                  ),
                  for (final p in progress.where((p) => p.group.villageId == v.id))
                    _GroupRow(p, onTap: () => push(context, LandListScreen(initialGroupId: p.group.id))),
                ],
                if (s.villages.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('ගම්මාන තවම නැත — සැකසුම් වලින් එකතු කරන්න.'),
                  ),
                if (s.groups.any((g) => g.expectedLands == null))
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'ඉඟිය: සැකසුම් → ගම්මාන හා ගෘහ කණ්ඩායම් හි "දළ ඉඩම් ගණන" දුන් විට ප්‍රගතිය නිවැරදිව පෙන්වයි.',
                      style: TextStyle(fontSize: 12, color: Brand.muted),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 28),
      ],
    );
  }
}

class _ProgressCard extends StatelessWidget {
  const _ProgressCard({
    required this.overall,
    required this.done,
    required this.target,
    required this.verified,
    required this.today,
  });
  final double overall;
  final int done, target, verified, today;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(color: Brand.brownDark.withValues(alpha: 0.18), blurRadius: 18, offset: const Offset(0, 8)),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 88,
            height: 88,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: overall,
                  strokeWidth: 9,
                  strokeCap: StrokeCap.round,
                  color: overall >= 1 ? Brand.ok : Brand.gold,
                  backgroundColor: Brand.sand,
                ),
                Center(
                  child: Text('${(overall * 100).round()}%',
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Brand.brownDark)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('සමීක්ෂණ ප්‍රගතිය',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Brand.brownDark)),
                const SizedBox(height: 4),
                Text('ස්ථාන $done / $target සම්පූර්ණයි', style: const TextStyle(color: Brand.brownMid)),
                const SizedBox(height: 8),
                Wrap(spacing: 6, runSpacing: 6, children: [
                  _Pill(Icons.today_rounded, 'අද $today', Brand.gold),
                  _Pill(Icons.verified_rounded, 'තහවුරු $verified', Brand.ok),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill(this.icon, this.text, this.color);
  final IconData icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(color: color.withValues(alpha: 0.13), borderRadius: BorderRadius.circular(12)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(text, style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.w600)),
        ]),
      );
}

class _NewPlaceButton extends StatelessWidget {
  const _NewPlaceButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Material(
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAlias,
        child: Ink(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Brand.brown, Brand.brownMid]),
          ),
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 12, 16),
              child: Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(color: Brand.gold, borderRadius: BorderRadius.circular(16)),
                    child: const Icon(Icons.add_home_work_rounded, color: Brand.brownDark, size: 28),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('නව ස්ථානයක් ඇතුළත් කරන්න',
                            style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700)),
                        SizedBox(height: 2),
                        Text('ඉඩම • ගොඩනැගිලි • පවුල් • ගස් • සතුන්',
                            style: TextStyle(color: Brand.goldLight, fontSize: 12)),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white70, size: 18),
                ],
              ),
            ),
          ),
        ),
      );
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.title, this.icon);
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(18, 22, 16, 10),
        child: Row(children: [
          Icon(icon, size: 20, color: Brand.gold),
          const SizedBox(width: 8),
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Brand.brownDark)),
        ]),
      );
}

class _StatTile extends StatelessWidget {
  const _StatTile(this.label, this.value, this.icon, this.color, {this.sub, this.onTap});
  final String label, value;
  final IconData icon;
  final Color color;
  final String? sub;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(color: Brand.line),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconBadge(icon, color, size: 38),
                const Spacer(),
                FittedBox(
                  child: Text(value,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Brand.brownDark)),
                ),
                Text(label, style: const TextStyle(color: Brand.muted, fontSize: 13)),
                if (sub != null)
                  Text(sub!, maxLines: 1, overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Brand.muted, fontSize: 10)),
              ],
            ),
          ),
        ),
      );
}

class _Shortcut extends StatelessWidget {
  const _Shortcut(this.label, this.icon, this.color, this.onTap);
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Expanded(
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Column(children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Brand.line),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(height: 6),
              Text(label, style: const TextStyle(fontSize: 12, color: Brand.brownDark)),
            ]),
          ),
        ),
      );
}

class _GroupRow extends StatelessWidget {
  const _GroupRow(this.p, {required this.onTap});
  final GroupProgress p;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final complete = p.fraction >= 1;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(children: [
          SizedBox(width: 78, child: Text(p.group.code, style: const TextStyle(color: Brand.brownMid))),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: p.fraction.clamp(0, 1),
                minHeight: 10,
                color: complete ? Brand.ok : Brand.gold,
                backgroundColor: Brand.sand,
              ),
            ),
          ),
          SizedBox(
            width: 84,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text('${p.done}/${p.target}', style: const TextStyle(fontWeight: FontWeight.w600)),
              if (complete)
                const Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Icon(Icons.check_circle_rounded, size: 16, color: Brand.ok),
                ),
            ]),
          ),
        ]),
      ),
    );
  }
}
