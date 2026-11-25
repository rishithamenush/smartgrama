import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';

import '../../app_state.dart';
import '../../data/bundle.dart';
import '../../data/database.dart';
import '../widgets/common.dart';
import '../widgets/fields.dart';
import '../widgets/brand.dart';
import '../../l10n/l10n.dart';

/// Villages ("ගම්මාන") and house groups ("ගෘහ කණ්ඩායම්").
class StructureScreen extends StatelessWidget {
  const StructureScreen({super.key, this.onDone});

  /// Set during first-run setup; shows a "continue" button.
  final VoidCallback? onDone;

  @override
  Widget build(BuildContext context) {
    final db = AppState.db;
    final t = context.l10n;
    return StreamBuilder<Snapshot>(
      stream: db.watchLoad([db.villages, db.houseGroups, db.lands], db.loadSnapshot),
      builder: (context, snap) {
        final s = snap.data;
        return Scaffold(
          appBar: BrandAppBar(title: Text(t.villagesAndGroups)),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => editVillage(context, null),
            icon: const Icon(Icons.add),
            label: Text(t.addVillageButton),
          ),
          bottomNavigationBar: onDone == null || s == null
              ? null
              : SaveBar(
                  label: t.continueAction,
                  onSave: () {
                    if (s.groups.isEmpty) {
                      snack(context, t.needOneGroup);
                      return;
                    }
                    onDone!();
                  },
                ),
          body: s == null
              ? const Center(child: CircularProgressIndicator())
              : s.villages.isEmpty
                  ? EmptyHint(t.structureEmpty, icon: Icons.holiday_village)
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
                                  : Text(t.supervisingValue(v.supervisingOfficer!)),
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
                                      if (g.leaderName != null) t.leaderValue(g.leaderName!),
                                      t.landsN(s.lands.where((l) => l.houseGroupId == g.id).length) +
                                          (g.expectedLands == null ? '' : ' / ${g.expectedLands}'),
                                    ].join(' • ')),
                                    trailing: const Icon(Icons.edit),
                                    onTap: () => editGroup(context, v.id, g),
                                  ),
                                ListTile(
                                  leading: const Icon(Icons.add),
                                  title: Text(t.addHouseGroup),
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
      title: Text(v == null ? c.l10n.newVillage : c.l10n.fVillage),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TF(name, c.l10n.villageNameField, autofocus: true),
          TF(officer, c.l10n.supervisingOfficerField, hint: c.l10n.supervisingOfficerHint),
        ],
      ),
      actions: [
        if (v != null) TextButton(onPressed: () => Navigator.pop(c, 'delete'), child: Text(c.l10n.remove)),
        TextButton(onPressed: () => Navigator.pop(c), child: Text(c.l10n.cancel)),
        FilledButton(onPressed: () => Navigator.pop(c, 'save'), child: Text(c.l10n.save)),
      ],
    ),
  );
  if (r == 'delete' && v != null) {
    final groups = await (db.select(db.houseGroups)
          ..where((g) => g.villageId.equals(v.id) & g.deletedAt.isNull()))
        .get();
    if (groups.isNotEmpty) {
      if (context.mounted) snack(context, context.l10n.removeGroupsFirst);
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
      title: Text(g == null ? c.l10n.newHouseGroup : c.l10n.fHouseGroup),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TF(code, c.l10n.groupNoField, hint: c.l10n.groupNoHint, autofocus: true),
            TF(leader, c.l10n.groupLeaderField),
            TF(phone, c.l10n.leaderPhoneField, phone: true),
            TF(expected, c.l10n.expectedLandsField, number: true, hint: c.l10n.expectedLandsHint),
          ],
        ),
      ),
      actions: [
        if (g != null) TextButton(onPressed: () => Navigator.pop(c, 'delete'), child: Text(c.l10n.remove)),
        TextButton(onPressed: () => Navigator.pop(c), child: Text(c.l10n.cancel)),
        FilledButton(onPressed: () => Navigator.pop(c, 'save'), child: Text(c.l10n.save)),
      ],
    ),
  );
  if (r == 'delete' && g != null) {
    final lands = await (db.select(db.lands)
          ..where((l) => l.houseGroupId.equals(g.id) & l.deletedAt.isNull()))
        .get();
    if (lands.isNotEmpty) {
      if (context.mounted) snack(context, context.l10n.groupHasLands(lands.length));
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
