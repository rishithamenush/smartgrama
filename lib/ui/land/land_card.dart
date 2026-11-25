import 'package:flutter/material.dart';

import '../../app_state.dart';
import '../../data/analytics.dart';
import '../../data/bundle.dart';
import '../../data/database.dart';
import '../../data/units.dart';
import '../../theme.dart';
import '../forms/land_form.dart';
import '../widgets/brand.dart';
import '../widgets/common.dart';
import 'land_sections.dart';
import 'land_wizard.dart';

/// Everything about one land on one screen, with tabs.
class LandCard extends StatelessWidget {
  const LandCard({super.key, required this.landId, this.initialTab = 0});
  final String landId;
  final int initialTab;

  @override
  Widget build(BuildContext context) {
    final db = AppState.db;
    return StreamBuilder<LandBundle?>(
      stream: db.watchBundle(landId),
      builder: (context, snap) {
        if (!snap.hasData) {
          return BrandPage(
            title: 'ඉඩම',
            body: snap.connectionState == ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : const EmptyHint('ඉඩම හමු නොවීය'),
          );
        }
        final b = snap.data!;
        if (b.land.deletedAt != null) {
          return const BrandPage(title: 'ඉඩම', body: EmptyHint('මෙම ඉඩම ඉවත් කර ඇත'));
        }
        final check = checkLand(b);
        return DefaultTabController(
          length: 7,
          initialIndex: initialTab,
          child: FutureBuilder<(HouseGroup?, Village?)>(
            future: () async {
              final g = await db.byId(db.houseGroups, b.land.houseGroupId);
              final v = g == null ? null : await db.byId(db.villages, g.villageId);
              return (g, v);
            }(),
            builder: (context, gv) {
              final (g, v) = gv.data ?? (null, null);
              return BrandPage(
                title: b.land.name,
                subtitle: [
                  v?.name,
                  g?.code,
                  if (b.land.extentPerches != null) formatExtent(b.land.extentPerches),
                ].whereType<String>().join('  •  '),
                actions: [
                  HeaderAction(Icons.checklist_rounded, () => push(context, LandWizard(landId: landId)),
                      tooltip: 'පියවරෙන් පියවර'),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
                    onSelected: (val) async {
                      if (val == 'edit') {
                        push(context, LandForm(land: b.land));
                      } else if (val == 'delete') {
                        if (await confirm(
                            context,
                            'මෙම ඉඩම සහ එහි ගොඩනැගිලි, පවුල්, ගස්, සතුන් සියල්ල ඉවත් කරන්නද?\n'
                            '(වැරදීමකින් ඇතුළත් කළා නම් පමණි. ඉතිහාසයේ රැඳේ.)',
                            danger: true)) {
                          await db.deleteLandCascade(landId);
                          if (context.mounted) Navigator.pop(context);
                        }
                      }
                    },
                    itemBuilder: (_) => const [
                      PopupMenuItem(value: 'edit', child: Text('ඉඩම සංස්කරණය')),
                      PopupMenuItem(value: 'delete', child: Text('ඉඩම ඉවත් කරන්න')),
                    ],
                  ),
                ],
                headerChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(spacing: 8, runSpacing: 6, children: [
                      _HeaderPill(Icons.donut_large_rounded, '${check.percent}% සම්පූර්ණයි'),
                      _HeaderPill(
                        b.land.status == 'verified' ? Icons.verified_rounded : Icons.circle,
                        statusLabels[b.land.status] ?? '',
                        color: statusColor(b.land.status),
                      ),
                      if (b.ownerNames.isNotEmpty) _HeaderPill(Icons.person_rounded, b.ownerNames.first),
                    ]),
                    const SizedBox(height: 6),
                    const TabBar(
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      padding: EdgeInsets.zero,
                      labelPadding: EdgeInsets.symmetric(horizontal: 12),
                      indicatorWeight: 3,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelStyle: TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.w800),
                      unselectedLabelStyle: TextStyle(fontFamily: fontFamily, fontSize: 16),
                      tabs: [
                        Tab(text: 'සාරාංශය'),
                        Tab(text: 'ගොඩනැගිලි'),
                        Tab(text: 'මිනිසුන්'),
                        Tab(text: 'ගස් හා බෝග'),
                        Tab(text: 'සතුන්'),
                        Tab(text: 'ඡායාරූප'),
                        Tab(text: 'ඉතිහාසය'),
                      ],
                    ),
                  ],
                ),
                body: TabBarView(
                  children: [
                    SummarySection(b),
                    BuildingsSection(b),
                    PeopleSection(b),
                    NatureSection(b),
                    AnimalsSection(b),
                    PhotosSection(b),
                    HistorySection(landId),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _HeaderPill extends StatelessWidget {
  const _HeaderPill(this.icon, this.text, {this.color});
  final IconData icon;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: color == null ? 0.14 : 0.95),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 14, color: color ?? Brand.goldLight),
          const SizedBox(width: 5),
          Text(text,
              style: TextStyle(
                  color: color ?? Colors.white, fontSize: 13, fontWeight: FontWeight.w700)),
        ]),
      );
}
