import 'package:flutter/material.dart';

import '../../app_state.dart';
import '../../data/bundle.dart';
import '../../data/database.dart';
import '../../data/units.dart';
import '../../theme.dart';
import '../land/land_card.dart';
import '../land/land_sections.dart';
import '../land/land_wizard.dart';
import '../widgets/brand.dart';
import '../widgets/common.dart';

/// Lands by village / house group with status filter.
class LandListScreen extends StatefulWidget {
  const LandListScreen({super.key, this.initialGroupId});
  final String? initialGroupId;

  @override
  State<LandListScreen> createState() => _LandListScreenState();
}

class _LandListScreenState extends State<LandListScreen> {
  String? _villageId;
  late String? _groupId = widget.initialGroupId;
  String? _status;

  @override
  Widget build(BuildContext context) {
    final db = AppState.db;
    return StreamBuilder<Snapshot>(
      stream: db.watchSnapshot(),
      builder: (context, snap) {
        final s = snap.data;
        if (s != null && _groupId != null && _villageId == null) {
          _villageId = s.groupById[_groupId]?.villageId;
        }
        final groups = s == null
            ? <HouseGroup>[]
            : s.groups.where((g) => _villageId == null || g.villageId == _villageId).toList();
        final groupIds = groups.map((g) => g.id).toSet();
        final all = s == null
            ? <Land>[]
            : s.lands
                .where((l) => _groupId == null ? groupIds.contains(l.houseGroupId) : l.houseGroupId == _groupId)
                .toList();
        final lands = all.where((l) => _status == null || l.status == _status).toList();
        int count(String st) => all.where((l) => l.status == st).length;

        return BrandPage(
          title: 'ඉඩම්',
          subtitle: s == null ? null : 'ඉඩම් ${all.length} • සම්පූර්ණ ${count('complete') + count('verified')}',
          icon: Icons.landscape_rounded,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => startNewLand(Navigator.of(context)),
            icon: const Icon(Icons.add_home_work_rounded),
            label: const Text('නව ස්ථානයක්', style: TextStyle(fontWeight: FontWeight.w700)),
          ),
          headerChild: s == null
              ? null
              : Column(
                  children: [
                    HeaderChips(items: [
                      ('සියලු ගම්මාන', _villageId == null, () => setState(() {
                            _villageId = null;
                            _groupId = null;
                          })),
                      for (final v in s.villages)
                        (v.name, _villageId == v.id, () => setState(() {
                              _villageId = v.id;
                              _groupId = null;
                            })),
                    ]),
                    const SizedBox(height: 8),
                    HeaderChips(items: [
                      ('සියලු කණ්ඩායම්', _groupId == null, () => setState(() => _groupId = null)),
                      for (final g in groups) (g.code, _groupId == g.id, () => setState(() => _groupId = g.id)),
                    ]),
                  ],
                ),
          body: s == null
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    // Status summary / filter
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
                      child: Row(
                        children: [
                          for (final st in const ['draft', 'complete', 'verified'])
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 3),
                                child: _StatusFilter(
                                  label: statusLabels[st]!,
                                  count: count(st),
                                  color: statusColor(st),
                                  selected: _status == st,
                                  onTap: () => setState(() => _status = _status == st ? null : st),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: lands.isEmpty
                          ? const EmptyHint('මෙහි ඉඩම් නැත.\n"නව ස්ථානයක්" ඔබා ඇතුළත් කරන්න.',
                              icon: Icons.landscape_rounded)
                          : ListView.builder(
                              padding: const EdgeInsets.fromLTRB(0, 6, 0, 96),
                              itemCount: lands.length,
                              itemBuilder: (context, i) => _LandTile(s: s, land: lands[i]),
                            ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class _StatusFilter extends StatelessWidget {
  const _StatusFilter({
    required this.label,
    required this.count,
    required this.color,
    required this.selected,
    required this.onTap,
  });
  final String label;
  final int count;
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Material(
        color: selected ? color : Colors.white,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: selected ? color : Brand.line),
            ),
            child: Column(children: [
              Text('$count',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w800, color: selected ? Colors.white : color)),
              Text(label, style: TextStyle(fontSize: 12, color: selected ? Colors.white : Brand.muted)),
            ]),
          ),
        ),
      );
}

class _LandTile extends StatelessWidget {
  const _LandTile({required this.s, required this.land});
  final Snapshot s;
  final Land land;

  @override
  Widget build(BuildContext context) {
    final b = s.bundle(land.id);
    final house = b.houses.firstOrNull;
    final photo = (house == null ? null : b.photosOf(house.id).firstOrNull) ?? b.photos.firstOrNull;
    final group = s.groupById[land.houseGroupId];
    final color = statusColor(land.status);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Brand.line),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => push(context, LandCard(landId: land.id)),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(width: 5, color: color),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: photo == null
                        ? Container(
                            width: 74,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Brand.goldLight, Brand.sandDark],
                              ),
                            ),
                            child: const Icon(Icons.home_work_rounded, color: Brand.brownMid, size: 34),
                          )
                        : Image.file(AppState.photoFile(photo.fileName),
                            width: 74, fit: BoxFit.cover, cacheWidth: 200,
                            errorBuilder: (_, _, _) => const SizedBox(width: 74, child: Icon(Icons.broken_image))),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Expanded(
                            child: Text(land.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w800, color: Brand.brownDark)),
                          ),
                          StatusBadge(land.status),
                        ]),
                        if (b.ownerNames.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Row(children: [
                              const Icon(Icons.person_rounded, size: 15, color: Brand.muted),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(b.ownerNames.join(', '),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(color: Brand.brownMid, fontSize: 14)),
                              ),
                            ]),
                          ),
                        const SizedBox(height: 8),
                        Wrap(spacing: 6, runSpacing: 6, children: [
                          if (group != null) Pill(group.code, color: Brand.brownMid, icon: Icons.groups_2_rounded),
                          if (land.extentPerches != null)
                            Pill(formatExtent(land.extentPerches), color: Brand.olive, icon: Icons.straighten_rounded),
                          Pill('${b.persons.length}', color: Brand.terracotta, icon: Icons.people_alt_rounded),
                          Pill('${b.treeTotal}', color: Brand.ok, icon: Icons.park_rounded),
                          Pill('${b.animalTotal}', color: Brand.slate, icon: Icons.pets_rounded),
                        ]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
