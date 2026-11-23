import 'package:flutter/material.dart';

import '../../app_state.dart';
import '../../data/analytics.dart';
import '../../data/bundle.dart';
import '../../data/database.dart';
import '../../data/units.dart';
import '../forms/land_form.dart';
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
          return Scaffold(
            appBar: AppBar(),
            body: snap.connectionState == ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : const EmptyHint('ඉඩම හමු නොවීය'),
          );
        }
        final b = snap.data!;
        if (b.land.deletedAt != null) {
          return Scaffold(appBar: AppBar(), body: const EmptyHint('මෙම ඉඩම ඉවත් කර ඇත'));
        }
        return DefaultTabController(
          length: 7,
          initialIndex: initialTab,
          child: Scaffold(
            appBar: AppBar(
              title: Text(b.land.name),
              actions: [
                IconButton(
                  tooltip: 'පියවරෙන් පියවර',
                  icon: const Icon(Icons.checklist),
                  onPressed: () => push(context, LandWizard(landId: landId)),
                ),
                PopupMenuButton<String>(
                  onSelected: (v) async {
                    if (v == 'edit') {
                      push(context, LandForm(land: b.land));
                    } else if (v == 'delete') {
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
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(96),
                child: Column(
                  children: [
                    _Header(b),
                    const TabBar(
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white70,
                      indicatorColor: Colors.white,
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
              ),
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
          ),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header(this.b);
  final LandBundle b;

  @override
  Widget build(BuildContext context) {
    final check = checkLand(b);
    return FutureBuilder<(HouseGroup?, Village?)>(
      future: () async {
        final g = await AppState.db.byId(AppState.db.houseGroups, b.land.houseGroupId);
        final v = g == null ? null : await AppState.db.byId(AppState.db.villages, g.villageId);
        return (g, v);
      }(),
      builder: (context, snap) {
        final (g, v) = snap.data ?? (null, null);
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 4),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  [
                    v?.name,
                    g?.code,
                    if (b.land.extentPerches != null) formatExtent(b.land.extentPerches),
                    if (b.ownerNames.isNotEmpty) b.ownerNames.first,
                  ].whereType<String>().join(' • '),
                  style: const TextStyle(color: Colors.white),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                child: Text('${check.percent}% • ${statusLabels[b.land.status]}',
                    style: TextStyle(color: statusColor(b.land.status), fontSize: 12)),
              ),
            ],
          ),
        );
      },
    );
  }
}
