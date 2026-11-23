import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';

import '../../app_state.dart';
import '../../data/bundle.dart';
import '../../data/database.dart';
import '../widgets/common.dart';
import '../widgets/fields.dart';
import 'structure_screen.dart';

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
      snack(context, 'වසම් අංකය හා නම අනිවාර්යයි');
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
    return Scaffold(
      appBar: AppBar(title: const Text('වසම් තොරතුරු')),
      bottomNavigationBar: SaveBar(
        onSave: _save,
        busy: _busy,
        label: widget.onDone == null ? 'සුරකින්න' : 'ඉදිරියට',
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (widget.onDone != null)
            const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                'ආයුබෝවන්! මුලින්ම ඔබේ ග්‍රාම නිලධාරී වසමේ තොරතුරු ඇතුළත් කරන්න.',
                style: TextStyle(fontSize: 16),
              ),
            ),
          TF(_code, 'වසම් අංකය *', hint: 'උදා: 1001'),
          TF(_name, 'වසමේ නම *', hint: 'උදා: හාරගම'),
          TF(_ds, 'ප්‍රාදේශීය ලේකම් කොට්ඨාසය', hint: 'උදා: පාතහේවාහැට'),
          TF(_district, 'දිස්ත්‍රික්කය', hint: 'උදා: මහනුවර'),
          TF(_officer, 'ග්‍රාම නිලධාරී නම'),
        ],
      ),
    );
  }
}
