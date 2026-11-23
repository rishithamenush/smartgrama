import 'dart:math';

import 'package:drift/drift.dart';

import 'bundle.dart';
import 'database.dart';

/// Fictional sample data for trying the app (debug builds only).
Future<void> seedDemo(AppDb db) async {
  final r = Random(7);
  var snapshot = await db.loadSnapshot();
  if (snapshot.groups.isEmpty) {
    for (final (vName, codes) in [
      ('ආදර්ශ ගම්මානය අ', ['D/01', 'D/02']),
      ('ආදර්ශ ගම්මානය ආ', ['D/03']),
    ]) {
      final vid = newId();
      await db.saveRow(db.villages, vid, VillagesCompanion.insert(id: vid, name: vName));
      for (final c in codes) {
        final gid = newId();
        await db.saveRow(db.houseGroups, gid,
            HouseGroupsCompanion.insert(id: gid, villageId: vid, code: c, expectedLands: const Value(8)));
      }
    }
    snapshot = await db.loadSnapshot();
  }
  const surnames = ['පෙරේරා', 'සිල්වා', 'බණ්ඩාර', 'ජයසිංහ', 'කුමාර', 'රත්නායක', 'ගුණසේකර', 'දිසානායක'];
  const male = ['සුනිල්', 'නිමල්', 'කමල්', 'අජිත්', 'රුවන්', 'චමින්ද'];
  const female = ['කුමාරි', 'නිල්මිණි', 'සඳමාලි', 'දිල්රුක්ෂි', 'අනෝමා', 'චමරි'];
  const kids = ['සෙනුරි', 'දිනිත්', 'ඔෂාදි', 'කවිඳු', 'තරුෂි', 'යසිරු'];
  const landNames = ['කොස්වත්ත', 'පහළ වත්ත', 'ඉහළ ගෙදර', 'අඹගහවත්ත', 'පොල්වත්ත', 'දෙල්ගහවත්ත', 'කුඹුරු ගෙදර', 'මැද වත්ත'];

  String nic(DateTime dob, bool female) {
    final start = DateTime(dob.year, 1, 1);
    var day = dob.difference(start).inDays + 1;
    final leap = (dob.year % 4 == 0 && dob.year % 100 != 0) || dob.year % 400 == 0;
    if (!leap && dob.month > 2) day += 1; // NIC calendar always has Feb 29
    if (female) day += 500;
    return '${dob.year}${day.toString().padLeft(3, '0')}${r.nextInt(99999).toString().padLeft(5, '0')}';
  }

  var n = 0;
  for (final g in snapshot.groups) {
    for (var i = 0; i < 3; i++, n++) {
      final landId = newId();
      final surname = surnames[n % surnames.length];
      await db.saveRow(
        db.lands,
        landId,
        LandsCompanion.insert(
          id: landId,
          houseGroupId: g.id,
          name: landNames[n % landNames.length],
          lat: Value(7.25 + r.nextDouble() * 0.01),
          lng: Value(80.70 + r.nextDouble() * 0.01),
          gpsAccuracy: Value(4 + r.nextDouble() * 10),
          extentPerches: Value([10.0, 20.0, 40.0, 80.0, 160.0][r.nextInt(5)]),
          extentSource: const Value('deed'),
          ownershipType: Value(['private_deed', 'jaya_bhoomi', 'state_permit'][r.nextInt(3)]),
          deedNo: Value('${1000 + n}'),
          landUse: const Value('home_garden'),
          status: Value(['draft', 'complete', 'verified'][n % 3]),
          verifiedAt: Value(n % 3 == 2 ? DateTime.now() : null),
          infoSource: Value(n % 3 == 2 ? 'observed' : null),
        ),
        landId: landId,
      );
      final houseId = newId();
      await db.saveRow(
        db.buildings,
        houseId,
        BuildingsCompanion.insert(
          id: houseId,
          landId: landId,
          type: 'house',
          floors: const Value(1),
          rooms: Value(2 + r.nextInt(3)),
          wall: const Value('cement_block'),
          roof: Value(['tile', 'asbestos', 'metal_sheet'][r.nextInt(3)]),
          floor: const Value('cement'),
          permanence: const Value('permanent'),
          condition: Value(['good', 'fair', 'poor'][r.nextInt(3)]),
          usage: const Value('residence'),
          electricity: const Value('grid'),
          waterSource: Value(['pipe_national', 'protected_well', 'unprotected_well'][r.nextInt(3)]),
          toilet: Value(['water_seal_in', 'water_seal_out', 'none'][r.nextInt(3)]),
        ),
        landId: landId,
      );
      final famId = newId();
      await db.saveRow(
        db.families,
        famId,
        FamiliesCompanion.insert(
          id: famId,
          buildingId: houseId,
          tenure: const Value('own'),
          incomeRange: Value(['lt25', '25_50', '50_100'][r.nextInt(3)]),
          welfare: Value(r.nextBool() ? 'aswesuma' : null),
        ),
        landId: landId,
      );
      final headDob = DateTime(1950 + r.nextInt(30), 1 + r.nextInt(12), 1 + r.nextInt(27));
      final people = [
        ('${male[n % male.length]} $surname', headDob, false, 'head', 'farmer'),
        ('${female[n % female.length]} $surname', headDob.add(const Duration(days: 900)), true, 'spouse', 'homemaker'),
        ('${kids[n % kids.length]} $surname', DateTime(2010 + r.nextInt(12), 3, 10), n.isEven, n.isEven ? 'daughter' : 'son', 'student'),
      ];
      for (final (name, dob, f, rel, occ) in people) {
        final pid = newId();
        final adult = DateTime.now().difference(dob).inDays > 16 * 365;
        await db.saveRow(
          db.persons,
          pid,
          PersonsCompanion.insert(
            id: pid,
            familyId: famId,
            fullName: name,
            nic: Value(adult ? nic(dob, f) : null),
            dob: Value(dob),
            gender: Value(f ? 'f' : 'm'),
            relation: Value(rel),
            ethnicity: const Value('sinhala'),
            religion: const Value('buddhist'),
            occupation: Value(occ),
            education: Value(adult ? 'ol' : 'schooling'),
            isVoter: Value(adult ? 'yes' : null),
          ),
          landId: landId,
        );
        if (rel == 'head') {
          await db.saveRow(db.families, famId, FamiliesCompanion(headPersonId: Value(pid)), landId: landId);
          final partyId = newId();
          await db.saveRow(db.landParties, partyId,
              LandPartiesCompanion.insert(id: partyId, landId: landId, personId: Value(pid), role: 'owner'),
              landId: landId);
        }
      }
      for (final (sp, b, y) in [('coconut', 4 + r.nextInt(10), r.nextInt(4)), ('jak', r.nextInt(4), 1), ('mango', r.nextInt(3), 0)]) {
        final tid = newId();
        await db.saveRow(db.treeCounts, tid,
            TreeCountsCompanion.insert(id: tid, landId: landId, species: sp, bearing: Value(b), young: Value(y)),
            landId: landId);
      }
      if (r.nextBool()) {
        final tid = newId();
        await db.saveRow(
            db.trees,
            tid,
            TreesCompanion.insert(
                id: tid,
                landId: landId,
                species: 'teak',
                girthIn: Value(30.0 + r.nextInt(40)),
                condition: const Value('healthy'),
                isHazard: Value(r.nextInt(4) == 0),
                lat: Value(7.25 + r.nextDouble() * 0.01),
                lng: Value(80.70 + r.nextDouble() * 0.01)),
            landId: landId);
      }
      final aid = newId();
      await db.saveRow(
          db.animals,
          aid,
          r.nextBool()
              ? AnimalsCompanion.insert(
                  id: aid, landId: landId, familyId: Value(famId), species: 'cattle',
                  female: Value(1 + r.nextInt(3)), young: Value(r.nextInt(2)),
                  purpose: const Value('milk'), dailyMilkL: Value(4.0 + r.nextInt(8)))
              : AnimalsCompanion.insert(
                  id: aid, landId: landId, familyId: Value(famId), species: 'village_chicken',
                  male: const Value(1), female: Value(4 + r.nextInt(8)), purpose: const Value('eggs')),
          landId: landId);
    }
  }
}
