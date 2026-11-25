import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'data/bundle.dart';
import 'data/database.dart';
import 'data/picklists.dart';
import 'l10n/l10n.dart';
import 'security/key_store.dart';

/// App-wide services, initialised once in [AppState.init].
class AppState {
  AppState._();

  static late AppDb db;

  /// App-private folder for photos (never the phone's public gallery).
  static late Directory photosDir;
  static late File dbFile;

  static final fontScale = ValueNotifier<double>(1.0);

  /// Whether a display language has been saved (false on a fresh install,
  /// which then shows the language screen first).
  static bool languageChosen = false;

  /// Minutes in background before the PIN is asked again.
  static int autoLockMinutes = 2;

  static Future<void> init() async {
    final docs = await getApplicationSupportDirectory();
    photosDir = Directory(p.join(docs.path, 'photos'));
    await photosDir.create(recursive: true);
    dbFile = File(p.join(docs.path, 'smartgrama.sqlite'));
    db = AppDb.open(dbFile, await KeyStore.dbKey());
    await reloadPicks();
    fontScale.value = double.tryParse(await db.getSetting('font_scale') ?? '') ?? 1.0;
    autoLockMinutes = int.tryParse(await db.getSetting('auto_lock') ?? '') ?? 2;
    final saved = AppLang.tryParse(await db.getSetting(L10n.settingKey));
    languageChosen = saved != null;
    L10n.lang.value =
        saved ?? AppLang.tryParse(PlatformDispatcher.instance.locale.languageCode) ?? AppLang.si;
  }

  /// Switches the display language and remembers it.
  static Future<void> setLanguage(AppLang lang) async {
    L10n.lang.value = lang;
    languageChosen = true;
    await db.setSetting(L10n.settingKey, lang.code);
  }

  static Future<void> reloadPicks() async {
    final rows = await db.loadCustomPicks();
    PickRegistry.instance.setCustom([
      for (final r in rows) CustomPick(r.listName, r.code, r.label, active: r.active),
    ]);
  }

  static File photoFile(String fileName) => File(p.join(photosDir.path, fileName));
}
