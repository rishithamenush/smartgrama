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
import '../../l10n/l10n.dart';

/// Everything about one land on one screen, with tabs.
class LandCard extends StatelessWidget {
  const LandCard({super.key, required this.landId, this.initialTab = 0});
  final String landId;
  final int initialTab;

  @override
  Widget build(BuildContext context) {
    final db = AppState.db;
    final t = context.l10n;
    return StreamBuilder<LandBundle?>(
      stream: db.watchBundle(landId),
      builder: (context, snap) {
        if (!snap.hasData) {
          return BrandPage(
            title: t.land,
            body: snap.connectionState == ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : EmptyHint(t.landNotFound),
          );
        }
        final b = snap.data!;
        if (b.land.deletedAt != null) {
          return BrandPage(title: t.land, body: EmptyHint(t.landRemoved));
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
                      tooltip: t.stepByStep),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
                    onSelected: (val) async {
                      if (val == 'edit') {
                        push(context, LandForm(land: b.land));
                      } else if (val == 'delete') {
                        if (await confirm(context, t.landDeleteConfirm, danger: true)) {
                          await db.deleteLandCascade(landId);
                          if (context.mounted) Navigator.pop(context);
                        }
                      }
                    },
                    itemBuilder: (_) => [
                      PopupMenuItem(value: 'edit', child: Text(t.landEdit)),
                      PopupMenuItem(value: 'delete', child: Text(t.landDelete)),
                    ],
                  ),
                ],
                headerChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(spacing: 8, runSpacing: 6, children: [
                      _HeaderPill(Icons.donut_large_rounded, t.percentComplete(check.percent)),
                      _HeaderPill(
                        b.land.status == 'verified' ? Icons.verified_rounded : Icons.circle,
                        t.landStatus(b.land.status),
                        color: statusColor(b.land.status),
                      ),
                      if (b.ownerNames.isNotEmpty) _HeaderPill(Icons.person_rounded, b.ownerNames.first),
                    ]),
                    const SizedBox(height: 6),
                    TabBar(
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      padding: EdgeInsets.zero,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 12),
                      indicatorWeight: 3,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelStyle: TextStyle(
                          fontFamily: fontFamilyFor(L10n.lang.value), fontSize: 16, fontWeight: FontWeight.w800),
                      unselectedLabelStyle: TextStyle(fontFamily: fontFamilyFor(L10n.lang.value), fontSize: 16),
                      tabs: [
                        Tab(text: t.summary),
                        Tab(text: t.buildings),
                        Tab(text: t.people),
                        Tab(text: t.treesAndCrops),
                        Tab(text: t.animals),
                        Tab(text: t.photos),
                        Tab(text: t.history),
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
