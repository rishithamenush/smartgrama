import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app_state.dart';
import '../../data/database.dart';
import '../../data/device.dart';
import '../../data/picklists.dart';
import 'common.dart';
import '../../theme.dart';

/// Single choice from a pick list. Short lists render as chips; long lists
/// open a searchable sheet (with "add new" for editable lists).
class PickField extends StatelessWidget {
  const PickField({
    super.key,
    required this.list,
    required this.value,
    required this.onChanged,
    this.label,
    this.required = false,
  });

  final String list;
  final String? value;
  final ValueChanged<String?> onChanged;
  final String? label;
  final bool required;

  @override
  Widget build(BuildContext context) {
    final def = PickRegistry.instance.def(list);
    final options = PickRegistry.instance.options(list);
    final title = '${label ?? def.title}${required ? ' *' : ''}';
    if (options.length <= 5 && !def.editable) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 4),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                for (final o in options)
                  ChoiceChip(
                    label: Text(o.label),
                    selected: value == o.code,
                    onSelected: (sel) => onChanged(sel ? o.code : null),
                  ),
              ],
            ),
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: () async {
          final r = await showPickSheet(context, list, value);
          if (r != null) onChanged(r.isEmpty ? null : r);
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: title,
            suffixIcon: const Icon(Icons.arrow_drop_down),
          ),
          isEmpty: value == null,
          child: Text(value == null ? '' : pl(list, value)),
        ),
      ),
    );
  }
}

/// Returns the chosen code, '' to clear, or null if dismissed.
Future<String?> showPickSheet(BuildContext context, String list, String? current) {
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (c) => _PickSheet(list: list, current: current),
  );
}

class _PickSheet extends StatefulWidget {
  const _PickSheet({required this.list, required this.current});
  final String list;
  final String? current;

  @override
  State<_PickSheet> createState() => _PickSheetState();
}

class _PickSheetState extends State<_PickSheet> {
  String _q = '';

  Future<void> _addNew() async {
    final ctrl = TextEditingController(text: _q);
    final label = await showDialog<String>(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text('නව අයිතමයක්'),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          decoration: const InputDecoration(labelText: 'නම'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(c), child: const Text('අවලංගු')),
          FilledButton(
              onPressed: () => Navigator.pop(c, ctrl.text.trim()), child: const Text('එකතු කරන්න')),
        ],
      ),
    );
    if (label == null || label.isEmpty) return;
    final existing = PickRegistry.instance
        .options(widget.list)
        .where((o) => o.label == label)
        .firstOrNull;
    if (existing != null) {
      if (mounted) Navigator.pop(context, existing.code);
      return;
    }
    final db = AppState.db;
    final id = newId();
    final code = 'c_${id.substring(0, 8)}';
    await db.saveRow(db.pickItems, id,
        PickItemsCompanion.insert(id: id, listName: widget.list, code: code, label: label));
    await AppState.reloadPicks();
    if (mounted) Navigator.pop(context, code);
  }

  @override
  Widget build(BuildContext context) {
    final def = PickRegistry.instance.def(widget.list);
    final options = PickRegistry.instance
        .options(widget.list)
        .where((o) => _q.isEmpty || o.label.contains(_q))
        .toList();
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.75,
      maxChildSize: 0.95,
      builder: (context, scroll) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 8, 4),
            child: Row(
              children: [
                Expanded(child: Text(def.title, style: Theme.of(context).textTheme.titleLarge)),
                if (widget.current != null)
                  TextButton(onPressed: () => Navigator.pop(context, ''), child: const Text('ඉවත් කරන්න')),
              ],
            ),
          ),
          if (PickRegistry.instance.options(widget.list).length > 8)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: TextField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search), hintText: 'සොයන්න', isDense: true),
                onChanged: (v) => setState(() => _q = v.trim()),
              ),
            ),
          Expanded(
            child: ListView(
              controller: scroll,
              children: [
                for (final o in options)
                  ListTile(
                    title: Text(o.label),
                    leading: Icon(
                      o.code == widget.current ? Icons.radio_button_checked : Icons.radio_button_off,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onTap: () => Navigator.pop(context, o.code),
                  ),
                if (def.editable)
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('නව අයිතමයක් එකතු කරන්න'),
                    onTap: _addNew,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Multiple choice from a pick list, stored as comma separated codes.
class MultiPickField extends StatelessWidget {
  const MultiPickField({super.key, required this.list, required this.value, required this.onChanged});
  final String list;
  final String? value;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    final selected = splitCodes(value).toSet();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(PickRegistry.instance.def(list).title, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 4),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              for (final o in PickRegistry.instance.options(list))
                FilterChip(
                  label: Text(o.label),
                  selected: selected.contains(o.code),
                  onSelected: (on) {
                    final next = {...selected};
                    on ? next.add(o.code) : next.remove(o.code);
                    onChanged(next.isEmpty ? null : joinCodes(next));
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}

/// ➖ value ➕ — counting trees and animals without typing.
class CountStepper extends StatelessWidget {
  const CountStepper({super.key, required this.label, required this.value, required this.onChanged});
  final String label;
  final int value;
  final ValueChanged<int> onChanged;

  Future<void> _type(BuildContext context) async {
    final ctrl = TextEditingController(text: '$value');
    final r = await showDialog<int>(
      context: context,
      builder: (c) => AlertDialog(
        title: Text(label),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(c), child: const Text('අවලංගු')),
          FilledButton(
              onPressed: () => Navigator.pop(c, int.tryParse(ctrl.text) ?? 0),
              child: const Text('හරි')),
        ],
      ),
    );
    if (r != null) onChanged(r);
  }

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(child: Text(label)),
          IconButton.filledTonal(
            onPressed: value > 0 ? () => onChanged(value - 1) : null,
            icon: const Icon(Icons.remove),
          ),
          InkWell(
            onTap: () => _type(context),
            child: SizedBox(
              width: 56,
              child: Text('$value',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge),
            ),
          ),
          IconButton.filledTonal(
            onPressed: () => onChanged(value + 1),
            icon: const Icon(Icons.add),
          ),
        ],
      );
}

/// Text field bound to a controller with common defaults.
class TF extends StatelessWidget {
  const TF(this.controller, this.label,
      {super.key, this.number = false, this.decimal = false, this.hint, this.maxLines = 1, this.phone = false, this.onChanged, this.errorText, this.suffix, this.autofocus = false});
  final bool autofocus;
  final TextEditingController controller;
  final String label;
  final bool number, decimal, phone;
  final String? hint;
  final int maxLines;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: TextField(
          controller: controller,
          autofocus: autofocus,
          maxLines: maxLines,
          onChanged: onChanged,
          keyboardType: phone
              ? TextInputType.phone
              : number || decimal
                  ? TextInputType.numberWithOptions(decimal: decimal)
                  : (maxLines > 1 ? TextInputType.multiline : TextInputType.text),
          inputFormatters: [
            if (number && !decimal) FilteringTextInputFormatter.digitsOnly,
            if (decimal) FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
          ],
          decoration: InputDecoration(labelText: label, hintText: hint, errorText: errorText, suffixIcon: suffix),
        ),
      );
}

String? txt(TextEditingController c) => c.text.trim().isEmpty ? null : c.text.trim();
int? intOf(TextEditingController c) => int.tryParse(c.text.trim());
double? dblOf(TextEditingController c) => double.tryParse(c.text.trim());
String numText(num? v) =>
    v == null ? '' : (v == v.roundToDouble() ? v.toInt().toString() : v.toString());

/// GPS capture with accuracy display and retry.
class GpsField extends StatefulWidget {
  const GpsField({super.key, required this.lat, required this.lng, this.accuracy, required this.onChanged});
  final double? lat, lng, accuracy;
  final void Function(double? lat, double? lng, double? acc) onChanged;

  @override
  State<GpsField> createState() => _GpsFieldState();
}

class _GpsFieldState extends State<GpsField> {
  bool _busy = false;

  Future<void> _capture() async {
    setState(() => _busy = true);
    try {
      final fix = await captureGps();
      widget.onChanged(fix.lat, fix.lng, fix.accuracy);
    } on DeviceError catch (e) {
      if (mounted) snack(context, e.message);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final has = widget.lat != null;
    final acc = widget.accuracy;
    final poor = acc != null && acc > 10;
    final cs = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(Icons.location_on, color: has ? (poor ? Brand.pending : cs.primary) : cs.outline),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(has
                      ? '${widget.lat!.toStringAsFixed(6)}, ${widget.lng!.toStringAsFixed(6)}'
                      : 'GPS ස්ථානය ගෙන නැත'),
                  if (acc != null)
                    Text(
                      poor
                          ? 'නිරවද්‍යතාව මී. ${acc.round()} — අඩුයි, නැවත ගන්න'
                          : 'නිරවද්‍යතාව මී. ${acc.round()}',
                      style: TextStyle(fontSize: 12, color: poor ? Brand.warn : cs.outline),
                    ),
                ],
              ),
            ),
            if (has)
              IconButton(
                tooltip: 'ඉවත් කරන්න',
                onPressed: () => widget.onChanged(null, null, null),
                icon: const Icon(Icons.close),
              ),
            FilledButton.icon(
              onPressed: _busy ? null : _capture,
              icon: _busy
                  ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2))
                  : const Icon(Icons.my_location),
              label: Text(has ? 'නැවත' : 'GPS ගන්න'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Horizontal strip of photos for one record, with camera/gallery buttons.
class PhotoStrip extends StatelessWidget {
  const PhotoStrip({
    super.key,
    required this.ownerType,
    required this.ownerId,
    required this.landId,
    required this.photos,
  });
  final String ownerType;
  final String ownerId;
  final String landId;
  final List<Photo> photos;

  Future<void> _add(BuildContext context, bool camera) async {
    try {
      await addPhoto(ownerType: ownerType, ownerId: ownerId, landId: landId, fromCamera: camera);
    } catch (e) {
      if (context.mounted) snack(context, 'ඡායාරූපය ගැනීමට නොහැක: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _AddBox(icon: Icons.photo_camera, label: 'කැමරාව', onTap: () => _add(context, true)),
          _AddBox(icon: Icons.photo_library, label: 'ගැලරිය', onTap: () => _add(context, false)),
          for (final p in photos)
            Padding(
              padding: const EdgeInsets.all(4),
              child: GestureDetector(
                onTap: () => openPhoto(context, p),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(AppState.photoFile(p.fileName),
                      width: 88, height: 88, fit: BoxFit.cover, cacheWidth: 200,
                      errorBuilder: (_, _, _) => const SizedBox(width: 88, child: Icon(Icons.broken_image))),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _AddBox extends StatelessWidget {
  const _AddBox({required this.icon, required this.label, required this.onTap});
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(4),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 88,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(icon), Text(label, style: const TextStyle(fontSize: 12))],
            ),
          ),
        ),
      );
}

Future<void> openPhoto(BuildContext context, Photo p) => Navigator.of(context).push(
      MaterialPageRoute(
        builder: (c) => Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            title: Text(dateTimeFmt.format(p.takenAt)),
            actions: [
              IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () async {
                  if (await confirm(c, 'මෙම ඡායාරූපය ඉවත් කරන්නද?', danger: true)) {
                    await AppState.db.softDelete(AppState.db.photos, p.id, landId: p.landId);
                    if (c.mounted) Navigator.pop(c);
                  }
                },
              ),
            ],
          ),
          body: InteractiveViewer(
            child: Center(child: Image.file(File(AppState.photoFile(p.fileName).path))),
          ),
        ),
      ),
    );

/// Bottom save bar used by all forms.
class SaveBar extends StatelessWidget {
  const SaveBar({super.key, required this.onSave, this.busy = false, this.label = 'සුරකින්න'});
  final VoidCallback onSave;
  final bool busy;
  final String label;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: FilledButton.icon(
            onPressed: busy ? null : onSave,
            icon: const Icon(Icons.save),
            label: Text(label),
          ),
        ),
      );
}
