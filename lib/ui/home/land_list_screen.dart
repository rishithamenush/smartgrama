import 'package:flutter/material.dart';

import '../../app_state.dart';
import '../../data/bundle.dart';
import '../../data/units.dart';
import '../land/land_card.dart';
import '../land/land_sections.dart';
import '../land/land_wizard.dart';
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
        if (s == null) {
          return Scaffold(appBar: AppBar(title: const Text('ඉඩම්')), body: const Center(child: CircularProgressIndicator()));
        }
        if (_groupId != null && _villageId == null) {
          _villageId = s.groupById[_groupId]?.villageId;
        }
        final groups = s.groups.where((g) => _villageId == null || g.villageId == _villageId).toList();
        final groupIds = groups.map((g) => g.id).toSet();
        final lands = s.lands
            .where((l) =>
                (_groupId == null ? groupIds.contains(l.houseGroupId) : l.houseGroupId == _groupId) &&
                (_status == null || l.status == _status))
            .toList();
        return Scaffold(
          appBar: AppBar(title: Text('ඉඩම් (${lands.length})')),
          floatingActionButton: FloatingActionButton(
            onPressed: () => startNewLand(Navigator.of(context)),
            child: const Icon(Icons.add),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 52,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  children: [
                    _chip('සියලු ගම්මාන', _villageId == null, () => setState(() {
                          _villageId = null;
                          _groupId = null;
                        })),
                    for (final v in s.villages)
                      _chip(v.name, _villageId == v.id, () => setState(() {
                            _villageId = v.id;
                            _groupId = null;
                          })),
                  ],
                ),
              ),
              SizedBox(
                height: 52,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  children: [
                    _chip('සියලු කණ්ඩායම්', _groupId == null, () => setState(() => _groupId = null)),
                    for (final g in groups) _chip(g.code, _groupId == g.id, () => setState(() => _groupId = g.id)),
                    const SizedBox(width: 12),
                    for (final st in statusLabels.entries)
                      _chip(st.value, _status == st.key,
                          () => setState(() => _status = _status == st.key ? null : st.key)),
                  ],
                ),
              ),
              Expanded(
                child: lands.isEmpty
                    ? const EmptyHint('ඉඩම් නැත. "+" ඔබා නව ස්ථානයක් ඇතුළත් කරන්න.', icon: Icons.landscape)
                    : ListView.builder(
                        padding: const EdgeInsets.only(bottom: 88),
                        itemCount: lands.length,
                        itemBuilder: (context, i) {
                          final l = lands[i];
                          final b = s.bundle(l.id);
                          final house = b.houses.firstOrNull;
                          final photo = (house == null ? null : b.photosOf(house.id).firstOrNull) ??
                              b.photos.firstOrNull;
                          return Card(
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: photo == null
                                    ? Container(
                                        width: 52,
                                        height: 52,
                                        color: statusColor(l.status).withValues(alpha: 0.15),
                                        child: Icon(Icons.landscape, color: statusColor(l.status)),
                                      )
                                    : Image.file(AppState.photoFile(photo.fileName),
                                        width: 52, height: 52, fit: BoxFit.cover, cacheWidth: 120,
                                        errorBuilder: (_, _, _) => const Icon(Icons.broken_image)),
                              ),
                              title: Text(l.name),
                              subtitle: Text([
                                s.groupById[l.houseGroupId]?.code ?? '',
                                if (l.extentPerches != null) formatExtent(l.extentPerches),
                                if (b.ownerNames.isNotEmpty) b.ownerNames.first,
                                '👥 ${b.persons.length}  🌳 ${b.treeTotal}  🐄 ${b.animalTotal}',
                              ].join(' • ')),
                              trailing: StatusBadge(l.status),
                              onTap: () => push(context, LandCard(landId: l.id)),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _chip(String label, bool selected, VoidCallback onTap) => Padding(
        padding: const EdgeInsets.only(right: 6),
        child: ChoiceChip(label: Text(label), selected: selected, onSelected: (_) => onTap()),
      );
}
