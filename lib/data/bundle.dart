import 'package:drift/drift.dart';

import 'database.dart';

/// Everything recorded about one land (non-deleted rows only).
class LandBundle {
  LandBundle({
    required this.land,
    required this.parties,
    required this.buildings,
    required this.families,
    required this.persons,
    required this.treeCounts,
    required this.trees,
    required this.crops,
    required this.animals,
    required this.photos,
    this.partyPersons = const {},
  });

  final Land land;
  final List<LandParty> parties;
  final List<Building> buildings;
  final List<Family> families;
  final List<Person> persons;
  final List<TreeCount> treeCounts;
  final List<Tree> trees;
  final List<Crop> crops;
  final List<Animal> animals;
  final List<Photo> photos;

  /// Persons referenced by [parties] (may live on other lands).
  final Map<String, Person> partyPersons;

  List<Person> membersOf(String familyId) =>
      persons.where((p) => p.familyId == familyId).toList();

  List<Family> familiesIn(String buildingId) =>
      families.where((f) => f.buildingId == buildingId).toList();

  Iterable<Building> get houses => buildings.where((b) => b.type == 'house');

  List<Photo> photosOf(String ownerId) =>
      photos.where((p) => p.ownerId == ownerId).toList();

  int get treeTotal =>
      treeCounts.fold<int>(0, (s, t) => s + t.bearing + t.young) + trees.length;

  int get animalTotal =>
      animals.fold<int>(0, (s, a) => s + a.male + a.female + a.young);

  String partyName(LandParty p) =>
      partyPersons[p.personId]?.fullName ?? p.outsideName ?? '—';

  List<String> get ownerNames => parties
      .where((p) => p.role == 'owner')
      .map(partyName)
      .toList();
}

/// The whole division in memory. A division has at most a few thousand
/// people, so loading everything and aggregating in Dart is simple and fast.
class Snapshot {
  Snapshot({
    required this.villages,
    required this.groups,
    required this.lands,
    required this.parties,
    required this.buildings,
    required this.families,
    required this.persons,
    required this.treeCounts,
    required this.trees,
    required this.crops,
    required this.animals,
    required this.photos,
  }) {
    for (final b in buildings) {
      buildingsByLand.putIfAbsent(b.landId, () => []).add(b);
    }
    final buildingLand = {for (final b in buildings) b.id: b.landId};
    for (final f in families) {
      final landId = buildingLand[f.buildingId];
      if (landId != null) landOfFamily[f.id] = landId;
    }
    personById.addAll({for (final p in persons) p.id: p});
  }

  final List<Village> villages;
  final List<HouseGroup> groups;
  final List<Land> lands;
  final List<LandParty> parties;
  final List<Building> buildings;
  final List<Family> families;
  final List<Person> persons;
  final List<TreeCount> treeCounts;
  final List<Tree> trees;
  final List<Crop> crops;
  final List<Animal> animals;
  final List<Photo> photos;

  final Map<String, List<Building>> buildingsByLand = {};
  final Map<String, String> landOfFamily = {};
  final Map<String, Person> personById = {};

  late final Map<String, HouseGroup> groupById = {for (final g in groups) g.id: g};
  late final Map<String, Village> villageById = {for (final v in villages) v.id: v};
  late final Map<String, Land> landById = {for (final l in lands) l.id: l};

  String? landOfPerson(Person p) => landOfFamily[p.familyId];

  Village? villageOfLand(Land l) =>
      villageById[groupById[l.houseGroupId]?.villageId];

  /// Restricts every list to one village (null = whole division).
  Snapshot forVillage(String? villageId) {
    if (villageId == null) return this;
    final groupIds = groups
        .where((g) => g.villageId == villageId)
        .map((g) => g.id)
        .toSet();
    final landIds =
        lands.where((l) => groupIds.contains(l.houseGroupId)).map((l) => l.id).toSet();
    final buildingIds =
        buildings.where((b) => landIds.contains(b.landId)).map((b) => b.id).toSet();
    final familyIds =
        families.where((f) => buildingIds.contains(f.buildingId)).map((f) => f.id).toSet();
    return Snapshot(
      villages: villages.where((v) => v.id == villageId).toList(),
      groups: groups.where((g) => groupIds.contains(g.id)).toList(),
      lands: lands.where((l) => landIds.contains(l.id)).toList(),
      parties: parties.where((p) => landIds.contains(p.landId)).toList(),
      buildings: buildings.where((b) => landIds.contains(b.landId)).toList(),
      families: families.where((f) => familyIds.contains(f.id)).toList(),
      persons: persons.where((p) => familyIds.contains(p.familyId)).toList(),
      treeCounts: treeCounts.where((t) => landIds.contains(t.landId)).toList(),
      trees: trees.where((t) => landIds.contains(t.landId)).toList(),
      crops: crops.where((c) => landIds.contains(c.landId)).toList(),
      animals: animals.where((a) => landIds.contains(a.landId)).toList(),
      photos: photos.where((p) => landIds.contains(p.landId)).toList(),
    );
  }

  LandBundle bundle(String landId) {
    final land = landById[landId]!;
    final bs = buildingsByLand[landId] ?? const [];
    final bIds = bs.map((b) => b.id).toSet();
    final fs = families.where((f) => bIds.contains(f.buildingId)).toList();
    final fIds = fs.map((f) => f.id).toSet();
    final ps = parties.where((p) => p.landId == landId).toList();
    return LandBundle(
      land: land,
      parties: ps,
      buildings: bs,
      families: fs,
      persons: persons.where((p) => fIds.contains(p.familyId)).toList(),
      treeCounts: treeCounts.where((t) => t.landId == landId).toList(),
      trees: trees.where((t) => t.landId == landId).toList(),
      crops: crops.where((c) => c.landId == landId).toList(),
      animals: animals.where((a) => a.landId == landId).toList(),
      photos: photos.where((p) => p.landId == landId).toList(),
      partyPersons: {
        for (final p in ps)
          if (p.personId != null && personById[p.personId] != null)
            p.personId!: personById[p.personId]!,
      },
    );
  }
}

extension Loaders on AppDb {
  /// Emits [load]'s result now and again whenever any of [tables] changes.
  Stream<T> watchLoad<T>(
      List<TableInfo<Table, dynamic>> tables, Future<T> Function() load) async* {
    yield await load();
    await for (final _ in tableUpdates(TableUpdateQuery.onAllTables(tables))) {
      yield await load();
    }
  }

  List<TableInfo<Table, dynamic>> get recordTables => [
        villages,
        houseGroups,
        lands,
        landParties,
        buildings,
        families,
        persons,
        treeCounts,
        trees,
        crops,
        animals,
        photos,
      ];

  Future<List<D>> _live<T extends Table, D>(TableInfo<T, D> t) =>
      (select(t)..where((_) => (t.columnsByName['deleted_at']! as GeneratedColumn<DateTime>).isNull()))
          .get();

  Future<Snapshot> loadSnapshot() async => Snapshot(
        villages: await (select(villages)
              ..where((v) => v.deletedAt.isNull())
              ..orderBy([(v) => OrderingTerm(expression: v.sortOrder), (v) => OrderingTerm(expression: v.name)]))
            .get(),
        groups: await (select(houseGroups)
              ..where((g) => g.deletedAt.isNull())
              ..orderBy([(g) => OrderingTerm(expression: g.code)]))
            .get(),
        lands: await (select(lands)
              ..where((l) => l.deletedAt.isNull())
              ..orderBy([(l) => OrderingTerm(expression: l.name)]))
            .get(),
        parties: await _live(landParties),
        buildings: await _live(buildings),
        families: await _live(families),
        persons: await _live(persons),
        treeCounts: await _live(treeCounts),
        trees: await _live(trees),
        crops: await _live(crops),
        animals: await _live(animals),
        photos: await _live(photos),
      );

  Stream<Snapshot> watchSnapshot() => watchLoad(recordTables, loadSnapshot);

  Future<LandBundle?> loadBundle(String landId) async {
    final land = await byId(lands, landId);
    if (land == null) return null;
    final bs = await (select(buildings)
          ..where((b) => b.landId.equals(landId) & b.deletedAt.isNull())
          ..orderBy([(b) => OrderingTerm(expression: b.createdAt)]))
        .get();
    final bIds = bs.map((b) => b.id).toList();
    final fs = bIds.isEmpty
        ? <Family>[]
        : await (select(families)
              ..where((f) => f.buildingId.isIn(bIds) & f.deletedAt.isNull())
              ..orderBy([(f) => OrderingTerm(expression: f.createdAt)]))
            .get();
    final fIds = fs.map((f) => f.id).toList();
    final ps = fIds.isEmpty
        ? <Person>[]
        : await (select(persons)
              ..where((p) => p.familyId.isIn(fIds) & p.deletedAt.isNull())
              ..orderBy([(p) => OrderingTerm(expression: p.createdAt)]))
            .get();
    final parties = await (select(landParties)
          ..where((p) => p.landId.equals(landId) & p.deletedAt.isNull())
          ..orderBy([(p) => OrderingTerm(expression: p.createdAt)]))
        .get();
    final partyPersonIds =
        parties.map((p) => p.personId).whereType<String>().toList();
    final partyPersons = partyPersonIds.isEmpty
        ? <Person>[]
        : await (select(persons)..where((p) => p.id.isIn(partyPersonIds))).get();
    return LandBundle(
      land: land,
      parties: parties,
      buildings: bs,
      families: fs,
      persons: ps,
      treeCounts: await (select(treeCounts)
            ..where((t) => t.landId.equals(landId) & t.deletedAt.isNull()))
          .get(),
      trees: await (select(trees)
            ..where((t) => t.landId.equals(landId) & t.deletedAt.isNull()))
          .get(),
      crops: await (select(crops)
            ..where((c) => c.landId.equals(landId) & c.deletedAt.isNull()))
          .get(),
      animals: await (select(animals)
            ..where((a) => a.landId.equals(landId) & a.deletedAt.isNull()))
          .get(),
      photos: await (select(photos)
            ..where((p) => p.landId.equals(landId) & p.deletedAt.isNull())
            ..orderBy([(p) => OrderingTerm(expression: p.takenAt)]))
          .get(),
      partyPersons: {for (final p in partyPersons) p.id: p},
    );
  }

  Stream<LandBundle?> watchBundle(String landId) =>
      watchLoad(recordTables, () => loadBundle(landId));

  /// Other (non-deleted) persons with the same NIC.
  Future<List<Person>> personsWithNic(String nic, {String? exceptId}) =>
      (select(persons)
            ..where((p) =>
                p.nic.equals(nic) &
                p.deletedAt.isNull() &
                (exceptId == null ? const Constant(true) : p.id.equals(exceptId).not())))
          .get();

  /// Soft-deletes a land and everything recorded on it.
  Future<void> deleteLandCascade(String landId) async {
    final b = await loadBundle(landId);
    if (b == null) return;
    await transaction(() async {
      for (final p in b.persons) {
        await softDelete(persons, p.id, landId: landId);
      }
      for (final f in b.families) {
        await softDelete(families, f.id, landId: landId);
      }
      for (final x in b.buildings) {
        await softDelete(buildings, x.id, landId: landId);
      }
      for (final x in b.parties) {
        await softDelete(landParties, x.id, landId: landId);
      }
      for (final x in b.treeCounts) {
        await softDelete(treeCounts, x.id, landId: landId);
      }
      for (final x in b.trees) {
        await softDelete(trees, x.id, landId: landId);
      }
      for (final x in b.crops) {
        await softDelete(crops, x.id, landId: landId);
      }
      for (final x in b.animals) {
        await softDelete(animals, x.id, landId: landId);
      }
      for (final x in b.photos) {
        await softDelete(photos, x.id, landId: landId);
      }
      await softDelete(lands, landId, landId: landId);
    });
  }

  /// Soft-deletes a building with its families and their members.
  Future<void> deleteBuildingCascade(String buildingId, String landId) async {
    await transaction(() async {
      final fs = await (select(families)
            ..where((f) => f.buildingId.equals(buildingId) & f.deletedAt.isNull()))
          .get();
      for (final f in fs) {
        await deleteFamilyCascade(f.id, landId);
      }
      await softDelete(buildings, buildingId, landId: landId);
    });
  }

  Future<void> deleteFamilyCascade(String familyId, String landId) async {
    await transaction(() async {
      final ps = await (select(persons)
            ..where((p) => p.familyId.equals(familyId) & p.deletedAt.isNull()))
          .get();
      for (final p in ps) {
        await softDelete(persons, p.id, landId: landId);
      }
      await softDelete(families, familyId, landId: landId);
    });
  }

  Future<List<ChangeLog>> loadHistory(String landId) => (select(changeLogs)
        ..where((c) => c.landId.equals(landId))
        ..orderBy([(c) => OrderingTerm(expression: c.seq, mode: OrderingMode.desc)])
        ..limit(300))
      .get();

  Future<List<PickItem>> loadCustomPicks() =>
      (select(pickItems)..where((p) => p.deletedAt.isNull())).get();

  Future<Division?> loadDivision() =>
      (select(divisions)..where((d) => d.deletedAt.isNull())..limit(1)).getSingleOrNull();
}
