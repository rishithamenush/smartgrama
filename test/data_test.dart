import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:flutter_test/flutter_test.dart';
import 'package:smartgrama/data/database.dart';
import 'package:smartgrama/data/nic.dart';
import 'package:smartgrama/data/units.dart';

void main() {
  group('NIC', () {
    test('old format male', () {
      final r = parseNic('783030350V');
      expect(r.isValid, isTrue);
      // day 303 → Oct 29 (NIC calendar, Feb = 29 days)
      expect(r.info!.dob, DateTime(1978, 10, 29));
      expect(r.info!.gender, 'm');
    });

    test('female day offset, lower-case x and spaces', () {
      // 565 - 500 = day 65 → Mar 5 (Jan 31 + Feb 29 = 60)
      final r = parseNic(' 85 5651234x ');
      expect(r.info!.gender, 'f');
      expect(r.info!.dob, DateTime(1985, 3, 5));
      expect(r.info!.normalized, '855651234X');
    });

    test('new 12 digit format', () {
      final r = parseNic('200012300123');
      expect(r.info!.dob, DateTime(2000, 5, 2)); // 31+29+31+30 = 121 → May 2
      expect(r.info!.gender, 'm');
    });

    test('Feb 29 only on leap years', () {
      expect(parseNic('200006000123').isValid, isTrue); // 2000 leap
      expect(parseNic('199906000123').isValid, isFalse);
      expect(parseNic('199906100123').info!.dob, DateTime(1999, 3, 1));
    });

    test('rejects bad input', () {
      expect(parseNic('12345').isValid, isFalse);
      expect(parseNic('780000350V').isValid, isFalse); // day 0
      expect(parseNic('784000350V').isValid, isFalse); // day 400
      expect(parseNic('203012300123', now: DateTime(2026)).isValid, isFalse);
    });

    test('mask and age', () {
      expect(maskNic('783030350V'), '78•••••50V');
      expect(ageOn(DateTime(1978, 10, 29), DateTime(2026, 10, 28)), 47);
      expect(ageOn(DateTime(1978, 10, 29), DateTime(2026, 10, 29)), 48);
    });
  });

  group('units', () {
    test('ARP round trip', () {
      final p = arpToPerches(acres: 1, roods: 2, perches: 10);
      expect(p, 250);
      final a = perchesToArp(p);
      expect([a.acres, a.roods, a.perches], [1, 2, 10.0]);
    });

    test('hectares', () {
      expect(hectaresToPerches(0.055), closeTo(21.75, 0.01));
      expect(formatExtent(20), 'පර්. 20');
      expect(formatExtent(250), 'අක්. 1 රූ. 2 පර්. 10');
    });
  });

  group('database', () {
    late Directory dir;
    setUp(() => dir = Directory.systemTemp.createTempSync('sg'));
    tearDown(() => dir.deleteSync(recursive: true));

    test('file is encrypted and save logs changes', () async {
      final file = File('${dir.path}/t.sqlite');
      final db = AppDb.open(file, 'abcdef0123456789');

      final villageId = newId();
      await db.saveRow(db.villages, villageId,
          VillagesCompanion.insert(id: villageId, name: 'අනුරගම'));
      await db.saveRow(db.villages, villageId,
          VillagesCompanion(name: const Value('අනුරගම (නව ජනපදය)')));
      await db.softDelete(db.villages, villageId);

      final logs = await db.select(db.changeLogs).get();
      expect(logs.map((l) => l.action), ['create', 'update', 'delete']);
      final upd = jsonDecode(logs[1].changes) as Map<String, dynamic>;
      expect(upd.keys, ['name']);
      expect(upd['name'], ['අනුරගම', 'අනුරගම (නව ජනපදය)']);

      final v = await db.byId(db.villages, villageId);
      expect(v!.deletedAt, isNotNull);
      await db.close();

      // A plain SQLite file starts with "SQLite format 3\0".
      final header = file.readAsBytesSync().sublist(0, 15);
      expect(ascii.decode(header, allowInvalid: true), isNot('SQLite format 3'));

      // Wrong key cannot read it.
      final wrong = AppDb.open(file, '0000');
      expect(() => wrong.select(wrong.villages).get(), throwsA(anything));
      await wrong.close().catchError((_) {});
    });
  });
}
