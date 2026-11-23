import 'dart:io';

import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:flutter_test/flutter_test.dart';
import 'package:smartgrama/data/analytics.dart';
import 'package:smartgrama/data/bundle.dart';
import 'package:smartgrama/data/database.dart';
import 'package:smartgrama/data/demo_seed.dart';

void main() {
  late Directory dir;
  late AppDb db;
  setUp(() {
    dir = Directory.systemTemp.createTempSync('sga');
    db = AppDb.open(File('${dir.path}/a.sqlite'), 'cafe1234');
  });
  tearDown(() async {
    await db.close();
    dir.deleteSync(recursive: true);
  });

  test('stats, progress, lists and quality over demo data', () async {
    await seedDemo(db);
    final s = await db.loadSnapshot();
    expect(s.lands.length, 9); // 3 groups × 3 lands
    final st = computeStats(s);
    expect(st.population, 27);
    expect(st.male + st.female, 27);
    expect(st.housesCount, 9);
    expect(st.treesTotal, greaterThan(0));
    expect(st.ageGroup.total, 27);

    final progress = surveyProgress(s);
    expect(progress.map((p) => p.done).reduce((a, b) => a + b), 6); // complete + verified

    final now = DateTime.now();
    final school = readyLists.firstWhere((r) => r.id == 'school').run(s, now);
    expect(school.length, 9);
    expect(school.every((h) => h.personId != null && h.landId != null), isTrue);

    // Demo NICs are generated to match each person's DOB → no invalid NICs.
    final q = qualityReport(s);
    expect(q.firstWhere((x) => x.title.contains('වලංගු නැති')).hits, isEmpty);
    // Demo houses have no photos.
    expect(q.firstWhere((x) => x.title.contains('ඡායාරූප නැති')).hits.length, 9);

    // Village filter keeps only that village's records.
    final v = s.villages.first;
    final sv = s.forVillage(v.id);
    expect(sv.lands.every((l) => sv.groupById[l.houseGroupId]?.villageId == v.id), isTrue);
    expect(sv.lands.length, 6);
  });

  test('land check flags wrong data', () async {
    await seedDemo(db);
    final s = await db.loadSnapshot();
    final land = s.lands.first;
    var check = checkLand(s.bundle(land.id));
    expect(check.items.firstWhere((i) => i.label == 'ඡායාරූප').ok, isFalse);

    // Make the child older than the head and give the spouse a bad NIC.
    final b = s.bundle(land.id);
    final child = b.persons.firstWhere((p) => p.relation == 'son' || p.relation == 'daughter');
    final spouse = b.persons.firstWhere((p) => p.relation == 'spouse');
    await db.saveRow(db.persons, child.id, PersonsCompanion(dob: Value(DateTime(1930, 1, 1))));
    await db.saveRow(db.persons, spouse.id, const PersonsCompanion(nic: Value('12345')));
    // Land too small for its trees.
    await db.saveRow(db.lands, land.id, const LandsCompanion(extentPerches: Value(2)));

    final bundle = (await db.loadBundle(land.id))!;
    check = checkLand(bundle);
    expect(check.warnings.any((w) => w.contains('වයසින් වැඩියි')), isTrue);
    expect(check.warnings.any((w) => w.contains('වලංගු නැත')), isTrue);
    expect(check.warnings.any((w) => w.contains('ගස්')), isTrue);
  });
}
