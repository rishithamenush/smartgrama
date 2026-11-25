import 'dart:io';

import 'package:excel/excel.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../l10n/l10n.dart';
import 'analytics.dart';
import 'bundle.dart';
import 'nic.dart';
import 'picklists.dart';
import 'units.dart';

CellValue _c(Object? v) => switch (v) {
      null => TextCellValue(''),
      int i => IntCellValue(i),
      double d => DoubleCellValue(double.parse(d.toStringAsFixed(3))),
      bool b => TextCellValue(b ? L10n.current.yes : L10n.current.no),
      DateTime t => TextCellValue('${t.year}-${t.month.toString().padLeft(2, '0')}-${t.day.toString().padLeft(2, '0')}'),
      _ => TextCellValue('$v'),
    };

void _sheet(Excel x, String name, List<String> header, Iterable<List<Object?>> rows) {
  final s = x[name];
  s.appendRow([for (final h in header) TextCellValue(h)]);
  for (final r in rows) {
    s.appendRow([for (final v in r) _c(v)]);
  }
}

/// Full division workbook: one sheet per record type. Sheet names, headers
/// and pick-list codes are written in the current app language.
List<int> buildDivisionWorkbook(Snapshot s) {
  final t = L10n.current;
  final x = Excel.createExcel();
  final now = DateTime.now();
  String group(String landId) => s.groupById[s.landById[landId]?.houseGroupId]?.code ?? '';
  String village(String landId) {
    final l = s.landById[landId];
    return l == null ? '' : s.villageOfLand(l)?.name ?? '';
  }

  _sheet(x, t.lands, [
    t.fVillage, t.fHouseGroup, t.fLandName, t.fAddress, t.fExtentPerches, t.fExtent, t.fOwnership,
    t.fOwners, t.fDeedNo, t.fPlanNo, t.fLotNo, t.fScheme, t.fUse, t.fNorth, t.fEast,
    t.fSouth, t.fWest, t.fDispute, t.fLatitude, t.fLongitude, t.fGpsAccuracyM, t.fStatus, t.fVerifiedOn,
  ], [
    for (final l in s.lands)
      [
        village(l.id), group(l.id), l.name, l.addressText, l.extentPerches, formatExtent(l.extentPerches),
        pl(PL.ownership, l.ownershipType), s.bundle(l.id).ownerNames.join(', '), l.deedNo, l.planNo,
        l.lotNo, l.schemeName, pl(PL.landUse, l.landUse), l.boundaryNorth, l.boundaryEast,
        l.boundarySouth, l.boundaryWest, l.hasDispute ? (l.disputeNote ?? t.yes) : '', l.lat, l.lng,
        l.gpsAccuracy, t.landStatus(l.status), l.verifiedAt,
      ],
  ]);

  String title(String list) => PickRegistry.instance.def(list).title;
  _sheet(x, t.buildings, [
    t.fVillage, t.fHouseGroup, t.land, t.fType, t.fNumber, t.fFloors, t.fSqft, t.fRooms, title(PL.wall),
    title(PL.roof), title(PL.floor), title(PL.permanence), title(PL.condition), t.fYearBuilt, t.fUse,
    title(PL.electricity), t.fWater, title(PL.toilet), t.fApproval,
  ], [
    for (final b in s.buildings)
      [
        village(b.landId), group(b.landId), s.landById[b.landId]?.name, pl(PL.buildingType, b.type),
        b.buildingNo, b.floors, b.floorAreaSqft, b.rooms, pl(PL.wall, b.wall), pl(PL.roof, b.roof),
        pl(PL.floor, b.floor), pl(PL.permanence, b.permanence), pl(PL.condition, b.condition), b.yearBuilt,
        pl(PL.buildingUsage, b.usage), pl(PL.electricity, b.electricity), pl(PL.water, b.waterSource),
        pl(PL.toilet, b.toilet), pl(PL.yesNoUnknown, b.approval),
      ],
  ]);

  _sheet(x, t.families, [
    t.fVillage, t.fHouseGroup, t.land, t.fHead, t.fMembers, title(PL.tenure), title(PL.incomeRange),
    t.fIncomeSource, t.fFuel, t.fWelfare, t.fSinceYear, t.phone,
  ], [
    for (final f in s.families)
      () {
        final landId = s.landOfFamily[f.id] ?? '';
        return [
          village(landId), group(landId), s.landById[landId]?.name, s.personById[f.headPersonId]?.fullName,
          s.persons.where((p) => p.familyId == f.id && isActive(p)).length, pl(PL.tenure, f.tenure),
          pl(PL.incomeRange, f.incomeRange), pl(PL.incomeSource, f.mainIncomeSource),
          pl(PL.cookingFuel, f.cookingFuel), PickRegistry.instance.labels(PL.welfare, f.welfare),
          f.sinceYear, f.phone,
        ];
      }(),
  ]);

  _sheet(x, t.sheetPeople, [
    t.fVillage, t.fHouseGroup, t.land, t.fFullName, t.fNameWithInitials, t.fNic, t.fDob, t.fAge,
    t.fSex, t.fRelation, title(PL.ethnicity), title(PL.religion), title(PL.civilStatus), title(PL.education),
    t.fGrade, title(PL.occupation), t.fWorkplace, title(PL.disability), t.fVoter, title(PL.personStatus), t.phone,
  ], [
    for (final p in s.persons)
      () {
        final landId = s.landOfPerson(p) ?? '';
        return [
          village(landId), group(landId), s.landById[landId]?.name, p.fullName, p.initialsName, p.nic, p.dob,
          p.dob == null ? null : ageOn(p.dob!, now), pl(PL.gender, p.gender), pl(PL.relation, p.relation),
          pl(PL.ethnicity, p.ethnicity), pl(PL.religion, p.religion), pl(PL.civilStatus, p.civilStatus),
          pl(PL.education, p.education), p.schoolGrade, pl(PL.occupation, p.occupation), p.workplace,
          pl(PL.disability, p.disability), pl(PL.yesNoUnknown, p.isVoter), pl(PL.personStatus, p.status), p.phone,
        ];
      }(),
  ]);

  _sheet(x, t.sheetTreesCounted, [t.fVillage, t.fHouseGroup, t.land, t.fType, t.fBearing, t.fYoungTrees, t.fTotal], [
    for (final t in s.treeCounts)
      [village(t.landId), group(t.landId), s.landById[t.landId]?.name, pl(PL.treeCountSpecies, t.species),
        t.bearing, t.young, t.bearing + t.young],
  ]);

  _sheet(x, t.valuableTrees, [
    t.fVillage, t.fHouseGroup, t.land, t.fType, t.fGirthIn, t.fHeightFt, t.fAge, title(PL.treeCondition),
    t.fHazardous, t.fLatitude, t.fLongitude,
  ], [
    for (final t in s.trees)
      [village(t.landId), group(t.landId), s.landById[t.landId]?.name, pl(PL.treeSingleSpecies, t.species),
        t.girthIn, t.heightFt, t.ageYears, pl(PL.treeCondition, t.condition), t.isHazard, t.lat, t.lng],
  ]);

  _sheet(x, t.crops, [
    t.fVillage, t.fHouseGroup, t.land, t.fCrop, t.fAmount, title(PL.cropUnit), title(PL.season),
    title(PL.cultivator), title(PL.irrigation),
  ], [
    for (final c in s.crops)
      [village(c.landId), group(c.landId), s.landById[c.landId]?.name, pl(PL.crop, c.crop), c.extentValue,
        pl(PL.cropUnit, c.extentUnit), pl(PL.season, c.season), pl(PL.cultivator, c.cultivator),
        pl(PL.irrigation, c.irrigation)],
  ]);

  _sheet(x, t.animals, [
    t.fVillage, t.fHouseGroup, t.land, t.fType, t.fMaleAnimals, t.fFemaleAnimals, t.fYoungAnimals, t.fTotal,
    title(PL.animalPurpose), t.fMilkPerDay, t.fVaccinated, t.fLastVaccination,
  ], [
    for (final a in s.animals)
      [village(a.landId), group(a.landId), s.landById[a.landId]?.name, pl(PL.animal, a.species), a.male,
        a.female, a.young, a.male + a.female + a.young, pl(PL.animalPurpose, a.purpose), a.dailyMilkL,
        pl(PL.yesNoUnknown, a.vaccinated), a.lastVaccination],
  ]);

  x.delete('Sheet1');
  return x.encode()!;
}

List<int> buildListWorkbook(String title, List<ListHit> hits) {
  final x = Excel.createExcel();
  _sheet(x, L10n.current.sheetList, ['#', title, L10n.current.fDetails], [
    for (var i = 0; i < hits.length; i++) [i + 1, hits[i].title, hits[i].subtitle],
  ]);
  x.delete('Sheet1');
  return x.encode()!;
}

/// Writes [bytes] to a temp file and opens the system share sheet.
Future<void> shareFile(List<int> bytes, String fileName, {String? text}) async {
  final dir = await getTemporaryDirectory();
  final f = File(p.join(dir.path, fileName));
  await f.writeAsBytes(bytes, flush: true);
  await SharePlus.instance.share(ShareParams(files: [XFile(f.path)], text: text));
}

String stamp() {
  final n = DateTime.now();
  String two(int v) => v.toString().padLeft(2, '0');
  return '${n.year}${two(n.month)}${two(n.day)}-${two(n.hour)}${two(n.minute)}';
}
