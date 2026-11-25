import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';

import '../../app_state.dart';
import '../../data/bundle.dart';
import '../../data/database.dart';
import '../widgets/common.dart';
import '../widgets/fields.dart';
import '../widgets/brand.dart';

/// Villages ("ගම්මාන") and house groups ("ගෘහ කණ්ඩායම්").
class StructureScreen extends StatelessWidget {
  const StructureScreen({super.key, this.onDone});

  /// Set during first-run setup; shows a "continue" button.
  final VoidCallback? onDone;

  @override
  Widget build(BuildContext context) {
    final db = AppState.db;
    return StreamBuilder<Snapshot>(
      stream: db.watchLoad([db.villages, db.houseGroups, db.lands], db.loadSnapshot),
      builder: (context, snap) {
        final s = snap.data;
        return Scaffold(
          appBar: BrandAppBar(title: const Text('ගම්මාන හා ගෘහ කණ්ඩායම්')),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => editVillage(context, null),
            icon: const Icon(Icons.add),
            label: const Text('ගම්මානයක්'),
          ),
          bottomNavigationBar: onDone == null || s == null
              ? null
              : SaveBar(
                  label: 'ඉදිරියට',
                  onSave: () {
                    if (s.groups.isEmpty) {
                      snack(context, 'අවම වශයෙන් එක් ගම්මානයක් හා ගෘහ කණ්ඩායමක් එකතු කරන්න');
                      return;
                    }
                    onDone!();
                  },
                ),
          body: s == null
              ? const Center(child: CircularProgressIndicator())
              : s.villages.isEmpty
                  ? const EmptyHint(
                      'ඔබේ වසමේ ගම්මාන එකතු කරන්න. ඉන්පසු එක් එක් ගම්මානයට ගෘහ කණ්ඩායම් (උදා: 1001/01) එකතු කරන්න.',
                      icon: Icons.holiday_village)
                  : ListView(
                      padding: const EdgeInsets.only(bottom: 96),
                      children: [
                        for (final v in s.villages)
                          Card(
                            child: ExpansionTile(
                              initiallyExpanded: true,
                              leading: const Icon(Icons.holiday_village),
                              title: Text(v.name),
                              subtitle: v.supervisingOfficer == null
                                  ? null
                                  : Text('සමීප අධීක්ෂණය: ${v.supervisingOfficer}'),
                              trailing: IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () => editVillage(context, v),
                              ),
                              children: [
                                for (final g in s.groups.where((g) => g.villageId == v.id))
                                  ListTile(
                                    leading: const Icon(Icons.groups),
                                    title: Text(g.code),
                                    subtitle: Text([
                                      if (g.leaderName != null) 'නායක: ${g.leaderName}',
                                      'ඉඩම් ${s.lands.where((l) => l.houseGroupId == g.id).length}'
                                          '${g.expectedLands == null ? '' : ' / ${g.expectedLands}'}',
                                    ].join(' • ')),
                                    trailing: const Icon(Icons.edit),
                                    onTap: () => editGroup(context, v.id, g),
                                  ),
                                ListTile(
                                  leading: const Icon(Icons.add),
                                  title: const Text('ගෘහ කණ්ඩායමක් එකතු කරන්න'),
                                  onTap: () => editGroup(context, v.id, null),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
        );
      },
    );
  }
}

Future<void> editVillage(BuildContext context, Village? v) async {
  final name = TextEditingController(text: v?.name);
  final officer = TextEditingController(text: v?.supervisingOfficer);
  final db = AppState.db;
  final r = await showDialog<String>(
    context: context,
    builder: (c) => AlertDialog(
      title: Text(v == null ? 'නව ගම්මානයක්' : 'ගම්මානය'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TF(name, 'ගම්මානයේ නම *', autofocus: true),
          TF(officer, 'සමීප අධීක්ෂණ නිලධාරී', hint: 'උදා: සමෘද්ධි සංවර්ධන නිලධාරී'),
        ],
      ),
      actions: [
        if (v != null)
          TextButton(onPressed: () => Navigator.pop(c, 'delete'), child: const Text('ඉවත් කරන්න')),
        TextButton(onPressed: () => Navigator.pop(c), child: const Text('අවලංගු')),
        FilledButton(onPressed: () => Navigator.pop(c, 'save'), child: const Text('සුරකින්න')),
      ],
    ),
  );
  if (r == 'delete' && v != null) {
    final groups = await (db.select(db.houseGroups)
          ..where((g) => g.villageId.equals(v.id) & g.deletedAt.isNull()))
        .get();
    if (groups.isNotEmpty) {
      if (context.mounted) snack(context, 'මුලින්ම මෙහි ගෘහ කණ්ඩායම් ඉවත් කරන්න');
      return;
    }
    await db.softDelete(db.villages, v.id);
    return;
  }
  if (r != 'save' || txt(name) == null) return;
  final id = v?.id ?? newId();
  await db.saveRow(
    db.villages,
    id,
    VillagesCompanion(
      id: Value(id),
      name: Value(txt(name)!),
      supervisingOfficer: Value(txt(officer)),
    ),
  );
}

Future<void> editGroup(BuildContext context, String villageId, HouseGroup? g) async {
  final db = AppState.db;
  final div = await db.loadDivision();
  final code = TextEditingController(text: g?.code ?? '${div?.code ?? ''}/');
  final leader = TextEditingController(text: g?.leaderName);
  final phone = TextEditingController(text: g?.leaderPhone);
  final expected = TextEditingController(text: g?.expectedLands?.toString());
  if (!context.mounted) return;
  final r = await showDialog<String>(
    context: context,
    builder: (c) => AlertDialog(
      title: Text(g == null ? 'නව ගෘහ කණ්ඩායමක්' : 'ගෘහ කණ්ඩායම'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TF(code, 'කණ්ඩායම් අංකය *', hint: 'උදා: 1001/01', autofocus: true),
            TF(leader, 'කණ්ඩායම් නායකයා'),
            TF(phone, 'නායකයාගේ දුරකථනය', phone: true),
            TF(expected, 'දළ ඉඩම් / නිවාස ගණන', number: true, hint: 'සමීක්ෂණ ප්‍රගතිය සඳහා'),
          ],
        ),
      ),
      actions: [
        if (g != null)
          TextButton(onPressed: () => Navigator.pop(c, 'delete'), child: const Text('ඉවත් කරන්න')),
        TextButton(onPressed: () => Navigator.pop(c), child: const Text('අවලංගු')),
        FilledButton(onPressed: () => Navigator.pop(c, 'save'), child: const Text('සුරකින්න')),
      ],
    ),
  );
  if (r == 'delete' && g != null) {
    final lands = await (db.select(db.lands)
          ..where((l) => l.houseGroupId.equals(g.id) & l.deletedAt.isNull()))
        .get();
    if (lands.isNotEmpty) {
      if (context.mounted) snack(context, 'මෙම කණ්ඩායමේ ඉඩම් ${lands.length} ක් ඇත — ඉවත් කළ නොහැක');
      return;
    }
    await db.softDelete(db.houseGroups, g.id);
    return;
  }
  if (r != 'save' || txt(code) == null) return;
  final id = g?.id ?? newId();
  await db.saveRow(
    db.houseGroups,
    id,
    HouseGroupsCompanion(
      id: Value(id),
      villageId: Value(villageId),
      code: Value(txt(code)!),
      leaderName: Value(txt(leader)),
      leaderPhone: Value(txt(phone)),
      expectedLands: Value(intOf(expected)),
    ),
  );
}
