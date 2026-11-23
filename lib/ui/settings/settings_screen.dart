import 'dart:io';

import 'package:drift/drift.dart' hide Column;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../app_state.dart';
import '../../data/backup.dart';
import '../../data/bundle.dart';
import '../../data/database.dart';
import '../../data/demo_seed.dart';
import '../../data/export_excel.dart';
import '../../data/picklists.dart';
import '../../security/key_store.dart';
import '../../security/pin_screen.dart';
import '../land/land_sections.dart';
import '../setup/setup_screen.dart';
import '../setup/structure_screen.dart';
import '../widgets/common.dart';
import '../widgets/fields.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final db = AppState.db;
  bool? _bioAvailable;
  bool _bio = false;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    () async {
      final a = await KeyStore.biometricAvailable();
      final on = await KeyStore.biometricEnabled();
      if (mounted) {
        setState(() {
          _bioAvailable = a;
          _bio = on;
        });
      }
    }();
  }

  Future<String?> _askPassword({required bool confirmTwice}) async {
    final a = TextEditingController();
    final b = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text('උපස්ථ මුරපදය'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (confirmTwice)
              const Text('මෙම මුරපදය නැතිව උපස්ථය විවෘත කළ නොහැක. ආරක්ෂිතව මතක තබා ගන්න.',
                  style: TextStyle(fontSize: 13)),
            TextField(controller: a, obscureText: true, decoration: const InputDecoration(labelText: 'මුරපදය')),
            if (confirmTwice) ...[
              const SizedBox(height: 8),
              TextField(controller: b, obscureText: true, decoration: const InputDecoration(labelText: 'නැවත')),
            ],
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(c), child: const Text('අවලංගු')),
          FilledButton(
            onPressed: () {
              if (a.text.length < 6) {
                snack(c, 'අවම අකුරු 6 ක්');
                return;
              }
              if (confirmTwice && a.text != b.text) {
                snack(c, 'මුරපද නොගැළපේ');
                return;
              }
              Navigator.pop(c, a.text);
            },
            child: const Text('හරි'),
          ),
        ],
      ),
    );
  }

  Future<void> _backup() async {
    final pw = await _askPassword(confirmTwice: true);
    if (pw == null || !mounted) return;
    setState(() => _busy = true);
    try {
      final dir = await getTemporaryDirectory();
      final f = File(p.join(dir.path, 'SmartGrama-${stamp()}.sgbak'));
      await createBackup(db, f, pw, photosDir: AppState.photosDir);
      await db.setSetting('last_backup', DateTime.now().toIso8601String());
      await SharePlus.instance.share(ShareParams(
        files: [XFile(f.path)],
        text: 'SmartGrama සංකේතිත උපස්ථය',
      ));
    } catch (e) {
      if (mounted) snack(context, 'උපස්ථය අසාර්ථකයි: $e');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _restore() async {
    if (!await confirm(context, 'උපස්ථයෙන් ප්‍රතිස්ථාපනය කළ විට දැනට ඇති සියලු දත්ත ඉවත් වී උපස්ථයේ දත්ත පමණක් රැඳේ. ඉදිරියට යන්නද?',
        danger: true)) {
      return;
    }
    final picked = await FilePicker.pickFile();
    if (picked?.path == null || !mounted) return;
    final pw = await _askPassword(confirmTwice: false);
    if (pw == null || !mounted) return;
    setState(() => _busy = true);
    try {
      await restoreBackup(db, File(picked!.path!), pw, photosDir: AppState.photosDir);
      await AppState.reloadPicks();
      if (mounted) snack(context, 'ප්‍රතිස්ථාපනය සාර්ථකයි');
    } on BackupError catch (e) {
      if (mounted) snack(context, e.message);
    } catch (e) {
      if (mounted) snack(context, 'ප්‍රතිස්ථාපනය අසාර්ථකයි: $e');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _changePin() async {
    final nav = Navigator.of(context);
    var verified = false;
    await nav.push(MaterialPageRoute(
      builder: (c) => PinScreen.unlock(
        allowBiometric: false,
        onDone: () {
          verified = true;
          Navigator.pop(c);
        },
      ),
    ));
    if (!verified) return;
    await nav.push(MaterialPageRoute(builder: (c) => PinScreen.setup(onDone: () => Navigator.pop(c))));
    if (mounted) snack(context, 'PIN අංකය වෙනස් කළා');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('සැකසුම්')),
      body: Stack(
        children: [
          ListView(
            children: [
              const SectionTitle('වසම'),
              ListTile(
                leading: const Icon(Icons.account_balance),
                title: const Text('වසම් තොරතුරු'),
                onTap: () async {
                  final d = await db.loadDivision();
                  if (context.mounted) push(context, SetupScreen(existing: d));
                },
              ),
              ListTile(
                leading: const Icon(Icons.holiday_village),
                title: const Text('ගම්මාන හා ගෘහ කණ්ඩායම්'),
                onTap: () => push(context, const StructureScreen()),
              ),
              ListTile(
                leading: const Icon(Icons.checklist),
                title: const Text('තේරීම් ලැයිස්තු'),
                subtitle: const Text('ගස්, සතුන්, බෝග ආදී වර්ග එකතු කිරීම'),
                onTap: () => push(context, const PickListsScreen()),
              ),
              const SectionTitle('පෙනුම'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ValueListenableBuilder<double>(
                  valueListenable: AppState.fontScale,
                  builder: (context, v, _) => SegmentedButton<double>(
                    segments: const [
                      ButtonSegment(value: 1.0, label: Text('සාමාන්‍ය')),
                      ButtonSegment(value: 1.15, label: Text('විශාල')),
                      ButtonSegment(value: 1.3, label: Text('ඉතා විශාල')),
                    ],
                    selected: {v},
                    onSelectionChanged: (s) {
                      AppState.fontScale.value = s.first;
                      db.setSetting('font_scale', '${s.first}');
                    },
                  ),
                ),
              ),
              const SectionTitle('ආරක්ෂාව'),
              ListTile(
                leading: const Icon(Icons.pin),
                title: const Text('PIN අංකය වෙනස් කරන්න'),
                onTap: _changePin,
              ),
              if (_bioAvailable == true)
                SwitchListTile(
                  secondary: const Icon(Icons.fingerprint),
                  title: const Text('ඇඟිලි සලකුණ / මුහුණ මඟින් විවෘත කිරීම'),
                  value: _bio,
                  onChanged: (v) async {
                    if (v && !await KeyStore.authenticateBiometric()) return;
                    await KeyStore.setBiometric(v);
                    setState(() => _bio = v);
                  },
                ),
              ListTile(
                leading: const Icon(Icons.timer),
                title: const Text('ස්වයංක්‍රීය අගුල'),
                trailing: DropdownButton<int>(
                  value: AppState.autoLockMinutes,
                  items: const [
                    DropdownMenuItem(value: 0, child: Text('වහාම')),
                    DropdownMenuItem(value: 2, child: Text('මිනිත්තු 2')),
                    DropdownMenuItem(value: 5, child: Text('මිනිත්තු 5')),
                    DropdownMenuItem(value: 15, child: Text('මිනිත්තු 15')),
                  ],
                  onChanged: (v) {
                    if (v == null) return;
                    setState(() => AppState.autoLockMinutes = v);
                    db.setSetting('auto_lock', '$v');
                  },
                ),
              ),
              const SectionTitle('උපස්ථය'),
              FutureBuilder<String?>(
                future: db.getSetting('last_backup'),
                builder: (context, s) {
                  final last = s.data == null ? null : DateTime.tryParse(s.data!);
                  return ListTile(
                    leading: const Icon(Icons.backup),
                    title: const Text('උපස්ථයක් සාදන්න'),
                    subtitle: Text(last == null
                        ? 'තවම උපස්ථයක් සාදා නැත — දුරකථනය නැති වුවහොත් දත්ත අහිමි වේ'
                        : 'අවසන් උපස්ථය: ${dateTimeFmt.format(last)}'),
                    onTap: _busy ? null : _backup,
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings_backup_restore),
                title: const Text('උපස්ථයෙන් ප්‍රතිස්ථාපනය'),
                onTap: _busy ? null : _restore,
              ),
              if (kDebugMode) ...[
                const SectionTitle('සංවර්ධක (debug)'),
                ListTile(
                  leading: const Icon(Icons.science),
                  title: const Text('ආදර්ශ දත්ත එකතු කරන්න'),
                  subtitle: const Text('පරීක්ෂා කිරීමට පමණි'),
                  onTap: () async {
                    setState(() => _busy = true);
                    await seedDemo(db);
                    if (mounted) setState(() => _busy = false);
                    if (context.mounted) snack(context, 'ආදර්ශ දත්ත එකතු කළා');
                  },
                ),
              ],
              const SectionTitle('පිළිබඳ'),
              const ListTile(
                leading: Icon(Icons.lock),
                title: Text('SmartGrama 1.0'),
                subtitle: Text('සියලු දත්ත මෙම දුරකථනයේ සංකේතිතව (encrypted) ගබඩා වේ. අන්තර්ජාලයට යවන්නේ නැත.'),
              ),
              const SizedBox(height: 32),
            ],
          ),
          if (_busy) const Positioned.fill(child: ColoredBox(color: Colors.black26, child: Center(child: CircularProgressIndicator()))),
        ],
      ),
    );
  }
}

/// Lists the officer can extend (custom options can be renamed / hidden).
class PickListsScreen extends StatelessWidget {
  const PickListsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final editable = pickListDefs.where((d) => d.editable).toList();
    return Scaffold(
      appBar: AppBar(title: const Text('තේරීම් ලැයිස්තු')),
      body: ListView(
        children: [
          for (final d in editable)
            ListTile(
              title: Text(d.title),
              subtitle: Text('${PickRegistry.instance.options(d.name).length} අයිතම'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => push(context, _PickListEditor(def: d)),
            ),
        ],
      ),
    );
  }
}

class _PickListEditor extends StatelessWidget {
  const _PickListEditor({required this.def});
  final PickListDef def;

  @override
  Widget build(BuildContext context) {
    final db = AppState.db;
    return StreamBuilder<List<PickItem>>(
      stream: db.watchLoad([db.pickItems], db.loadCustomPicks),
      builder: (context, snap) {
        final custom = (snap.data ?? const <PickItem>[]).where((c) => c.listName == def.name).toList();
        return Scaffold(
          appBar: AppBar(title: Text(def.title)),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final c = await showPickSheet(context, def.name, null);
              if (c != null) await AppState.reloadPicks();
            },
            child: const Icon(Icons.add),
          ),
          body: ListView(
            children: [
              for (final o in def.options)
                ListTile(dense: true, leading: const Icon(Icons.lock_outline, size: 18), title: Text(o.label)),
              if (custom.isNotEmpty) const SectionTitle('ඔබ එකතු කළ'),
              for (final c in custom)
                SwitchListTile(
                  title: Text(c.label),
                  subtitle: Text(c.active ? 'පෙන්වයි' : 'සඟවා ඇත'),
                  value: c.active,
                  onChanged: (v) async {
                    await db.saveRow(db.pickItems, c.id, PickItemsCompanion(active: Value(v)));
                    await AppState.reloadPicks();
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
