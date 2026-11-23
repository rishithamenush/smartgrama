import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';

import '../../app_state.dart';
import '../../data/bundle.dart';
import '../../data/database.dart';
import '../../data/picklists.dart';
import '../widgets/common.dart';
import '../widgets/fields.dart';

class FamilyForm extends StatefulWidget {
  const FamilyForm({super.key, required this.landId, required this.buildings, this.family});
  final String landId;

  /// Buildings on the land the family can live in.
  final List<Building> buildings;
  final Family? family;

  @override
  State<FamilyForm> createState() => _FamilyFormState();
}

class _FamilyFormState extends State<FamilyForm> {
  final db = AppState.db;
  late final Family? f = widget.family;
  late String? _buildingId = f?.buildingId ??
      (widget.buildings.where((b) => b.type == 'house').firstOrNull ?? widget.buildings.firstOrNull)?.id;
  late String? _tenure = f?.tenure,
      _income = f?.incomeRange,
      _source = f?.mainIncomeSource,
      _fuel = f?.cookingFuel,
      _welfare = f?.welfare;
  late final _since = TextEditingController(text: numText(f?.sinceYear));
  late final _phone = TextEditingController(text: f?.phone);
  late final _notes = TextEditingController(text: f?.notes);
  bool _busy = false;

  Future<void> _save() async {
    if (_buildingId == null) {
      snack(context, 'පවුල ජීවත් වන නිවස තෝරන්න');
      return;
    }
    final since = intOf(_since);
    if (since != null && (since < 1900 || since > DateTime.now().year)) {
      snack(context, 'පදිංචියට පැමිණි වර්ෂය වලංගු නැත');
      return;
    }
    setState(() => _busy = true);
    final id = f?.id ?? newId();
    await db.saveRow(
      db.families,
      id,
      FamiliesCompanion(
        id: Value(id),
        buildingId: Value(_buildingId!),
        tenure: Value(_tenure),
        incomeRange: Value(_income),
        mainIncomeSource: Value(_source),
        cookingFuel: Value(_fuel),
        welfare: Value(_welfare),
        sinceYear: Value(since),
        phone: Value(txt(_phone)),
        notes: Value(txt(_notes)),
      ),
      landId: widget.landId,
    );
    if (mounted) Navigator.pop(context, id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(f == null ? 'නව පවුලක්' : 'පවුලේ තොරතුරු'),
        actions: [
          if (f != null)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () async {
                if (await confirm(context, 'මෙම පවුල සහ සාමාජිකයින් ඉවත් කරන්නද? (ඉතිහාසයේ රැඳේ)',
                    danger: true)) {
                  await db.deleteFamilyCascade(f!.id, widget.landId);
                  if (context.mounted) Navigator.pop(context);
                }
              },
            ),
        ],
      ),
      bottomNavigationBar: SaveBar(onSave: _save, busy: _busy),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        children: [
          const Text('ජීවත් වන ගොඩනැගිල්ල *'),
          for (final b in widget.buildings)
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(_buildingId == b.id ? Icons.radio_button_checked : Icons.radio_button_off,
                  color: Theme.of(context).colorScheme.primary),
              title: Text('${pl(PL.buildingType, b.type)}${b.buildingNo == null ? '' : ' — ${b.buildingNo}'}'),
              onTap: () => setState(() => _buildingId = b.id),
            ),
          PickField(list: PL.tenure, value: _tenure, onChanged: (v) => setState(() => _tenure = v)),
          PickField(list: PL.incomeRange, value: _income, onChanged: (v) => setState(() => _income = v)),
          PickField(list: PL.incomeSource, value: _source, onChanged: (v) => setState(() => _source = v)),
          PickField(list: PL.cookingFuel, value: _fuel, onChanged: (v) => setState(() => _fuel = v)),
          MultiPickField(list: PL.welfare, value: _welfare, onChanged: (v) => setState(() => _welfare = v)),
          TF(_since, 'පදිංචියට පැමිණි වර්ෂය', number: true),
          TF(_phone, 'දුරකථන අංකය', phone: true),
          TF(_notes, 'සටහන්', maxLines: 2),
        ],
      ),
    );
  }
}
