import 'dart:io';
import 'dart:typed_data';

import 'package:drift/drift.dart';
import 'package:path/path.dart' as p;

import 'database.dart';

class BackupError implements Exception {
  BackupError(this.message);
  final String message;
  @override
  String toString() => message;
}

final _createRe = RegExp(r'^CREATE TABLE (?:IF NOT EXISTS )?"?(\w+)"?', caseSensitive: false);

Future<List<String>> _tables(AppDb db, String schema) async {
  final rows = await db
      .customSelect("SELECT name FROM $schema.sqlite_master WHERE type = 'table' "
          "AND name NOT LIKE 'sqlite_%' AND name != 'photo_files'")
      .get();
  return rows.map((r) => r.read<String>('name')).toList();
}

/// Writes an encrypted copy of the whole database to [target], protected by
/// [password] (independent of the device key, so it can be restored on a
/// new phone). Photos are stored inside the same encrypted file.
Future<void> createBackup(AppDb db, File target, String password,
    {required Directory photosDir, bool includePhotos = true}) async {
  if (password.length < 6) throw BackupError('මුරපදය අවම අකුරු 6 ක් විය යුතුය');
  if (await target.exists()) await target.delete();
  await db.customStatement('ATTACH DATABASE ? AS bak KEY ?', [target.path, password]);
  try {
    final rows = await db
        .customSelect("SELECT name, sql FROM main.sqlite_master WHERE type = 'table' "
            "AND name NOT LIKE 'sqlite_%'")
        .get();
    for (final r in rows) {
      final name = r.read<String>('name');
      final sql = r.read<String>('sql');
      await db.customStatement(sql.replaceFirstMapped(_createRe, (m) => 'CREATE TABLE bak."${m[1]}"'));
      await db.customStatement('INSERT INTO bak."$name" SELECT * FROM main."$name"');
    }
    await db.customStatement('CREATE TABLE bak.photo_files (file_name TEXT PRIMARY KEY, data BLOB)');
    if (includePhotos) {
      final photos = await db.customSelect('SELECT file_name FROM main.photos').get();
      for (final ph in photos) {
        final name = ph.read<String>('file_name');
        final f = File(p.join(photosDir.path, name));
        if (!await f.exists()) continue;
        await db.customStatement(
            'INSERT OR REPLACE INTO bak.photo_files VALUES (?, ?)', [name, await f.readAsBytes()]);
      }
    }
    await db.customStatement('PRAGMA bak.user_version = ${db.schemaVersion}');
  } finally {
    await db.customStatement('DETACH DATABASE bak');
  }
}

/// Replaces all data with the contents of a backup file.
Future<void> restoreBackup(AppDb db, File source, String password, {required Directory photosDir}) async {
  const wrong = 'මුරපදය වැරදියි, නැතහොත් මෙය SmartGrama උපස්ථ ගොනුවක් නොවේ';
  try {
    await db.customStatement('ATTACH DATABASE ? AS bak KEY ?', [source.path, password]);
  } catch (_) {
    throw BackupError(wrong);
  }
  try {
    int version;
    try {
      version = (await db.customSelect('PRAGMA bak.user_version').getSingle()).read<int>('user_version');
      await db.customSelect('SELECT count(*) FROM bak.sqlite_master').get();
    } catch (_) {
      throw BackupError(wrong);
    }
    if (version != db.schemaVersion) {
      throw BackupError('මෙම උපස්ථය වෙනත් අනුවාදයකින් සාදා ඇත ($version)');
    }
    final backupTables = (await _tables(db, 'bak')).toSet();
    final mainTables = await _tables(db, 'main');
    if (!backupTables.contains('lands')) {
      throw BackupError('මෙය SmartGrama උපස්ථ ගොනුවක් නොවේ');
    }
    await db.transaction(() async {
      await db.customStatement('PRAGMA defer_foreign_keys = ON');
      for (final t in mainTables) {
        await db.customStatement('DELETE FROM main."$t"');
        if (backupTables.contains(t)) {
          await db.customStatement('INSERT INTO main."$t" SELECT * FROM bak."$t"');
        }
      }
    });
    final photos = await db.customSelect('SELECT file_name, data FROM bak.photo_files').get();
    for (final ph in photos) {
      await File(p.join(photosDir.path, ph.read<String>('file_name')))
          .writeAsBytes(ph.read<Uint8List>('data'), flush: true);
    }
  } finally {
    await db.customStatement('DETACH DATABASE bak');
  }
  db.markTablesUpdated(db.allTables);
}
