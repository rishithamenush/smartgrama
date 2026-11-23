import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:uuid/uuid.dart';

part 'database.g.dart';

const _uuid = Uuid();
String newId() => _uuid.v4();

/// Columns shared by every record table: uuid primary key (so records can
/// be created offline), timestamps, and soft delete — nothing is ever
/// physically deleted.
mixin Record on Table {
  TextColumn get id => text()();
  DateTimeColumn get createdAt => dateTime().clientDefault(DateTime.now)();
  DateTimeColumn get updatedAt => dateTime().clientDefault(DateTime.now)();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// ---------------------------------------------------------------- structure

@DataClassName('Division')
class Divisions extends Table with Record {
  TextColumn get code => text()();
  TextColumn get name => text()();
  TextColumn get dsDivision => text().withDefault(const Constant(''))();
  TextColumn get district => text().withDefault(const Constant(''))();
  TextColumn get officerName => text().withDefault(const Constant(''))();
}

@DataClassName('Village')
class Villages extends Table with Record {
  TextColumn get name => text()();
  TextColumn get supervisingOfficer => text().nullable()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
}

@DataClassName('HouseGroup')
class HouseGroups extends Table with Record {
  TextColumn get villageId => text().references(Villages, #id)();
  TextColumn get code => text()();
  TextColumn get leaderName => text().nullable()();
  TextColumn get leaderPhone => text().nullable()();

  /// Approximate number of lands/houses expected — drives survey progress.
  IntColumn get expectedLands => integer().nullable()();
}

// ---------------------------------------------------------------- land

@DataClassName('Land')
class Lands extends Table with Record {
  TextColumn get houseGroupId => text().references(HouseGroups, #id)();
  TextColumn get name => text()();
  TextColumn get addressText => text().nullable()();
  RealColumn get lat => real().nullable()();
  RealColumn get lng => real().nullable()();
  RealColumn get gpsAccuracy => real().nullable()();
  RealColumn get extentPerches => real().nullable()();
  TextColumn get extentSource => text().nullable()();
  TextColumn get ownershipType => text().nullable()();
  TextColumn get deedNo => text().nullable()();
  TextColumn get planNo => text().nullable()();
  TextColumn get lotNo => text().nullable()();
  TextColumn get schemeName => text().nullable()();
  TextColumn get boundaryNorth => text().nullable()();
  TextColumn get boundaryEast => text().nullable()();
  TextColumn get boundarySouth => text().nullable()();
  TextColumn get boundaryWest => text().nullable()();
  TextColumn get landUse => text().nullable()();
  TextColumn get subdivisionAllowed => text().nullable()();
  BoolColumn get hasDispute => boolean().withDefault(const Constant(false))();
  TextColumn get disputeNote => text().nullable()();
  TextColumn get notes => text().nullable()();

  /// Officer confirmed the land has none of these (counts as complete).
  BoolColumn get noBuildings => boolean().withDefault(const Constant(false))();
  BoolColumn get noTrees => boolean().withDefault(const Constant(false))();
  BoolColumn get noAnimals => boolean().withDefault(const Constant(false))();

  /// draft | complete | verified
  TextColumn get status => text().withDefault(const Constant('draft'))();
  TextColumn get infoSource => text().nullable()();
  DateTimeColumn get verifiedAt => dateTime().nullable()();
}

/// People linked to a land: owners (with share), occupants, heirs, ...
/// Either [personId] (someone in the register) or [outsideName] (lives
/// outside the division) is set.
@DataClassName('LandParty')
class LandParties extends Table with Record {
  TextColumn get landId => text().references(Lands, #id)();
  TextColumn get personId => text().nullable().references(Persons, #id)();
  TextColumn get outsideName => text().nullable()();
  TextColumn get role => text()();
  TextColumn get share => text().nullable()();
}

@DataClassName('Building')
class Buildings extends Table with Record {
  TextColumn get landId => text().references(Lands, #id)();
  TextColumn get type => text()();
  TextColumn get buildingNo => text().nullable()();
  IntColumn get floors => integer().nullable()();
  RealColumn get floorAreaSqft => real().nullable()();
  IntColumn get rooms => integer().nullable()();
  TextColumn get wall => text().nullable()();
  TextColumn get roof => text().nullable()();
  TextColumn get floor => text().nullable()();
  TextColumn get permanence => text().nullable()();
  TextColumn get condition => text().nullable()();
  IntColumn get yearBuilt => integer().nullable()();
  TextColumn get usage => text().nullable()();
  TextColumn get electricity => text().nullable()();
  TextColumn get waterSource => text().nullable()();
  TextColumn get toilet => text().nullable()();
  TextColumn get approval => text().nullable()();
  RealColumn get lat => real().nullable()();
  RealColumn get lng => real().nullable()();
  TextColumn get notes => text().nullable()();
}

// ---------------------------------------------------------------- people

@DataClassName('Family')
class Families extends Table with Record {
  TextColumn get buildingId => text().references(Buildings, #id)();
  TextColumn get headPersonId => text().nullable()();
  TextColumn get tenure => text().nullable()();
  TextColumn get incomeRange => text().nullable()();
  TextColumn get mainIncomeSource => text().nullable()();
  TextColumn get cookingFuel => text().nullable()();

  /// Comma separated `welfare` pick list codes.
  TextColumn get welfare => text().nullable()();
  IntColumn get sinceYear => integer().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get notes => text().nullable()();
}

@DataClassName('Person')
class Persons extends Table with Record {
  TextColumn get familyId => text().references(Families, #id)();
  TextColumn get fullName => text()();
  TextColumn get initialsName => text().nullable()();
  TextColumn get nic => text().nullable()();
  DateTimeColumn get dob => dateTime().nullable()();
  TextColumn get gender => text().nullable()();
  TextColumn get relation => text().nullable()();
  TextColumn get ethnicity => text().nullable()();
  TextColumn get religion => text().nullable()();
  TextColumn get civilStatus => text().nullable()();
  TextColumn get education => text().nullable()();
  TextColumn get schoolGrade => text().nullable()();
  TextColumn get occupation => text().nullable()();
  TextColumn get workplace => text().nullable()();
  TextColumn get disability => text().nullable()();
  TextColumn get chronicIllness => text().nullable()();
  TextColumn get isVoter => text().nullable()();

  /// resident | away | moved | dead
  TextColumn get status => text().withDefault(const Constant('resident'))();
  TextColumn get phone => text().nullable()();
  TextColumn get notes => text().nullable()();
}

@DataClassName('ResidenceEvent')
class ResidenceEvents extends Table with Record {
  TextColumn get personId => text().references(Persons, #id)();

  /// arrived | left | birth | death | away | returned
  TextColumn get type => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get note => text().nullable()();
}

// ---------------------------------------------------------------- nature

@DataClassName('TreeCount')
class TreeCounts extends Table with Record {
  TextColumn get landId => text().references(Lands, #id)();
  TextColumn get species => text()();
  IntColumn get bearing => integer().withDefault(const Constant(0))();
  IntColumn get young => integer().withDefault(const Constant(0))();
  TextColumn get note => text().nullable()();
}

@DataClassName('Tree')
class Trees extends Table with Record {
  TextColumn get landId => text().references(Lands, #id)();
  TextColumn get species => text()();
  RealColumn get girthIn => real().nullable()();
  RealColumn get heightFt => real().nullable()();
  IntColumn get ageYears => integer().nullable()();
  TextColumn get condition => text().nullable()();

  /// Could fall on a house / power line.
  BoolColumn get isHazard => boolean().withDefault(const Constant(false))();
  RealColumn get lat => real().nullable()();
  RealColumn get lng => real().nullable()();
  TextColumn get note => text().nullable()();
}

@DataClassName('Crop')
class Crops extends Table with Record {
  TextColumn get landId => text().references(Lands, #id)();
  TextColumn get crop => text()();
  RealColumn get extentValue => real().nullable()();
  TextColumn get extentUnit => text().nullable()();
  TextColumn get season => text().nullable()();
  TextColumn get cultivator => text().nullable()();
  TextColumn get irrigation => text().nullable()();
  TextColumn get note => text().nullable()();
}

@DataClassName('Animal')
class Animals extends Table with Record {
  TextColumn get landId => text().references(Lands, #id)();
  TextColumn get familyId => text().nullable()();
  TextColumn get species => text()();
  IntColumn get male => integer().withDefault(const Constant(0))();
  IntColumn get female => integer().withDefault(const Constant(0))();
  IntColumn get young => integer().withDefault(const Constant(0))();
  TextColumn get purpose => text().nullable()();
  RealColumn get dailyMilkL => real().nullable()();
  TextColumn get housing => text().nullable()();
  TextColumn get vaccinated => text().nullable()();
  DateTimeColumn get lastVaccination => dateTime().nullable()();
  TextColumn get note => text().nullable()();
}

// ---------------------------------------------------------------- misc

@DataClassName('Photo')
class Photos extends Table with Record {
  /// land | building | tree | person
  TextColumn get ownerType => text()();
  TextColumn get ownerId => text()();

  /// Land the photo belongs to (for the land's photo tab).
  TextColumn get landId => text().nullable()();

  /// File name inside the app's private photos folder.
  TextColumn get fileName => text()();
  DateTimeColumn get takenAt => dateTime()();
  RealColumn get lat => real().nullable()();
  RealColumn get lng => real().nullable()();
}

@DataClassName('PickItem')
class PickItems extends Table with Record {
  TextColumn get listName => text()();
  TextColumn get code => text()();
  TextColumn get label => text()();
  BoolColumn get active => boolean().withDefault(const Constant(true))();
}

@DataClassName('ChangeLog')
class ChangeLogs extends Table {
  IntColumn get seq => integer().autoIncrement()();
  TextColumn get entity => text()();
  TextColumn get recordId => text()();

  /// Land the change belongs to, so a land's history tab is one query.
  TextColumn get landId => text().nullable()();

  /// create | update | delete
  TextColumn get action => text()();

  /// JSON: {field: [old, new]}
  TextColumn get changes => text()();
  DateTimeColumn get at => dateTime()();
}

@DataClassName('Setting')
class Settings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}

@DriftDatabase(tables: [
  Divisions,
  Villages,
  HouseGroups,
  Lands,
  LandParties,
  Buildings,
  Families,
  Persons,
  ResidenceEvents,
  TreeCounts,
  Trees,
  Crops,
  Animals,
  Photos,
  PickItems,
  ChangeLogs,
  Settings,
])
class AppDb extends _$AppDb {
  AppDb(super.e);

  /// Opens the encrypted database file. [key] is a random hex secret kept in
  /// the platform keystore (see `KeyStore`).
  factory AppDb.open(File file, String key) {
    assert(RegExp(r'^[0-9a-f]+$').hasMatch(key));
    return AppDb(NativeDatabase.createInBackground(
      file,
      setup: (raw) {
        raw.execute("PRAGMA key = '$key';");
        raw.execute('PRAGMA foreign_keys = ON;');
      },
    ));
  }

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await customStatement(
              'CREATE INDEX idx_persons_nic ON persons (nic)');
          await customStatement(
              'CREATE INDEX idx_persons_family ON persons (family_id)');
          await customStatement(
              'CREATE INDEX idx_buildings_land ON buildings (land_id)');
          await customStatement(
              'CREATE INDEX idx_families_building ON families (building_id)');
          await customStatement(
              'CREATE INDEX idx_lands_group ON lands (house_group_id)');
          await customStatement(
              'CREATE INDEX idx_changelog_land ON change_logs (land_id)');
          await customStatement(
              'CREATE INDEX idx_photos_owner ON photos (owner_id)');
        },
      );

  // ------------------------------------------------------------ generic save

  GeneratedColumn<String> _idCol(TableInfo<Table, dynamic> t) =>
      t.columnsByName['id']! as GeneratedColumn<String>;

  Future<D?> byId<D>(TableInfo<Table, D> t, String id) =>
      (select(t)..where((_) => _idCol(t).equals(id))).getSingleOrNull();

  /// Inserts or updates a record and writes a [ChangeLogs] entry describing
  /// exactly which fields changed. Returns the record id.
  Future<String> saveRow<D extends DataClass>(
    TableInfo<Table, D> t,
    String id,
    Insertable<D> row, {
    String? landId,
  }) {
    return transaction(() async {
      final old = await byId(t, id);
      if (old == null) {
        await into(t).insert(row);
      } else {
        await (update(t)..where((_) => _idCol(t).equals(id))).write(row);
        await customUpdate(
          'UPDATE ${t.actualTableName} SET updated_at = ? WHERE id = ?',
          variables: [Variable(DateTime.now()), Variable(id)],
          updates: {t},
        );
      }
      final now = (await byId(t, id))!;
      final before = old == null ? <String, dynamic>{} : old.toJson();
      final after = now.toJson();
      final diff = <String, List<dynamic>>{};
      for (final k in after.keys) {
        if (k == 'createdAt' || k == 'updatedAt') continue;
        if (jsonEncode(before[k]) != jsonEncode(after[k])) {
          diff[k] = [before[k], after[k]];
        }
      }
      if (diff.isNotEmpty) {
        await into(changeLogs).insert(ChangeLogsCompanion.insert(
          entity: t.actualTableName,
          recordId: id,
          landId: Value(landId),
          action: old == null ? 'create' : 'update',
          changes: jsonEncode(diff),
          at: DateTime.now(),
        ));
      }
      return id;
    });
  }

  /// Marks a record deleted (it stays in the database and history).
  Future<void> softDelete(TableInfo<Table, dynamic> t, String id,
      {String? landId}) async {
    final now = DateTime.now();
    await customUpdate(
      'UPDATE ${t.actualTableName} SET deleted_at = ?, updated_at = ? '
      'WHERE id = ? AND deleted_at IS NULL',
      variables: [Variable(now), Variable(now), Variable(id)],
      updates: {t},
    );
    await into(changeLogs).insert(ChangeLogsCompanion.insert(
      entity: t.actualTableName,
      recordId: id,
      landId: Value(landId),
      action: 'delete',
      changes: '{}',
      at: now,
    ));
  }

  // ------------------------------------------------------------ settings

  Future<String?> getSetting(String key) async =>
      (await (select(settings)..where((s) => s.key.equals(key)))
              .getSingleOrNull())
          ?.value;

  Future<void> setSetting(String key, String value) => into(settings)
      .insertOnConflictUpdate(SettingsCompanion.insert(key: key, value: value));
}
