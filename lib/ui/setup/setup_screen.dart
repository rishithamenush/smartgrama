import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';

import '../../app_state.dart';
import '../../data/bundle.dart';
import '../../data/database.dart';
import '../widgets/common.dart';
import '../widgets/fields.dart';
import 'structure_screen.dart';
import '../widgets/brand.dart';
import '../../l10n/l10n.dart';

/// Division details. Used on first run (then continues to villages) and
/// from settings.
class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key, this.onDone, this.existing});
  final void Function(Division d)? onDone;
  final Division? existing;

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  late final _code = TextEditingController(text: widget.existing?.code);
  late final _name = TextEditingController(text: widget.existing?.name);
  late final _ds = TextEditingController(text: widget.existing?.dsDivision);
  late final _district = TextEditingController(text: widget.existing?.district);
  late final _officer = TextEditingController(text: widget.existing?.officerName);
  bool _busy = false;
  String? _savedId;

  Future<void> _save() async {
    if (txt(_code) == null || txt(_name) == null) {
      snack(context, context.l10n.codeNameRequired);
      return;
    }
    setState(() => _busy = true);
    final db = AppState.db;
    final id = widget.existing?.id ?? _savedId ?? newId();
    _savedId = id;
    await db.saveRow(
      db.divisions,
      id,
      DivisionsCompanion(
        id: Value(id),
        code: Value(txt(_code)!),
        name: Value(txt(_name)!),
        dsDivision: Value(txt(_ds) ?? ''),
        district: Value(txt(_district) ?? ''),
        officerName: Value(txt(_officer) ?? ''),
      ),
    );
    final d = (await db.loadDivision())!;
    if (!mounted) return;
    if (widget.onDone == null) {
      Navigator.pop(context);
      return;
    }
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (c) => StructureScreen(onDone: () {
        Navigator.pop(c);
        widget.onDone!(d);
      }),
    ));
    if (mounted) setState(() => _busy = false);
  }

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return Scaffold(
      appBar: BrandAppBar(title: Text(t.divisionDetails)),
      bottomNavigationBar: SaveBar(
        onSave: _save,
        busy: _busy,
        label: widget.onDone == null ? t.save : t.continueAction,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (widget.onDone != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(t.setupWelcome, style: const TextStyle(fontSize: 16)),
            ),
          TF(_code, t.divisionNoField, hint: t.divisionNoHint),
          TF(_name, t.divisionNameField, hint: t.divisionNameHint),
          TF(_ds, t.dsDivisionField, hint: t.dsDivisionHint),
          TF(_district, t.districtField, hint: t.districtHint),
          TF(_officer, t.gnNameField),
        ],
      ),
    );
  }
}
