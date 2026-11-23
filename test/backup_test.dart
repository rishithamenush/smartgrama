import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:smartgrama/data/backup.dart';
import 'package:smartgrama/data/database.dart';

void main() {
  late Directory dir;
  setUp(() => dir = Directory.systemTemp.createTempSync('sgb'));
  tearDown(() => dir.deleteSync(recursive: true));

  test('backup with password restores on a different device key', () async {
    final photos1 = Directory('${dir.path}/p1')..createSync();
    final photos2 = Directory('${dir.path}/p2')..createSync();
    File('${photos1.path}/a.jpg').writeAsBytesSync([1, 2, 3, 4]);

    final db1 = AppDb.open(File('${dir.path}/one.sqlite'), 'aaaa1111');
    final vid = newId();
    await db1.saveRow(db1.villages, vid, VillagesCompanion.insert(id: vid, name: 'පුබුදුගම'));
    final pid = newId();
    await db1.saveRow(
        db1.photos,
        pid,
        PhotosCompanion.insert(
            id: pid, ownerType: 'land', ownerId: 'x', fileName: 'a.jpg', takenAt: DateTime(2026)));

    final bak = File('${dir.path}/backup.sgbak');
    await createBackup(db1, bak, 'secret-pass', photosDir: photos1);
    expect(bak.existsSync(), isTrue);
    expect(String.fromCharCodes(bak.readAsBytesSync().take(15)), isNot('SQLite format 3'));
    await db1.close();

    // "New phone": different device key, empty database.
    final db2 = AppDb.open(File('${dir.path}/two.sqlite'), 'bbbb2222');
    expect(await db2.select(db2.villages).get(), isEmpty);

    await expectLater(
        restoreBackup(db2, bak, 'wrong-pass', photosDir: photos2), throwsA(isA<BackupError>()));

    await restoreBackup(db2, bak, 'secret-pass', photosDir: photos2);
    final villages = await db2.select(db2.villages).get();
    expect(villages.single.name, 'පුබුදුගම');
    expect((await db2.select(db2.changeLogs).get()).length, 2);
    expect(File('${photos2.path}/a.jpg').readAsBytesSync(), [1, 2, 3, 4]);
    await db2.close();
  });
}
