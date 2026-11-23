import 'dart:io';

import 'package:excel/excel.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'analytics.dart';
import 'bundle.dart';
import 'nic.dart';
import 'picklists.dart';
import 'units.dart';

CellValue _c(Object? v) => switch (v) {
      null => TextCellValue(''),
      int i => IntCellValue(i),
      double d => DoubleCellValue(double.parse(d.toStringAsFixed(3))),
      bool b => TextCellValue(b ? 'ඔව්' : 'නැත'),
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

/// Full division workbook: one sheet per record type, with pick-list codes
/// translated to Sinhala labels.
List<int> buildDivisionWorkbook(Snapshot s) {
  final x = Excel.createExcel();
  final now = DateTime.now();
  String group(String landId) => s.groupById[s.landById[landId]?.houseGroupId]?.code ?? '';
  String village(String landId) {
    final l = s.landById[landId];
    return l == null ? '' : s.villageOfLand(l)?.name ?? '';
  }

  _sheet(x, 'ඉඩම්', [
    'ගම්මානය', 'ගෘහ කණ්ඩායම', 'ඉඩමේ නම', 'ලිපිනය', 'ප්‍රමාණය (පර්චස්)', 'ප්‍රමාණය', 'අයිතිය',
    'අයිතිකරුවන්', 'ඔප්පු අංකය', 'පිඹුරු අංකය', 'කට්ටි අංකය', 'ජනපදය', 'භාවිතය', 'උතුර', 'නැගෙනහිර',
    'දකුණ', 'බටහිර', 'ආරවුල', 'අක්ෂාංශ', 'දේශාංශ', 'GPS නිරවද්‍යතාව (මී)', 'තත්ත්වය', 'තහවුරු කළ දිනය',
  ], [
    for (final l in s.lands)
      [
        village(l.id), group(l.id), l.name, l.addressText, l.extentPerches, formatExtent(l.extentPerches),
        pl(PL.ownership, l.ownershipType), s.bundle(l.id).ownerNames.join(', '), l.deedNo, l.planNo,
        l.lotNo, l.schemeName, pl(PL.landUse, l.landUse), l.boundaryNorth, l.boundaryEast,
        l.boundarySouth, l.boundaryWest, l.hasDispute ? (l.disputeNote ?? 'ඔව්') : '', l.lat, l.lng,
        l.gpsAccuracy, l.status, l.verifiedAt,
      ],
  ]);

  _sheet(x, 'ගොඩනැගිලි', [
    'ගම්මානය', 'ගෘහ කණ්ඩායම', 'ඉඩම', 'වර්ගය', 'අංකය', 'මහල්', 'වර්ග අඩි', 'කාමර', 'බිත්ති', 'වහලය',
    'පොළොව', 'ස්ථිරභාවය', 'තත්ත්වය', 'ඉදිකළ වර්ෂය', 'භාවිතය', 'විදුලිය', 'ජලය', 'වැසිකිළිය', 'අනුමැතිය',
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

  _sheet(x, 'පවුල්', [
    'ගම්මානය', 'ගෘහ කණ්ඩායම', 'ඉඩම', 'ප්‍රධානියා', 'සාමාජිකයින්', 'නිවසට අයිතිය', 'මාසික ආදායම',
    'ආදායම් මාර්ගය', 'ඉන්ධන', 'සුබසාධන', 'පදිංචි වර්ෂය', 'දුරකථනය',
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

  _sheet(x, 'පුද්ගලයින්', [
    'ගම්මානය', 'ගෘහ කණ්ඩායම', 'ඉඩම', 'සම්පූර්ණ නම', 'මුලකුරු සහිත නම', 'හැඳුනුම්පත', 'උපන් දිනය', 'වයස',
    'ස්ත්‍රී/පුරුෂ', 'සම්බන්ධතාව', 'ජාතිය', 'ආගම', 'විවාහක තත්ත්වය', 'අධ්‍යාපනය', 'ශ්‍රේණිය', 'රැකියාව',
    'රැකියා ස්ථානය', 'ආබාධ', 'ඡන්ද හිමි', 'පදිංචි තත්ත්වය', 'දුරකථනය',
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

  _sheet(x, 'ගස් (ගණනය)', ['ගම්මානය', 'ගෘහ කණ්ඩායම', 'ඉඩම', 'වර්ගය', 'ඵල දරන', 'ළපටි', 'මුළු'], [
    for (final t in s.treeCounts)
      [village(t.landId), group(t.landId), s.landById[t.landId]?.name, pl(PL.treeCountSpecies, t.species),
        t.bearing, t.young, t.bearing + t.young],
  ]);

  _sheet(x, 'වටිනා ගස්', [
    'ගම්මානය', 'ගෘහ කණ්ඩායම', 'ඉඩම', 'වර්ගය', 'වට (අඟල්)', 'උස (අඩි)', 'වයස', 'තත්ත්වය', 'අනතුරුදායක',
    'අක්ෂාංශ', 'දේශාංශ',
  ], [
    for (final t in s.trees)
      [village(t.landId), group(t.landId), s.landById[t.landId]?.name, pl(PL.treeSingleSpecies, t.species),
        t.girthIn, t.heightFt, t.ageYears, pl(PL.treeCondition, t.condition), t.isHazard, t.lat, t.lng],
  ]);

  _sheet(x, 'බෝග', ['ගම්මානය', 'ගෘහ කණ්ඩායම', 'ඉඩම', 'බෝගය', 'ප්‍රමාණය', 'ඒකකය', 'කන්නය', 'වගා කරන්නා', 'ජල සම්පාදනය'], [
    for (final c in s.crops)
      [village(c.landId), group(c.landId), s.landById[c.landId]?.name, pl(PL.crop, c.crop), c.extentValue,
        pl(PL.cropUnit, c.extentUnit), pl(PL.season, c.season), pl(PL.cultivator, c.cultivator),
        pl(PL.irrigation, c.irrigation)],
  ]);

  _sheet(x, 'සතුන්', [
    'ගම්මානය', 'ගෘහ කණ්ඩායම', 'ඉඩම', 'වර්ගය', 'පිරිමි', 'ගැහැණු', 'පැටවුන්', 'මුළු', 'අරමුණ',
    'කිරි (ලී./දින)', 'එන්නත්', 'අවසන් එන්නත',
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
  _sheet(x, 'ලැයිස්තුව', ['#', title, 'විස්තර'], [
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
