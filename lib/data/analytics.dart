import '../l10n/l10n.dart';
import 'bundle.dart';
import 'database.dart';
import 'nic.dart';
import 'picklists.dart';
import 'units.dart';

// ===================================================================
// Completeness & warnings for one land
// ===================================================================

class CheckItem {
  const CheckItem(this.label, this.ok, [this.hint]);
  final String label;
  final bool ok;
  final String? hint;
}

class LandCheck {
  LandCheck(this.items, this.warnings);
  final List<CheckItem> items;
  final List<String> warnings;

  int get percent =>
      items.isEmpty ? 0 : (items.where((i) => i.ok).length * 100 ~/ items.length);
  List<CheckItem> get missing => items.where((i) => !i.ok).toList();
}

const _noOwnerNeeded = {'state', 'reserve', 'temple'};
const _childRelations = {'son', 'daughter', 'grandchild'};

String _num(double v) => v == v.roundToDouble() ? v.toStringAsFixed(0) : v.toString();

bool isActive(Person p) => p.status == 'resident' || p.status == 'away';

int? ageOf(Person p, DateTime now) => p.dob == null ? null : ageOn(p.dob!, now);

LandCheck checkLand(LandBundle b, {DateTime? now}) {
  now ??= DateTime.now();
  final t = L10n.current;
  final l = b.land;
  final items = <CheckItem>[
    CheckItem(t.ckGps, l.lat != null),
    CheckItem(t.ckExtent, l.extentPerches != null),
    CheckItem(PickRegistry.instance.def(PL.ownership).title, l.ownershipType != null),
    CheckItem(
      t.ckOwner,
      _noOwnerNeeded.contains(l.ownershipType) ||
          b.parties.any((p) => p.role == 'owner'),
      t.ckOwnerHint(t.people),
    ),
    CheckItem(PickRegistry.instance.def(PL.landUse).title, l.landUse != null),
    CheckItem(t.buildings, b.buildings.isNotEmpty || l.noBuildings, t.ckNoneHintBuildings),
    CheckItem(t.photos, b.photos.isNotEmpty),
  ];

  final houses = b.houses.toList();
  if (houses.isNotEmpty) {
    items.add(CheckItem(
      t.ckHousePhotos,
      houses.every((h) => b.photosOf(h.id).isNotEmpty),
    ));
    final lived = houses.where((h) => h.usage != 'vacant');
    items.add(CheckItem(
      t.ckHouseFamilies,
      lived.every((h) => b.familiesIn(h.id).isNotEmpty),
      t.ckHouseFamiliesHint(pl(PL.buildingUsage, 'vacant')),
    ));
  }
  if (b.families.isNotEmpty) {
    items.add(CheckItem(
      t.ckMembers,
      b.families.every((f) => b.membersOf(f.id).isNotEmpty),
    ));
  }
  items.add(CheckItem(
    t.treesAndCrops,
    b.treeCounts.isNotEmpty || b.trees.isNotEmpty || b.crops.isNotEmpty || l.noTrees,
    t.ckNoneHintTrees,
  ));
  items.add(CheckItem(
    t.animals,
    b.animals.isNotEmpty || l.noAnimals,
    t.ckNoneHintAnimals,
  ));

  final warnings = <String>[];
  if (l.gpsAccuracy != null && l.gpsAccuracy! > 10) {
    warnings.add(t.wGpsAccuracy(l.gpsAccuracy!.round()));
  }
  final counted = b.treeCounts.fold<int>(0, (s, t) => s + t.bearing + t.young);
  if (l.extentPerches != null && l.extentPerches! > 0 && counted > l.extentPerches! * 2) {
    warnings.add(t.wTooManyTrees(formatExtent(l.extentPerches), counted));
  }
  for (final f in b.families) {
    final members = b.membersOf(f.id).where(isActive).toList();
    final heads = members.where((p) => p.relation == 'head').toList();
    if (members.isNotEmpty && heads.length != 1) {
      warnings.add(heads.isEmpty ? t.wNoHead : t.wManyHeads(heads.length));
    }
    if (heads.length == 1) {
      final headAge = ageOf(heads.first, now);
      for (final c in members.where((p) => _childRelations.contains(p.relation))) {
        final a = ageOf(c, now);
        if (headAge != null && a != null && a >= headAge) {
          warnings.add(t.wOlderThanHead(c.fullName));
        }
      }
    }
  }
  final seenNic = <String, String>{};
  for (final p in b.persons.where(isActive)) {
    final age = ageOf(p, now);
    if (p.dob == null) warnings.add(t.wNoDob(p.fullName));
    if ((p.nic ?? '').isEmpty) {
      if (age != null && age >= 16) warnings.add(t.wNoNic(p.fullName, age));
    } else {
      final r = parseNic(p.nic!, now: now);
      if (!r.isValid) {
        warnings.add(t.wInvalidNic(p.fullName));
      } else if (p.dob != null && r.info!.dob != DateTime(p.dob!.year, p.dob!.month, p.dob!.day)) {
        warnings.add(t.wDobNicMismatch(p.fullName));
      }
      final other = seenNic[p.nic!];
      if (other != null) warnings.add(t.wSameNic(p.fullName, other));
      seenNic[p.nic!] = p.fullName;
    }
  }
  return LandCheck(items, warnings);
}

// ===================================================================
// Division statistics
// ===================================================================

class Counter {
  final Map<String, int> counts = {};
  void add(String? key, [int n = 1]) {
    final k = (key == null || key.isEmpty) ? 'unknown' : key;
    counts[k] = (counts[k] ?? 0) + n;
  }

  int get total => counts.values.fold(0, (a, b) => a + b);

  List<MapEntry<String, int>> sorted() =>
      counts.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
}

const ageGroups = ['0 – 5', '6 – 17', '18 – 30', '31 – 59', '60 – 69', '70+'];

String ageGroup(int age) => age <= 5
    ? ageGroups[0]
    : age <= 17
        ? ageGroups[1]
        : age <= 30
            ? ageGroups[2]
            : age <= 59
                ? ageGroups[3]
                : age <= 69
                    ? ageGroups[4]
                    : ageGroups[5];

class DivisionStats {
  int population = 0, male = 0, female = 0, away = 0;
  int familiesCount = 0, housesCount = 0, buildingsCount = 0, landsCount = 0;
  int disputes = 0;
  double totalExtent = 0, dailyMilk = 0;
  final ageGroup = Counter(),
      ethnicity = Counter(),
      religion = Counter(),
      education = Counter(),
      occupation = Counter(),
      disability = Counter(),
      civilStatus = Counter(),
      voters = Counter(),
      welfare = Counter(),
      tenure = Counter(),
      income = Counter(),
      fuel = Counter(),
      buildingType = Counter(),
      permanence = Counter(),
      condition = Counter(),
      water = Counter(),
      toilet = Counter(),
      electricity = Counter(),
      ownership = Counter(),
      landUse = Counter(),
      treeCounts = Counter(),
      treeSingles = Counter(),
      cropPerches = Counter(),
      cropPlants = Counter(),
      animals = Counter();
  int get treesTotal => treeCounts.total + treeSingles.total;
  int get animalsTotal => animals.total;
}

DivisionStats computeStats(Snapshot s, {DateTime? now}) {
  now ??= DateTime.now();
  final st = DivisionStats();
  for (final p in s.persons.where(isActive)) {
    st.population++;
    if (p.gender == 'm') st.male++;
    if (p.gender == 'f') st.female++;
    if (p.status == 'away') st.away++;
    final age = ageOf(p, now);
    st.ageGroup.add(age == null ? null : ageGroup(age));
    st.ethnicity.add(p.ethnicity);
    st.religion.add(p.religion);
    st.education.add(p.education);
    st.occupation.add(p.occupation);
    if (p.disability != null && p.disability != 'none') st.disability.add(p.disability);
    st.civilStatus.add(p.civilStatus);
    if (age == null || age >= 18) st.voters.add(p.isVoter);
  }
  st.familiesCount = s.families.length;
  for (final f in s.families) {
    for (final w in splitCodes(f.welfare)) {
      st.welfare.add(w);
    }
    st.tenure.add(f.tenure);
    st.income.add(f.incomeRange);
    st.fuel.add(f.cookingFuel);
  }
  st.buildingsCount = s.buildings.length;
  for (final b in s.buildings) {
    st.buildingType.add(b.type);
    if (b.type != 'house') continue;
    st.housesCount++;
    st.permanence.add(b.permanence);
    st.condition.add(b.condition);
    st.water.add(b.waterSource);
    st.toilet.add(b.toilet);
    st.electricity.add(b.electricity);
  }
  st.landsCount = s.lands.length;
  for (final l in s.lands) {
    st.totalExtent += l.extentPerches ?? 0;
    st.ownership.add(l.ownershipType);
    st.landUse.add(l.landUse);
    if (l.hasDispute) st.disputes++;
  }
  for (final t in s.treeCounts) {
    st.treeCounts.add(t.species, t.bearing + t.young);
  }
  for (final t in s.trees) {
    st.treeSingles.add(t.species);
  }
  for (final c in s.crops) {
    if (c.extentValue == null) continue;
    final p = cropExtentToPerches(c.extentValue!, c.extentUnit ?? 'perch');
    if (p != null) {
      st.cropPerches.add(c.crop, p.round());
    } else {
      st.cropPlants.add(c.crop, c.extentValue!.round());
    }
  }
  for (final a in s.animals) {
    st.animals.add(a.species, a.male + a.female + a.young);
    st.dailyMilk += a.dailyMilkL ?? 0;
  }
  return st;
}

// ===================================================================
// Survey progress
// ===================================================================

class GroupProgress {
  GroupProgress(this.group, this.lands, this.done, this.verified);
  final HouseGroup group;
  final int lands, done, verified;
  int get target => [group.expectedLands ?? 0, lands, 1].reduce((a, b) => a > b ? a : b);
  double get fraction => done / target;
}

List<GroupProgress> surveyProgress(Snapshot s) => [
      for (final g in s.groups)
        () {
          final ls = s.lands.where((l) => l.houseGroupId == g.id);
          return GroupProgress(
            g,
            ls.length,
            ls.where((l) => l.status != 'draft').length,
            ls.where((l) => l.status == 'verified').length,
          );
        }(),
    ];

// ===================================================================
// Ready-made lists ("සූදානම් ලැයිස්තු" / ready-made lists) and data quality
// ===================================================================

class ListHit {
  const ListHit(this.title, this.subtitle, this.landId, {this.personId});
  final String title;
  final String subtitle;
  final String? landId;
  final String? personId;
}

class ReadyList {
  const ReadyList(this.id, this._title, this.run);
  final String id;
  final String Function(AppLocalizations t) _title;
  final List<ListHit> Function(Snapshot s, DateTime now) run;

  /// Title in the current language.
  String get title => _title(L10n.current);
}

String _place(Snapshot s, String? landId) {
  final l = landId == null ? null : s.landById[landId];
  if (l == null) return '';
  final g = s.groupById[l.houseGroupId];
  return '${l.name} • ${g?.code ?? ''}';
}

ListHit _personHit(Snapshot s, Person p, DateTime now, [String extra = '']) {
  final age = ageOf(p, now);
  final landId = s.landOfPerson(p);
  return ListHit(
    p.fullName,
    [if (age != null) L10n.current.ageN(age), if (extra.isNotEmpty) extra, _place(s, landId)]
        .where((x) => x.isNotEmpty)
        .join(' • '),
    landId,
    personId: p.id,
  );
}

ListHit _buildingHit(Snapshot s, Building b, String extra) => ListHit(
      '${pl(PL.buildingType, b.type)}${b.buildingNo == null ? '' : ' (${b.buildingNo})'}',
      [extra, _place(s, b.landId)].where((x) => x.isNotEmpty).join(' • '),
      b.landId,
    );

ListHit _landHit(Snapshot s, Land l, String extra) => ListHit(
      l.name,
      [extra, s.groupById[l.houseGroupId]?.code ?? ''].where((x) => x.isNotEmpty).join(' • '),
      l.id,
    );

ListHit _familyHit(Snapshot s, Family f, String extra) {
  final head = s.personById[f.headPersonId];
  final landId = s.landOfFamily[f.id];
  return ListHit(
    head == null ? L10n.current.family : L10n.current.familyOf(head.fullName),
    [extra, _place(s, landId)].where((x) => x.isNotEmpty).join(' • '),
    landId,
  );
}

Iterable<Building> _houses(Snapshot s) => s.buildings.where((b) => b.type == 'house');

final List<ReadyList> readyLists = [
  ReadyList('elderly60', (t) => t.rlElderly60, (s, now) => [
        for (final p in s.persons.where(isActive))
          if ((ageOf(p, now) ?? -1) >= 60) _personHit(s, p, now),
      ]),
  ReadyList('alone70', (t) => t.rlAlone70, (s, now) {
    final activeByFamily = <String, int>{};
    for (final p in s.persons.where((p) => p.status == 'resident')) {
      activeByFamily[p.familyId] = (activeByFamily[p.familyId] ?? 0) + 1;
    }
    return [
      for (final p in s.persons.where((p) => p.status == 'resident'))
        if ((ageOf(p, now) ?? -1) >= 70 && activeByFamily[p.familyId] == 1)
          _personHit(s, p, now),
    ];
  }),
  ReadyList('under5', (t) => t.rlUnder5, (s, now) => [
        for (final p in s.persons.where(isActive))
          if ((ageOf(p, now) ?? 99) <= 5) _personHit(s, p, now),
      ]),
  ReadyList('school', (t) => t.rlSchool, (s, now) => [
        for (final p in s.persons.where(isActive))
          if (p.education == 'schooling')
            _personHit(s, p, now, p.schoolGrade == null ? '' : L10n.current.gradeN(p.schoolGrade!)),
      ]),
  ReadyList('disabled', (t) => t.rlDisabled, (s, now) => [
        for (final p in s.persons.where(isActive))
          if (p.disability != null && p.disability != 'none')
            _personHit(s, p, now, pl(PL.disability, p.disability)),
      ]),
  ReadyList('away', (t) => t.rlAway, (s, now) => [
        for (final p in s.persons)
          if (p.status == 'away' || (isActive(p) && p.occupation == 'foreign'))
            _personHit(s, p, now, pl(PL.occupation, p.occupation)),
      ]),
  ReadyList('no_nic', (t) => t.adultsWithoutNic, (s, now) => [
        for (final p in s.persons.where(isActive))
          if ((p.nic ?? '').isEmpty && (ageOf(p, now) ?? 0) >= 16) _personHit(s, p, now),
      ]),
  ReadyList('welfare', (t) => t.rlWelfare, (s, now) => [
        for (final f in s.families)
          if (splitCodes(f.welfare).isNotEmpty)
            _familyHit(s, f, PickRegistry.instance.labels(PL.welfare, f.welfare)),
      ]),
  ReadyList('poor_houses', (t) => t.dilapidatedHouses, (s, now) => [
        for (final b in _houses(s))
          if (b.condition == 'poor' || b.condition == 'unusable')
            _buildingHit(s, b, pl(PL.condition, b.condition)),
      ]),
  ReadyList('temp_houses', (t) => t.rlTempHouses, (s, now) => [
        for (final b in _houses(s))
          if (b.permanence == 'temporary' || b.permanence == 'semi')
            _buildingHit(s, b, pl(PL.permanence, b.permanence)),
      ]),
  ReadyList('no_toilet', (t) => t.rlNoToilet, (s, now) => [
        for (final b in _houses(s))
          if (b.toilet == 'none') _buildingHit(s, b, ''),
      ]),
  ReadyList('no_power', (t) => t.rlNoPower, (s, now) => [
        for (final b in _houses(s))
          if (b.electricity == 'none') _buildingHit(s, b, ''),
      ]),
  ReadyList('unsafe_water', (t) => t.rlUnsafeWater, (s, now) => [
        for (final b in _houses(s))
          if (const {'unprotected_well', 'stream', 'bowser'}.contains(b.waterSource))
            _buildingHit(s, b, pl(PL.water, b.waterSource)),
      ]),
  ReadyList('state_land', (t) => t.rlStateLand, (s, now) => [
        for (final f in s.families)
          if (() {
            final l = s.landById[s.landOfFamily[f.id]];
            return f.tenure == 'encroached' ||
                const {'state', 'reserve', 'encroached'}.contains(l?.ownershipType);
          }())
            _familyHit(s, f, pl(PL.ownership, s.landById[s.landOfFamily[f.id]]?.ownershipType)),
      ]),
  ReadyList('disputes', (t) => t.landsWithDisputes, (s, now) => [
        for (final l in s.lands)
          if (l.hasDispute) _landHit(s, l, l.disputeNote ?? ''),
      ]),
  ReadyList('milk', (t) => t.rlMilk, (s, now) => [
        for (final a in s.animals)
          if (a.purpose == 'milk')
            ListHit(
              '${pl(PL.animal, a.species)} ${a.male + a.female + a.young}',
              [
                if (a.dailyMilkL != null) L10n.current.milkPerDay(_num(a.dailyMilkL!)),
                _place(s, a.landId),
              ].where((x) => x.isNotEmpty).join(' • '),
              a.landId,
            ),
      ]),
  ReadyList('dogs', (t) => t.rlDogs, (s, now) => [
        for (final a in s.animals)
          if (a.species == 'dog' && a.vaccinated != 'yes')
            ListHit(L10n.current.dogsN(a.male + a.female + a.young), _place(s, a.landId), a.landId),
      ]),
  ReadyList('timber', (t) => t.rlTimber, (s, now) {
    final byLand = <String, List<Tree>>{};
    for (final t in s.trees) {
      byLand.putIfAbsent(t.landId, () => []).add(t);
    }
    return [
      for (final e in byLand.entries)
        if (s.landById[e.key] != null)
          _landHit(
            s,
            s.landById[e.key]!,
            '${e.value.map((t) => pl(PL.treeSingleSpecies, t.species)).toSet().join(', ')} (${e.value.length})',
          ),
    ];
  }),
  ReadyList('hazard_trees', (t) => t.rlHazardTrees, (s, now) => [
        for (final t in s.trees)
          if (t.isHazard)
            ListHit(pl(PL.treeSingleSpecies, t.species), _place(s, t.landId), t.landId),
      ]),
];

class QualitySection {
  QualitySection(this.title, this.hits);
  final String title;
  final List<ListHit> hits;
}

List<QualitySection> qualityReport(Snapshot s, {DateTime? now}) {
  now ??= DateTime.now();
  final nicGroups = <String, List<Person>>{};
  for (final p in s.persons.where(isActive)) {
    if ((p.nic ?? '').isNotEmpty) nicGroups.putIfAbsent(p.nic!, () => []).add(p);
  }
  final houses = _houses(s);
  final photoOwners = s.photos.map((p) => p.ownerId).toSet();
  final stale = now.subtract(const Duration(days: 365));
  final t = L10n.current;
  return [
    QualitySection(t.qSameNic, [
      for (final g in nicGroups.values)
        if (g.length > 1)
          for (final p in g) _personHit(s, p, now, p.nic!),
    ]),
    QualitySection(t.qInvalidNic, [
      for (final p in s.persons.where(isActive))
        if ((p.nic ?? '').isNotEmpty && !parseNic(p.nic!, now: now).isValid)
          _personHit(s, p, now, p.nic!),
    ]),
    QualitySection(t.adultsWithoutNic, [
      for (final p in s.persons.where(isActive))
        if ((p.nic ?? '').isEmpty && (ageOf(p, now) ?? 0) >= 16) _personHit(s, p, now),
    ]),
    QualitySection(t.qNoDob, [
      for (final p in s.persons.where(isActive))
        if (p.dob == null) _personHit(s, p, now),
    ]),
    QualitySection(t.qNoGps, [
      for (final l in s.lands)
        if (l.lat == null) _landHit(s, l, ''),
    ]),
    QualitySection(t.qPoorGps, [
      for (final l in s.lands)
        if ((l.gpsAccuracy ?? 0) > 10) _landHit(s, l, t.metresN(l.gpsAccuracy!.round())),
    ]),
    QualitySection(t.qNoHousePhoto, [
      for (final b in houses)
        if (!photoOwners.contains(b.id)) _buildingHit(s, b, ''),
    ]),
    QualitySection(t.qDraft, [
      for (final l in s.lands)
        if (l.status == 'draft') _landHit(s, l, ''),
    ]),
    QualitySection(t.qStale, [
      for (final l in s.lands)
        if (l.status == 'verified' && l.verifiedAt != null && l.verifiedAt!.isBefore(stale))
          _landHit(s, l, t.lastVerifiedYear('${l.verifiedAt!.year}')),
    ]),
  ];
}
