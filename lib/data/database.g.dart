// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DivisionsTable extends Divisions
    with TableInfo<$DivisionsTable, Division> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DivisionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dsDivisionMeta = const VerificationMeta(
    'dsDivision',
  );
  @override
  late final GeneratedColumn<String> dsDivision = GeneratedColumn<String>(
    'ds_division',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _districtMeta = const VerificationMeta(
    'district',
  );
  @override
  late final GeneratedColumn<String> district = GeneratedColumn<String>(
    'district',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _officerNameMeta = const VerificationMeta(
    'officerName',
  );
  @override
  late final GeneratedColumn<String> officerName = GeneratedColumn<String>(
    'officer_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    code,
    name,
    dsDivision,
    district,
    officerName,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'divisions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Division> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('ds_division')) {
      context.handle(
        _dsDivisionMeta,
        dsDivision.isAcceptableOrUnknown(data['ds_division']!, _dsDivisionMeta),
      );
    }
    if (data.containsKey('district')) {
      context.handle(
        _districtMeta,
        district.isAcceptableOrUnknown(data['district']!, _districtMeta),
      );
    }
    if (data.containsKey('officer_name')) {
      context.handle(
        _officerNameMeta,
        officerName.isAcceptableOrUnknown(
          data['officer_name']!,
          _officerNameMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Division map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Division(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      dsDivision: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ds_division'],
      )!,
      district: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}district'],
      )!,
      officerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}officer_name'],
      )!,
    );
  }

  @override
  $DivisionsTable createAlias(String alias) {
    return $DivisionsTable(attachedDatabase, alias);
  }
}

class Division extends DataClass implements Insertable<Division> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String code;
  final String name;
  final String dsDivision;
  final String district;
  final String officerName;
  const Division({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.code,
    required this.name,
    required this.dsDivision,
    required this.district,
    required this.officerName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['ds_division'] = Variable<String>(dsDivision);
    map['district'] = Variable<String>(district);
    map['officer_name'] = Variable<String>(officerName);
    return map;
  }

  DivisionsCompanion toCompanion(bool nullToAbsent) {
    return DivisionsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      code: Value(code),
      name: Value(name),
      dsDivision: Value(dsDivision),
      district: Value(district),
      officerName: Value(officerName),
    );
  }

  factory Division.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Division(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      dsDivision: serializer.fromJson<String>(json['dsDivision']),
      district: serializer.fromJson<String>(json['district']),
      officerName: serializer.fromJson<String>(json['officerName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'dsDivision': serializer.toJson<String>(dsDivision),
      'district': serializer.toJson<String>(district),
      'officerName': serializer.toJson<String>(officerName),
    };
  }

  Division copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? code,
    String? name,
    String? dsDivision,
    String? district,
    String? officerName,
  }) => Division(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    code: code ?? this.code,
    name: name ?? this.name,
    dsDivision: dsDivision ?? this.dsDivision,
    district: district ?? this.district,
    officerName: officerName ?? this.officerName,
  );
  Division copyWithCompanion(DivisionsCompanion data) {
    return Division(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      dsDivision: data.dsDivision.present
          ? data.dsDivision.value
          : this.dsDivision,
      district: data.district.present ? data.district.value : this.district,
      officerName: data.officerName.present
          ? data.officerName.value
          : this.officerName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Division(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('dsDivision: $dsDivision, ')
          ..write('district: $district, ')
          ..write('officerName: $officerName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    code,
    name,
    dsDivision,
    district,
    officerName,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Division &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.code == this.code &&
          other.name == this.name &&
          other.dsDivision == this.dsDivision &&
          other.district == this.district &&
          other.officerName == this.officerName);
}

class DivisionsCompanion extends UpdateCompanion<Division> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> code;
  final Value<String> name;
  final Value<String> dsDivision;
  final Value<String> district;
  final Value<String> officerName;
  final Value<int> rowid;
  const DivisionsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.dsDivision = const Value.absent(),
    this.district = const Value.absent(),
    this.officerName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DivisionsCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String code,
    required String name,
    this.dsDivision = const Value.absent(),
    this.district = const Value.absent(),
    this.officerName = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       code = Value(code),
       name = Value(name);
  static Insertable<Division> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? dsDivision,
    Expression<String>? district,
    Expression<String>? officerName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (dsDivision != null) 'ds_division': dsDivision,
      if (district != null) 'district': district,
      if (officerName != null) 'officer_name': officerName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DivisionsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? code,
    Value<String>? name,
    Value<String>? dsDivision,
    Value<String>? district,
    Value<String>? officerName,
    Value<int>? rowid,
  }) {
    return DivisionsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      code: code ?? this.code,
      name: name ?? this.name,
      dsDivision: dsDivision ?? this.dsDivision,
      district: district ?? this.district,
      officerName: officerName ?? this.officerName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dsDivision.present) {
      map['ds_division'] = Variable<String>(dsDivision.value);
    }
    if (district.present) {
      map['district'] = Variable<String>(district.value);
    }
    if (officerName.present) {
      map['officer_name'] = Variable<String>(officerName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DivisionsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('dsDivision: $dsDivision, ')
          ..write('district: $district, ')
          ..write('officerName: $officerName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VillagesTable extends Villages with TableInfo<$VillagesTable, Village> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VillagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _supervisingOfficerMeta =
      const VerificationMeta('supervisingOfficer');
  @override
  late final GeneratedColumn<String> supervisingOfficer =
      GeneratedColumn<String>(
        'supervising_officer',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    name,
    supervisingOfficer,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'villages';
  @override
  VerificationContext validateIntegrity(
    Insertable<Village> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('supervising_officer')) {
      context.handle(
        _supervisingOfficerMeta,
        supervisingOfficer.isAcceptableOrUnknown(
          data['supervising_officer']!,
          _supervisingOfficerMeta,
        ),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Village map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Village(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      supervisingOfficer: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}supervising_officer'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $VillagesTable createAlias(String alias) {
    return $VillagesTable(attachedDatabase, alias);
  }
}

class Village extends DataClass implements Insertable<Village> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String name;
  final String? supervisingOfficer;
  final int sortOrder;
  const Village({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.name,
    this.supervisingOfficer,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || supervisingOfficer != null) {
      map['supervising_officer'] = Variable<String>(supervisingOfficer);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  VillagesCompanion toCompanion(bool nullToAbsent) {
    return VillagesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      name: Value(name),
      supervisingOfficer: supervisingOfficer == null && nullToAbsent
          ? const Value.absent()
          : Value(supervisingOfficer),
      sortOrder: Value(sortOrder),
    );
  }

  factory Village.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Village(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      name: serializer.fromJson<String>(json['name']),
      supervisingOfficer: serializer.fromJson<String?>(
        json['supervisingOfficer'],
      ),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'name': serializer.toJson<String>(name),
      'supervisingOfficer': serializer.toJson<String?>(supervisingOfficer),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  Village copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? name,
    Value<String?> supervisingOfficer = const Value.absent(),
    int? sortOrder,
  }) => Village(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    name: name ?? this.name,
    supervisingOfficer: supervisingOfficer.present
        ? supervisingOfficer.value
        : this.supervisingOfficer,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  Village copyWithCompanion(VillagesCompanion data) {
    return Village(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      name: data.name.present ? data.name.value : this.name,
      supervisingOfficer: data.supervisingOfficer.present
          ? data.supervisingOfficer.value
          : this.supervisingOfficer,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Village(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('name: $name, ')
          ..write('supervisingOfficer: $supervisingOfficer, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    name,
    supervisingOfficer,
    sortOrder,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Village &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.name == this.name &&
          other.supervisingOfficer == this.supervisingOfficer &&
          other.sortOrder == this.sortOrder);
}

class VillagesCompanion extends UpdateCompanion<Village> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> name;
  final Value<String?> supervisingOfficer;
  final Value<int> sortOrder;
  final Value<int> rowid;
  const VillagesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.supervisingOfficer = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VillagesCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String name,
    this.supervisingOfficer = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<Village> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? name,
    Expression<String>? supervisingOfficer,
    Expression<int>? sortOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (name != null) 'name': name,
      if (supervisingOfficer != null) 'supervising_officer': supervisingOfficer,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VillagesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? name,
    Value<String?>? supervisingOfficer,
    Value<int>? sortOrder,
    Value<int>? rowid,
  }) {
    return VillagesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      name: name ?? this.name,
      supervisingOfficer: supervisingOfficer ?? this.supervisingOfficer,
      sortOrder: sortOrder ?? this.sortOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (supervisingOfficer.present) {
      map['supervising_officer'] = Variable<String>(supervisingOfficer.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VillagesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('name: $name, ')
          ..write('supervisingOfficer: $supervisingOfficer, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HouseGroupsTable extends HouseGroups
    with TableInfo<$HouseGroupsTable, HouseGroup> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HouseGroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _villageIdMeta = const VerificationMeta(
    'villageId',
  );
  @override
  late final GeneratedColumn<String> villageId = GeneratedColumn<String>(
    'village_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES villages (id)',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _leaderNameMeta = const VerificationMeta(
    'leaderName',
  );
  @override
  late final GeneratedColumn<String> leaderName = GeneratedColumn<String>(
    'leader_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _leaderPhoneMeta = const VerificationMeta(
    'leaderPhone',
  );
  @override
  late final GeneratedColumn<String> leaderPhone = GeneratedColumn<String>(
    'leader_phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _expectedLandsMeta = const VerificationMeta(
    'expectedLands',
  );
  @override
  late final GeneratedColumn<int> expectedLands = GeneratedColumn<int>(
    'expected_lands',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    villageId,
    code,
    leaderName,
    leaderPhone,
    expectedLands,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'house_groups';
  @override
  VerificationContext validateIntegrity(
    Insertable<HouseGroup> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('village_id')) {
      context.handle(
        _villageIdMeta,
        villageId.isAcceptableOrUnknown(data['village_id']!, _villageIdMeta),
      );
    } else if (isInserting) {
      context.missing(_villageIdMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('leader_name')) {
      context.handle(
        _leaderNameMeta,
        leaderName.isAcceptableOrUnknown(data['leader_name']!, _leaderNameMeta),
      );
    }
    if (data.containsKey('leader_phone')) {
      context.handle(
        _leaderPhoneMeta,
        leaderPhone.isAcceptableOrUnknown(
          data['leader_phone']!,
          _leaderPhoneMeta,
        ),
      );
    }
    if (data.containsKey('expected_lands')) {
      context.handle(
        _expectedLandsMeta,
        expectedLands.isAcceptableOrUnknown(
          data['expected_lands']!,
          _expectedLandsMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HouseGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HouseGroup(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      villageId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}village_id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      leaderName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}leader_name'],
      ),
      leaderPhone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}leader_phone'],
      ),
      expectedLands: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}expected_lands'],
      ),
    );
  }

  @override
  $HouseGroupsTable createAlias(String alias) {
    return $HouseGroupsTable(attachedDatabase, alias);
  }
}

class HouseGroup extends DataClass implements Insertable<HouseGroup> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String villageId;
  final String code;
  final String? leaderName;
  final String? leaderPhone;

  /// Approximate number of lands/houses expected — drives survey progress.
  final int? expectedLands;
  const HouseGroup({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.villageId,
    required this.code,
    this.leaderName,
    this.leaderPhone,
    this.expectedLands,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['village_id'] = Variable<String>(villageId);
    map['code'] = Variable<String>(code);
    if (!nullToAbsent || leaderName != null) {
      map['leader_name'] = Variable<String>(leaderName);
    }
    if (!nullToAbsent || leaderPhone != null) {
      map['leader_phone'] = Variable<String>(leaderPhone);
    }
    if (!nullToAbsent || expectedLands != null) {
      map['expected_lands'] = Variable<int>(expectedLands);
    }
    return map;
  }

  HouseGroupsCompanion toCompanion(bool nullToAbsent) {
    return HouseGroupsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      villageId: Value(villageId),
      code: Value(code),
      leaderName: leaderName == null && nullToAbsent
          ? const Value.absent()
          : Value(leaderName),
      leaderPhone: leaderPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(leaderPhone),
      expectedLands: expectedLands == null && nullToAbsent
          ? const Value.absent()
          : Value(expectedLands),
    );
  }

  factory HouseGroup.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HouseGroup(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      villageId: serializer.fromJson<String>(json['villageId']),
      code: serializer.fromJson<String>(json['code']),
      leaderName: serializer.fromJson<String?>(json['leaderName']),
      leaderPhone: serializer.fromJson<String?>(json['leaderPhone']),
      expectedLands: serializer.fromJson<int?>(json['expectedLands']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'villageId': serializer.toJson<String>(villageId),
      'code': serializer.toJson<String>(code),
      'leaderName': serializer.toJson<String?>(leaderName),
      'leaderPhone': serializer.toJson<String?>(leaderPhone),
      'expectedLands': serializer.toJson<int?>(expectedLands),
    };
  }

  HouseGroup copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? villageId,
    String? code,
    Value<String?> leaderName = const Value.absent(),
    Value<String?> leaderPhone = const Value.absent(),
    Value<int?> expectedLands = const Value.absent(),
  }) => HouseGroup(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    villageId: villageId ?? this.villageId,
    code: code ?? this.code,
    leaderName: leaderName.present ? leaderName.value : this.leaderName,
    leaderPhone: leaderPhone.present ? leaderPhone.value : this.leaderPhone,
    expectedLands: expectedLands.present
        ? expectedLands.value
        : this.expectedLands,
  );
  HouseGroup copyWithCompanion(HouseGroupsCompanion data) {
    return HouseGroup(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      villageId: data.villageId.present ? data.villageId.value : this.villageId,
      code: data.code.present ? data.code.value : this.code,
      leaderName: data.leaderName.present
          ? data.leaderName.value
          : this.leaderName,
      leaderPhone: data.leaderPhone.present
          ? data.leaderPhone.value
          : this.leaderPhone,
      expectedLands: data.expectedLands.present
          ? data.expectedLands.value
          : this.expectedLands,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HouseGroup(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('villageId: $villageId, ')
          ..write('code: $code, ')
          ..write('leaderName: $leaderName, ')
          ..write('leaderPhone: $leaderPhone, ')
          ..write('expectedLands: $expectedLands')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    villageId,
    code,
    leaderName,
    leaderPhone,
    expectedLands,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HouseGroup &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.villageId == this.villageId &&
          other.code == this.code &&
          other.leaderName == this.leaderName &&
          other.leaderPhone == this.leaderPhone &&
          other.expectedLands == this.expectedLands);
}

class HouseGroupsCompanion extends UpdateCompanion<HouseGroup> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> villageId;
  final Value<String> code;
  final Value<String?> leaderName;
  final Value<String?> leaderPhone;
  final Value<int?> expectedLands;
  final Value<int> rowid;
  const HouseGroupsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.villageId = const Value.absent(),
    this.code = const Value.absent(),
    this.leaderName = const Value.absent(),
    this.leaderPhone = const Value.absent(),
    this.expectedLands = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HouseGroupsCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String villageId,
    required String code,
    this.leaderName = const Value.absent(),
    this.leaderPhone = const Value.absent(),
    this.expectedLands = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       villageId = Value(villageId),
       code = Value(code);
  static Insertable<HouseGroup> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? villageId,
    Expression<String>? code,
    Expression<String>? leaderName,
    Expression<String>? leaderPhone,
    Expression<int>? expectedLands,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (villageId != null) 'village_id': villageId,
      if (code != null) 'code': code,
      if (leaderName != null) 'leader_name': leaderName,
      if (leaderPhone != null) 'leader_phone': leaderPhone,
      if (expectedLands != null) 'expected_lands': expectedLands,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HouseGroupsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? villageId,
    Value<String>? code,
    Value<String?>? leaderName,
    Value<String?>? leaderPhone,
    Value<int?>? expectedLands,
    Value<int>? rowid,
  }) {
    return HouseGroupsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      villageId: villageId ?? this.villageId,
      code: code ?? this.code,
      leaderName: leaderName ?? this.leaderName,
      leaderPhone: leaderPhone ?? this.leaderPhone,
      expectedLands: expectedLands ?? this.expectedLands,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (villageId.present) {
      map['village_id'] = Variable<String>(villageId.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (leaderName.present) {
      map['leader_name'] = Variable<String>(leaderName.value);
    }
    if (leaderPhone.present) {
      map['leader_phone'] = Variable<String>(leaderPhone.value);
    }
    if (expectedLands.present) {
      map['expected_lands'] = Variable<int>(expectedLands.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HouseGroupsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('villageId: $villageId, ')
          ..write('code: $code, ')
          ..write('leaderName: $leaderName, ')
          ..write('leaderPhone: $leaderPhone, ')
          ..write('expectedLands: $expectedLands, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LandsTable extends Lands with TableInfo<$LandsTable, Land> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LandsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _houseGroupIdMeta = const VerificationMeta(
    'houseGroupId',
  );
  @override
  late final GeneratedColumn<String> houseGroupId = GeneratedColumn<String>(
    'house_group_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES house_groups (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressTextMeta = const VerificationMeta(
    'addressText',
  );
  @override
  late final GeneratedColumn<String> addressText = GeneratedColumn<String>(
    'address_text',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<double> lng = GeneratedColumn<double>(
    'lng',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gpsAccuracyMeta = const VerificationMeta(
    'gpsAccuracy',
  );
  @override
  late final GeneratedColumn<double> gpsAccuracy = GeneratedColumn<double>(
    'gps_accuracy',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _extentPerchesMeta = const VerificationMeta(
    'extentPerches',
  );
  @override
  late final GeneratedColumn<double> extentPerches = GeneratedColumn<double>(
    'extent_perches',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _extentSourceMeta = const VerificationMeta(
    'extentSource',
  );
  @override
  late final GeneratedColumn<String> extentSource = GeneratedColumn<String>(
    'extent_source',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownershipTypeMeta = const VerificationMeta(
    'ownershipType',
  );
  @override
  late final GeneratedColumn<String> ownershipType = GeneratedColumn<String>(
    'ownership_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deedNoMeta = const VerificationMeta('deedNo');
  @override
  late final GeneratedColumn<String> deedNo = GeneratedColumn<String>(
    'deed_no',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _planNoMeta = const VerificationMeta('planNo');
  @override
  late final GeneratedColumn<String> planNo = GeneratedColumn<String>(
    'plan_no',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lotNoMeta = const VerificationMeta('lotNo');
  @override
  late final GeneratedColumn<String> lotNo = GeneratedColumn<String>(
    'lot_no',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _schemeNameMeta = const VerificationMeta(
    'schemeName',
  );
  @override
  late final GeneratedColumn<String> schemeName = GeneratedColumn<String>(
    'scheme_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _boundaryNorthMeta = const VerificationMeta(
    'boundaryNorth',
  );
  @override
  late final GeneratedColumn<String> boundaryNorth = GeneratedColumn<String>(
    'boundary_north',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _boundaryEastMeta = const VerificationMeta(
    'boundaryEast',
  );
  @override
  late final GeneratedColumn<String> boundaryEast = GeneratedColumn<String>(
    'boundary_east',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _boundarySouthMeta = const VerificationMeta(
    'boundarySouth',
  );
  @override
  late final GeneratedColumn<String> boundarySouth = GeneratedColumn<String>(
    'boundary_south',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _boundaryWestMeta = const VerificationMeta(
    'boundaryWest',
  );
  @override
  late final GeneratedColumn<String> boundaryWest = GeneratedColumn<String>(
    'boundary_west',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _landUseMeta = const VerificationMeta(
    'landUse',
  );
  @override
  late final GeneratedColumn<String> landUse = GeneratedColumn<String>(
    'land_use',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _subdivisionAllowedMeta =
      const VerificationMeta('subdivisionAllowed');
  @override
  late final GeneratedColumn<String> subdivisionAllowed =
      GeneratedColumn<String>(
        'subdivision_allowed',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _hasDisputeMeta = const VerificationMeta(
    'hasDispute',
  );
  @override
  late final GeneratedColumn<bool> hasDispute = GeneratedColumn<bool>(
    'has_dispute',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_dispute" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _disputeNoteMeta = const VerificationMeta(
    'disputeNote',
  );
  @override
  late final GeneratedColumn<String> disputeNote = GeneratedColumn<String>(
    'dispute_note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noBuildingsMeta = const VerificationMeta(
    'noBuildings',
  );
  @override
  late final GeneratedColumn<bool> noBuildings = GeneratedColumn<bool>(
    'no_buildings',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("no_buildings" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _noTreesMeta = const VerificationMeta(
    'noTrees',
  );
  @override
  late final GeneratedColumn<bool> noTrees = GeneratedColumn<bool>(
    'no_trees',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("no_trees" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _noAnimalsMeta = const VerificationMeta(
    'noAnimals',
  );
  @override
  late final GeneratedColumn<bool> noAnimals = GeneratedColumn<bool>(
    'no_animals',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("no_animals" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('draft'),
  );
  static const VerificationMeta _infoSourceMeta = const VerificationMeta(
    'infoSource',
  );
  @override
  late final GeneratedColumn<String> infoSource = GeneratedColumn<String>(
    'info_source',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _verifiedAtMeta = const VerificationMeta(
    'verifiedAt',
  );
  @override
  late final GeneratedColumn<DateTime> verifiedAt = GeneratedColumn<DateTime>(
    'verified_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    houseGroupId,
    name,
    addressText,
    lat,
    lng,
    gpsAccuracy,
    extentPerches,
    extentSource,
    ownershipType,
    deedNo,
    planNo,
    lotNo,
    schemeName,
    boundaryNorth,
    boundaryEast,
    boundarySouth,
    boundaryWest,
    landUse,
    subdivisionAllowed,
    hasDispute,
    disputeNote,
    notes,
    noBuildings,
    noTrees,
    noAnimals,
    status,
    infoSource,
    verifiedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lands';
  @override
  VerificationContext validateIntegrity(
    Insertable<Land> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('house_group_id')) {
      context.handle(
        _houseGroupIdMeta,
        houseGroupId.isAcceptableOrUnknown(
          data['house_group_id']!,
          _houseGroupIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_houseGroupIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('address_text')) {
      context.handle(
        _addressTextMeta,
        addressText.isAcceptableOrUnknown(
          data['address_text']!,
          _addressTextMeta,
        ),
      );
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    }
    if (data.containsKey('lng')) {
      context.handle(
        _lngMeta,
        lng.isAcceptableOrUnknown(data['lng']!, _lngMeta),
      );
    }
    if (data.containsKey('gps_accuracy')) {
      context.handle(
        _gpsAccuracyMeta,
        gpsAccuracy.isAcceptableOrUnknown(
          data['gps_accuracy']!,
          _gpsAccuracyMeta,
        ),
      );
    }
    if (data.containsKey('extent_perches')) {
      context.handle(
        _extentPerchesMeta,
        extentPerches.isAcceptableOrUnknown(
          data['extent_perches']!,
          _extentPerchesMeta,
        ),
      );
    }
    if (data.containsKey('extent_source')) {
      context.handle(
        _extentSourceMeta,
        extentSource.isAcceptableOrUnknown(
          data['extent_source']!,
          _extentSourceMeta,
        ),
      );
    }
    if (data.containsKey('ownership_type')) {
      context.handle(
        _ownershipTypeMeta,
        ownershipType.isAcceptableOrUnknown(
          data['ownership_type']!,
          _ownershipTypeMeta,
        ),
      );
    }
    if (data.containsKey('deed_no')) {
      context.handle(
        _deedNoMeta,
        deedNo.isAcceptableOrUnknown(data['deed_no']!, _deedNoMeta),
      );
    }
    if (data.containsKey('plan_no')) {
      context.handle(
        _planNoMeta,
        planNo.isAcceptableOrUnknown(data['plan_no']!, _planNoMeta),
      );
    }
    if (data.containsKey('lot_no')) {
      context.handle(
        _lotNoMeta,
        lotNo.isAcceptableOrUnknown(data['lot_no']!, _lotNoMeta),
      );
    }
    if (data.containsKey('scheme_name')) {
      context.handle(
        _schemeNameMeta,
        schemeName.isAcceptableOrUnknown(data['scheme_name']!, _schemeNameMeta),
      );
    }
    if (data.containsKey('boundary_north')) {
      context.handle(
        _boundaryNorthMeta,
        boundaryNorth.isAcceptableOrUnknown(
          data['boundary_north']!,
          _boundaryNorthMeta,
        ),
      );
    }
    if (data.containsKey('boundary_east')) {
      context.handle(
        _boundaryEastMeta,
        boundaryEast.isAcceptableOrUnknown(
          data['boundary_east']!,
          _boundaryEastMeta,
        ),
      );
    }
    if (data.containsKey('boundary_south')) {
      context.handle(
        _boundarySouthMeta,
        boundarySouth.isAcceptableOrUnknown(
          data['boundary_south']!,
          _boundarySouthMeta,
        ),
      );
    }
    if (data.containsKey('boundary_west')) {
      context.handle(
        _boundaryWestMeta,
        boundaryWest.isAcceptableOrUnknown(
          data['boundary_west']!,
          _boundaryWestMeta,
        ),
      );
    }
    if (data.containsKey('land_use')) {
      context.handle(
        _landUseMeta,
        landUse.isAcceptableOrUnknown(data['land_use']!, _landUseMeta),
      );
    }
    if (data.containsKey('subdivision_allowed')) {
      context.handle(
        _subdivisionAllowedMeta,
        subdivisionAllowed.isAcceptableOrUnknown(
          data['subdivision_allowed']!,
          _subdivisionAllowedMeta,
        ),
      );
    }
    if (data.containsKey('has_dispute')) {
      context.handle(
        _hasDisputeMeta,
        hasDispute.isAcceptableOrUnknown(data['has_dispute']!, _hasDisputeMeta),
      );
    }
    if (data.containsKey('dispute_note')) {
      context.handle(
        _disputeNoteMeta,
        disputeNote.isAcceptableOrUnknown(
          data['dispute_note']!,
          _disputeNoteMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('no_buildings')) {
      context.handle(
        _noBuildingsMeta,
        noBuildings.isAcceptableOrUnknown(
          data['no_buildings']!,
          _noBuildingsMeta,
        ),
      );
    }
    if (data.containsKey('no_trees')) {
      context.handle(
        _noTreesMeta,
        noTrees.isAcceptableOrUnknown(data['no_trees']!, _noTreesMeta),
      );
    }
    if (data.containsKey('no_animals')) {
      context.handle(
        _noAnimalsMeta,
        noAnimals.isAcceptableOrUnknown(data['no_animals']!, _noAnimalsMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('info_source')) {
      context.handle(
        _infoSourceMeta,
        infoSource.isAcceptableOrUnknown(data['info_source']!, _infoSourceMeta),
      );
    }
    if (data.containsKey('verified_at')) {
      context.handle(
        _verifiedAtMeta,
        verifiedAt.isAcceptableOrUnknown(data['verified_at']!, _verifiedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Land map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Land(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      houseGroupId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}house_group_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      addressText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address_text'],
      ),
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      ),
      lng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lng'],
      ),
      gpsAccuracy: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}gps_accuracy'],
      ),
      extentPerches: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}extent_perches'],
      ),
      extentSource: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}extent_source'],
      ),
      ownershipType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ownership_type'],
      ),
      deedNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}deed_no'],
      ),
      planNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}plan_no'],
      ),
      lotNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lot_no'],
      ),
      schemeName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}scheme_name'],
      ),
      boundaryNorth: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}boundary_north'],
      ),
      boundaryEast: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}boundary_east'],
      ),
      boundarySouth: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}boundary_south'],
      ),
      boundaryWest: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}boundary_west'],
      ),
      landUse: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}land_use'],
      ),
      subdivisionAllowed: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subdivision_allowed'],
      ),
      hasDispute: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_dispute'],
      )!,
      disputeNote: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dispute_note'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      noBuildings: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}no_buildings'],
      )!,
      noTrees: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}no_trees'],
      )!,
      noAnimals: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}no_animals'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      infoSource: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}info_source'],
      ),
      verifiedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}verified_at'],
      ),
    );
  }

  @override
  $LandsTable createAlias(String alias) {
    return $LandsTable(attachedDatabase, alias);
  }
}

class Land extends DataClass implements Insertable<Land> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String houseGroupId;
  final String name;
  final String? addressText;
  final double? lat;
  final double? lng;
  final double? gpsAccuracy;
  final double? extentPerches;
  final String? extentSource;
  final String? ownershipType;
  final String? deedNo;
  final String? planNo;
  final String? lotNo;
  final String? schemeName;
  final String? boundaryNorth;
  final String? boundaryEast;
  final String? boundarySouth;
  final String? boundaryWest;
  final String? landUse;
  final String? subdivisionAllowed;
  final bool hasDispute;
  final String? disputeNote;
  final String? notes;

  /// Officer confirmed the land has none of these (counts as complete).
  final bool noBuildings;
  final bool noTrees;
  final bool noAnimals;

  /// draft | complete | verified
  final String status;
  final String? infoSource;
  final DateTime? verifiedAt;
  const Land({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.houseGroupId,
    required this.name,
    this.addressText,
    this.lat,
    this.lng,
    this.gpsAccuracy,
    this.extentPerches,
    this.extentSource,
    this.ownershipType,
    this.deedNo,
    this.planNo,
    this.lotNo,
    this.schemeName,
    this.boundaryNorth,
    this.boundaryEast,
    this.boundarySouth,
    this.boundaryWest,
    this.landUse,
    this.subdivisionAllowed,
    required this.hasDispute,
    this.disputeNote,
    this.notes,
    required this.noBuildings,
    required this.noTrees,
    required this.noAnimals,
    required this.status,
    this.infoSource,
    this.verifiedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['house_group_id'] = Variable<String>(houseGroupId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || addressText != null) {
      map['address_text'] = Variable<String>(addressText);
    }
    if (!nullToAbsent || lat != null) {
      map['lat'] = Variable<double>(lat);
    }
    if (!nullToAbsent || lng != null) {
      map['lng'] = Variable<double>(lng);
    }
    if (!nullToAbsent || gpsAccuracy != null) {
      map['gps_accuracy'] = Variable<double>(gpsAccuracy);
    }
    if (!nullToAbsent || extentPerches != null) {
      map['extent_perches'] = Variable<double>(extentPerches);
    }
    if (!nullToAbsent || extentSource != null) {
      map['extent_source'] = Variable<String>(extentSource);
    }
    if (!nullToAbsent || ownershipType != null) {
      map['ownership_type'] = Variable<String>(ownershipType);
    }
    if (!nullToAbsent || deedNo != null) {
      map['deed_no'] = Variable<String>(deedNo);
    }
    if (!nullToAbsent || planNo != null) {
      map['plan_no'] = Variable<String>(planNo);
    }
    if (!nullToAbsent || lotNo != null) {
      map['lot_no'] = Variable<String>(lotNo);
    }
    if (!nullToAbsent || schemeName != null) {
      map['scheme_name'] = Variable<String>(schemeName);
    }
    if (!nullToAbsent || boundaryNorth != null) {
      map['boundary_north'] = Variable<String>(boundaryNorth);
    }
    if (!nullToAbsent || boundaryEast != null) {
      map['boundary_east'] = Variable<String>(boundaryEast);
    }
    if (!nullToAbsent || boundarySouth != null) {
      map['boundary_south'] = Variable<String>(boundarySouth);
    }
    if (!nullToAbsent || boundaryWest != null) {
      map['boundary_west'] = Variable<String>(boundaryWest);
    }
    if (!nullToAbsent || landUse != null) {
      map['land_use'] = Variable<String>(landUse);
    }
    if (!nullToAbsent || subdivisionAllowed != null) {
      map['subdivision_allowed'] = Variable<String>(subdivisionAllowed);
    }
    map['has_dispute'] = Variable<bool>(hasDispute);
    if (!nullToAbsent || disputeNote != null) {
      map['dispute_note'] = Variable<String>(disputeNote);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['no_buildings'] = Variable<bool>(noBuildings);
    map['no_trees'] = Variable<bool>(noTrees);
    map['no_animals'] = Variable<bool>(noAnimals);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || infoSource != null) {
      map['info_source'] = Variable<String>(infoSource);
    }
    if (!nullToAbsent || verifiedAt != null) {
      map['verified_at'] = Variable<DateTime>(verifiedAt);
    }
    return map;
  }

  LandsCompanion toCompanion(bool nullToAbsent) {
    return LandsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      houseGroupId: Value(houseGroupId),
      name: Value(name),
      addressText: addressText == null && nullToAbsent
          ? const Value.absent()
          : Value(addressText),
      lat: lat == null && nullToAbsent ? const Value.absent() : Value(lat),
      lng: lng == null && nullToAbsent ? const Value.absent() : Value(lng),
      gpsAccuracy: gpsAccuracy == null && nullToAbsent
          ? const Value.absent()
          : Value(gpsAccuracy),
      extentPerches: extentPerches == null && nullToAbsent
          ? const Value.absent()
          : Value(extentPerches),
      extentSource: extentSource == null && nullToAbsent
          ? const Value.absent()
          : Value(extentSource),
      ownershipType: ownershipType == null && nullToAbsent
          ? const Value.absent()
          : Value(ownershipType),
      deedNo: deedNo == null && nullToAbsent
          ? const Value.absent()
          : Value(deedNo),
      planNo: planNo == null && nullToAbsent
          ? const Value.absent()
          : Value(planNo),
      lotNo: lotNo == null && nullToAbsent
          ? const Value.absent()
          : Value(lotNo),
      schemeName: schemeName == null && nullToAbsent
          ? const Value.absent()
          : Value(schemeName),
      boundaryNorth: boundaryNorth == null && nullToAbsent
          ? const Value.absent()
          : Value(boundaryNorth),
      boundaryEast: boundaryEast == null && nullToAbsent
          ? const Value.absent()
          : Value(boundaryEast),
      boundarySouth: boundarySouth == null && nullToAbsent
          ? const Value.absent()
          : Value(boundarySouth),
      boundaryWest: boundaryWest == null && nullToAbsent
          ? const Value.absent()
          : Value(boundaryWest),
      landUse: landUse == null && nullToAbsent
          ? const Value.absent()
          : Value(landUse),
      subdivisionAllowed: subdivisionAllowed == null && nullToAbsent
          ? const Value.absent()
          : Value(subdivisionAllowed),
      hasDispute: Value(hasDispute),
      disputeNote: disputeNote == null && nullToAbsent
          ? const Value.absent()
          : Value(disputeNote),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      noBuildings: Value(noBuildings),
      noTrees: Value(noTrees),
      noAnimals: Value(noAnimals),
      status: Value(status),
      infoSource: infoSource == null && nullToAbsent
          ? const Value.absent()
          : Value(infoSource),
      verifiedAt: verifiedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(verifiedAt),
    );
  }

  factory Land.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Land(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      houseGroupId: serializer.fromJson<String>(json['houseGroupId']),
      name: serializer.fromJson<String>(json['name']),
      addressText: serializer.fromJson<String?>(json['addressText']),
      lat: serializer.fromJson<double?>(json['lat']),
      lng: serializer.fromJson<double?>(json['lng']),
      gpsAccuracy: serializer.fromJson<double?>(json['gpsAccuracy']),
      extentPerches: serializer.fromJson<double?>(json['extentPerches']),
      extentSource: serializer.fromJson<String?>(json['extentSource']),
      ownershipType: serializer.fromJson<String?>(json['ownershipType']),
      deedNo: serializer.fromJson<String?>(json['deedNo']),
      planNo: serializer.fromJson<String?>(json['planNo']),
      lotNo: serializer.fromJson<String?>(json['lotNo']),
      schemeName: serializer.fromJson<String?>(json['schemeName']),
      boundaryNorth: serializer.fromJson<String?>(json['boundaryNorth']),
      boundaryEast: serializer.fromJson<String?>(json['boundaryEast']),
      boundarySouth: serializer.fromJson<String?>(json['boundarySouth']),
      boundaryWest: serializer.fromJson<String?>(json['boundaryWest']),
      landUse: serializer.fromJson<String?>(json['landUse']),
      subdivisionAllowed: serializer.fromJson<String?>(
        json['subdivisionAllowed'],
      ),
      hasDispute: serializer.fromJson<bool>(json['hasDispute']),
      disputeNote: serializer.fromJson<String?>(json['disputeNote']),
      notes: serializer.fromJson<String?>(json['notes']),
      noBuildings: serializer.fromJson<bool>(json['noBuildings']),
      noTrees: serializer.fromJson<bool>(json['noTrees']),
      noAnimals: serializer.fromJson<bool>(json['noAnimals']),
      status: serializer.fromJson<String>(json['status']),
      infoSource: serializer.fromJson<String?>(json['infoSource']),
      verifiedAt: serializer.fromJson<DateTime?>(json['verifiedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'houseGroupId': serializer.toJson<String>(houseGroupId),
      'name': serializer.toJson<String>(name),
      'addressText': serializer.toJson<String?>(addressText),
      'lat': serializer.toJson<double?>(lat),
      'lng': serializer.toJson<double?>(lng),
      'gpsAccuracy': serializer.toJson<double?>(gpsAccuracy),
      'extentPerches': serializer.toJson<double?>(extentPerches),
      'extentSource': serializer.toJson<String?>(extentSource),
      'ownershipType': serializer.toJson<String?>(ownershipType),
      'deedNo': serializer.toJson<String?>(deedNo),
      'planNo': serializer.toJson<String?>(planNo),
      'lotNo': serializer.toJson<String?>(lotNo),
      'schemeName': serializer.toJson<String?>(schemeName),
      'boundaryNorth': serializer.toJson<String?>(boundaryNorth),
      'boundaryEast': serializer.toJson<String?>(boundaryEast),
      'boundarySouth': serializer.toJson<String?>(boundarySouth),
      'boundaryWest': serializer.toJson<String?>(boundaryWest),
      'landUse': serializer.toJson<String?>(landUse),
      'subdivisionAllowed': serializer.toJson<String?>(subdivisionAllowed),
      'hasDispute': serializer.toJson<bool>(hasDispute),
      'disputeNote': serializer.toJson<String?>(disputeNote),
      'notes': serializer.toJson<String?>(notes),
      'noBuildings': serializer.toJson<bool>(noBuildings),
      'noTrees': serializer.toJson<bool>(noTrees),
      'noAnimals': serializer.toJson<bool>(noAnimals),
      'status': serializer.toJson<String>(status),
      'infoSource': serializer.toJson<String?>(infoSource),
      'verifiedAt': serializer.toJson<DateTime?>(verifiedAt),
    };
  }

  Land copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? houseGroupId,
    String? name,
    Value<String?> addressText = const Value.absent(),
    Value<double?> lat = const Value.absent(),
    Value<double?> lng = const Value.absent(),
    Value<double?> gpsAccuracy = const Value.absent(),
    Value<double?> extentPerches = const Value.absent(),
    Value<String?> extentSource = const Value.absent(),
    Value<String?> ownershipType = const Value.absent(),
    Value<String?> deedNo = const Value.absent(),
    Value<String?> planNo = const Value.absent(),
    Value<String?> lotNo = const Value.absent(),
    Value<String?> schemeName = const Value.absent(),
    Value<String?> boundaryNorth = const Value.absent(),
    Value<String?> boundaryEast = const Value.absent(),
    Value<String?> boundarySouth = const Value.absent(),
    Value<String?> boundaryWest = const Value.absent(),
    Value<String?> landUse = const Value.absent(),
    Value<String?> subdivisionAllowed = const Value.absent(),
    bool? hasDispute,
    Value<String?> disputeNote = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    bool? noBuildings,
    bool? noTrees,
    bool? noAnimals,
    String? status,
    Value<String?> infoSource = const Value.absent(),
    Value<DateTime?> verifiedAt = const Value.absent(),
  }) => Land(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    houseGroupId: houseGroupId ?? this.houseGroupId,
    name: name ?? this.name,
    addressText: addressText.present ? addressText.value : this.addressText,
    lat: lat.present ? lat.value : this.lat,
    lng: lng.present ? lng.value : this.lng,
    gpsAccuracy: gpsAccuracy.present ? gpsAccuracy.value : this.gpsAccuracy,
    extentPerches: extentPerches.present
        ? extentPerches.value
        : this.extentPerches,
    extentSource: extentSource.present ? extentSource.value : this.extentSource,
    ownershipType: ownershipType.present
        ? ownershipType.value
        : this.ownershipType,
    deedNo: deedNo.present ? deedNo.value : this.deedNo,
    planNo: planNo.present ? planNo.value : this.planNo,
    lotNo: lotNo.present ? lotNo.value : this.lotNo,
    schemeName: schemeName.present ? schemeName.value : this.schemeName,
    boundaryNorth: boundaryNorth.present
        ? boundaryNorth.value
        : this.boundaryNorth,
    boundaryEast: boundaryEast.present ? boundaryEast.value : this.boundaryEast,
    boundarySouth: boundarySouth.present
        ? boundarySouth.value
        : this.boundarySouth,
    boundaryWest: boundaryWest.present ? boundaryWest.value : this.boundaryWest,
    landUse: landUse.present ? landUse.value : this.landUse,
    subdivisionAllowed: subdivisionAllowed.present
        ? subdivisionAllowed.value
        : this.subdivisionAllowed,
    hasDispute: hasDispute ?? this.hasDispute,
    disputeNote: disputeNote.present ? disputeNote.value : this.disputeNote,
    notes: notes.present ? notes.value : this.notes,
    noBuildings: noBuildings ?? this.noBuildings,
    noTrees: noTrees ?? this.noTrees,
    noAnimals: noAnimals ?? this.noAnimals,
    status: status ?? this.status,
    infoSource: infoSource.present ? infoSource.value : this.infoSource,
    verifiedAt: verifiedAt.present ? verifiedAt.value : this.verifiedAt,
  );
  Land copyWithCompanion(LandsCompanion data) {
    return Land(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      houseGroupId: data.houseGroupId.present
          ? data.houseGroupId.value
          : this.houseGroupId,
      name: data.name.present ? data.name.value : this.name,
      addressText: data.addressText.present
          ? data.addressText.value
          : this.addressText,
      lat: data.lat.present ? data.lat.value : this.lat,
      lng: data.lng.present ? data.lng.value : this.lng,
      gpsAccuracy: data.gpsAccuracy.present
          ? data.gpsAccuracy.value
          : this.gpsAccuracy,
      extentPerches: data.extentPerches.present
          ? data.extentPerches.value
          : this.extentPerches,
      extentSource: data.extentSource.present
          ? data.extentSource.value
          : this.extentSource,
      ownershipType: data.ownershipType.present
          ? data.ownershipType.value
          : this.ownershipType,
      deedNo: data.deedNo.present ? data.deedNo.value : this.deedNo,
      planNo: data.planNo.present ? data.planNo.value : this.planNo,
      lotNo: data.lotNo.present ? data.lotNo.value : this.lotNo,
      schemeName: data.schemeName.present
          ? data.schemeName.value
          : this.schemeName,
      boundaryNorth: data.boundaryNorth.present
          ? data.boundaryNorth.value
          : this.boundaryNorth,
      boundaryEast: data.boundaryEast.present
          ? data.boundaryEast.value
          : this.boundaryEast,
      boundarySouth: data.boundarySouth.present
          ? data.boundarySouth.value
          : this.boundarySouth,
      boundaryWest: data.boundaryWest.present
          ? data.boundaryWest.value
          : this.boundaryWest,
      landUse: data.landUse.present ? data.landUse.value : this.landUse,
      subdivisionAllowed: data.subdivisionAllowed.present
          ? data.subdivisionAllowed.value
          : this.subdivisionAllowed,
      hasDispute: data.hasDispute.present
          ? data.hasDispute.value
          : this.hasDispute,
      disputeNote: data.disputeNote.present
          ? data.disputeNote.value
          : this.disputeNote,
      notes: data.notes.present ? data.notes.value : this.notes,
      noBuildings: data.noBuildings.present
          ? data.noBuildings.value
          : this.noBuildings,
      noTrees: data.noTrees.present ? data.noTrees.value : this.noTrees,
      noAnimals: data.noAnimals.present ? data.noAnimals.value : this.noAnimals,
      status: data.status.present ? data.status.value : this.status,
      infoSource: data.infoSource.present
          ? data.infoSource.value
          : this.infoSource,
      verifiedAt: data.verifiedAt.present
          ? data.verifiedAt.value
          : this.verifiedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Land(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('houseGroupId: $houseGroupId, ')
          ..write('name: $name, ')
          ..write('addressText: $addressText, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('gpsAccuracy: $gpsAccuracy, ')
          ..write('extentPerches: $extentPerches, ')
          ..write('extentSource: $extentSource, ')
          ..write('ownershipType: $ownershipType, ')
          ..write('deedNo: $deedNo, ')
          ..write('planNo: $planNo, ')
          ..write('lotNo: $lotNo, ')
          ..write('schemeName: $schemeName, ')
          ..write('boundaryNorth: $boundaryNorth, ')
          ..write('boundaryEast: $boundaryEast, ')
          ..write('boundarySouth: $boundarySouth, ')
          ..write('boundaryWest: $boundaryWest, ')
          ..write('landUse: $landUse, ')
          ..write('subdivisionAllowed: $subdivisionAllowed, ')
          ..write('hasDispute: $hasDispute, ')
          ..write('disputeNote: $disputeNote, ')
          ..write('notes: $notes, ')
          ..write('noBuildings: $noBuildings, ')
          ..write('noTrees: $noTrees, ')
          ..write('noAnimals: $noAnimals, ')
          ..write('status: $status, ')
          ..write('infoSource: $infoSource, ')
          ..write('verifiedAt: $verifiedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    createdAt,
    updatedAt,
    deletedAt,
    houseGroupId,
    name,
    addressText,
    lat,
    lng,
    gpsAccuracy,
    extentPerches,
    extentSource,
    ownershipType,
    deedNo,
    planNo,
    lotNo,
    schemeName,
    boundaryNorth,
    boundaryEast,
    boundarySouth,
    boundaryWest,
    landUse,
    subdivisionAllowed,
    hasDispute,
    disputeNote,
    notes,
    noBuildings,
    noTrees,
    noAnimals,
    status,
    infoSource,
    verifiedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Land &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.houseGroupId == this.houseGroupId &&
          other.name == this.name &&
          other.addressText == this.addressText &&
          other.lat == this.lat &&
          other.lng == this.lng &&
          other.gpsAccuracy == this.gpsAccuracy &&
          other.extentPerches == this.extentPerches &&
          other.extentSource == this.extentSource &&
          other.ownershipType == this.ownershipType &&
          other.deedNo == this.deedNo &&
          other.planNo == this.planNo &&
          other.lotNo == this.lotNo &&
          other.schemeName == this.schemeName &&
          other.boundaryNorth == this.boundaryNorth &&
          other.boundaryEast == this.boundaryEast &&
          other.boundarySouth == this.boundarySouth &&
          other.boundaryWest == this.boundaryWest &&
          other.landUse == this.landUse &&
          other.subdivisionAllowed == this.subdivisionAllowed &&
          other.hasDispute == this.hasDispute &&
          other.disputeNote == this.disputeNote &&
          other.notes == this.notes &&
          other.noBuildings == this.noBuildings &&
          other.noTrees == this.noTrees &&
          other.noAnimals == this.noAnimals &&
          other.status == this.status &&
          other.infoSource == this.infoSource &&
          other.verifiedAt == this.verifiedAt);
}

class LandsCompanion extends UpdateCompanion<Land> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> houseGroupId;
  final Value<String> name;
  final Value<String?> addressText;
  final Value<double?> lat;
  final Value<double?> lng;
  final Value<double?> gpsAccuracy;
  final Value<double?> extentPerches;
  final Value<String?> extentSource;
  final Value<String?> ownershipType;
  final Value<String?> deedNo;
  final Value<String?> planNo;
  final Value<String?> lotNo;
  final Value<String?> schemeName;
  final Value<String?> boundaryNorth;
  final Value<String?> boundaryEast;
  final Value<String?> boundarySouth;
  final Value<String?> boundaryWest;
  final Value<String?> landUse;
  final Value<String?> subdivisionAllowed;
  final Value<bool> hasDispute;
  final Value<String?> disputeNote;
  final Value<String?> notes;
  final Value<bool> noBuildings;
  final Value<bool> noTrees;
  final Value<bool> noAnimals;
  final Value<String> status;
  final Value<String?> infoSource;
  final Value<DateTime?> verifiedAt;
  final Value<int> rowid;
  const LandsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.houseGroupId = const Value.absent(),
    this.name = const Value.absent(),
    this.addressText = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.gpsAccuracy = const Value.absent(),
    this.extentPerches = const Value.absent(),
    this.extentSource = const Value.absent(),
    this.ownershipType = const Value.absent(),
    this.deedNo = const Value.absent(),
    this.planNo = const Value.absent(),
    this.lotNo = const Value.absent(),
    this.schemeName = const Value.absent(),
    this.boundaryNorth = const Value.absent(),
    this.boundaryEast = const Value.absent(),
    this.boundarySouth = const Value.absent(),
    this.boundaryWest = const Value.absent(),
    this.landUse = const Value.absent(),
    this.subdivisionAllowed = const Value.absent(),
    this.hasDispute = const Value.absent(),
    this.disputeNote = const Value.absent(),
    this.notes = const Value.absent(),
    this.noBuildings = const Value.absent(),
    this.noTrees = const Value.absent(),
    this.noAnimals = const Value.absent(),
    this.status = const Value.absent(),
    this.infoSource = const Value.absent(),
    this.verifiedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LandsCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String houseGroupId,
    required String name,
    this.addressText = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.gpsAccuracy = const Value.absent(),
    this.extentPerches = const Value.absent(),
    this.extentSource = const Value.absent(),
    this.ownershipType = const Value.absent(),
    this.deedNo = const Value.absent(),
    this.planNo = const Value.absent(),
    this.lotNo = const Value.absent(),
    this.schemeName = const Value.absent(),
    this.boundaryNorth = const Value.absent(),
    this.boundaryEast = const Value.absent(),
    this.boundarySouth = const Value.absent(),
    this.boundaryWest = const Value.absent(),
    this.landUse = const Value.absent(),
    this.subdivisionAllowed = const Value.absent(),
    this.hasDispute = const Value.absent(),
    this.disputeNote = const Value.absent(),
    this.notes = const Value.absent(),
    this.noBuildings = const Value.absent(),
    this.noTrees = const Value.absent(),
    this.noAnimals = const Value.absent(),
    this.status = const Value.absent(),
    this.infoSource = const Value.absent(),
    this.verifiedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       houseGroupId = Value(houseGroupId),
       name = Value(name);
  static Insertable<Land> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? houseGroupId,
    Expression<String>? name,
    Expression<String>? addressText,
    Expression<double>? lat,
    Expression<double>? lng,
    Expression<double>? gpsAccuracy,
    Expression<double>? extentPerches,
    Expression<String>? extentSource,
    Expression<String>? ownershipType,
    Expression<String>? deedNo,
    Expression<String>? planNo,
    Expression<String>? lotNo,
    Expression<String>? schemeName,
    Expression<String>? boundaryNorth,
    Expression<String>? boundaryEast,
    Expression<String>? boundarySouth,
    Expression<String>? boundaryWest,
    Expression<String>? landUse,
    Expression<String>? subdivisionAllowed,
    Expression<bool>? hasDispute,
    Expression<String>? disputeNote,
    Expression<String>? notes,
    Expression<bool>? noBuildings,
    Expression<bool>? noTrees,
    Expression<bool>? noAnimals,
    Expression<String>? status,
    Expression<String>? infoSource,
    Expression<DateTime>? verifiedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (houseGroupId != null) 'house_group_id': houseGroupId,
      if (name != null) 'name': name,
      if (addressText != null) 'address_text': addressText,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (gpsAccuracy != null) 'gps_accuracy': gpsAccuracy,
      if (extentPerches != null) 'extent_perches': extentPerches,
      if (extentSource != null) 'extent_source': extentSource,
      if (ownershipType != null) 'ownership_type': ownershipType,
      if (deedNo != null) 'deed_no': deedNo,
      if (planNo != null) 'plan_no': planNo,
      if (lotNo != null) 'lot_no': lotNo,
      if (schemeName != null) 'scheme_name': schemeName,
      if (boundaryNorth != null) 'boundary_north': boundaryNorth,
      if (boundaryEast != null) 'boundary_east': boundaryEast,
      if (boundarySouth != null) 'boundary_south': boundarySouth,
      if (boundaryWest != null) 'boundary_west': boundaryWest,
      if (landUse != null) 'land_use': landUse,
      if (subdivisionAllowed != null) 'subdivision_allowed': subdivisionAllowed,
      if (hasDispute != null) 'has_dispute': hasDispute,
      if (disputeNote != null) 'dispute_note': disputeNote,
      if (notes != null) 'notes': notes,
      if (noBuildings != null) 'no_buildings': noBuildings,
      if (noTrees != null) 'no_trees': noTrees,
      if (noAnimals != null) 'no_animals': noAnimals,
      if (status != null) 'status': status,
      if (infoSource != null) 'info_source': infoSource,
      if (verifiedAt != null) 'verified_at': verifiedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LandsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? houseGroupId,
    Value<String>? name,
    Value<String?>? addressText,
    Value<double?>? lat,
    Value<double?>? lng,
    Value<double?>? gpsAccuracy,
    Value<double?>? extentPerches,
    Value<String?>? extentSource,
    Value<String?>? ownershipType,
    Value<String?>? deedNo,
    Value<String?>? planNo,
    Value<String?>? lotNo,
    Value<String?>? schemeName,
    Value<String?>? boundaryNorth,
    Value<String?>? boundaryEast,
    Value<String?>? boundarySouth,
    Value<String?>? boundaryWest,
    Value<String?>? landUse,
    Value<String?>? subdivisionAllowed,
    Value<bool>? hasDispute,
    Value<String?>? disputeNote,
    Value<String?>? notes,
    Value<bool>? noBuildings,
    Value<bool>? noTrees,
    Value<bool>? noAnimals,
    Value<String>? status,
    Value<String?>? infoSource,
    Value<DateTime?>? verifiedAt,
    Value<int>? rowid,
  }) {
    return LandsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      houseGroupId: houseGroupId ?? this.houseGroupId,
      name: name ?? this.name,
      addressText: addressText ?? this.addressText,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      gpsAccuracy: gpsAccuracy ?? this.gpsAccuracy,
      extentPerches: extentPerches ?? this.extentPerches,
      extentSource: extentSource ?? this.extentSource,
      ownershipType: ownershipType ?? this.ownershipType,
      deedNo: deedNo ?? this.deedNo,
      planNo: planNo ?? this.planNo,
      lotNo: lotNo ?? this.lotNo,
      schemeName: schemeName ?? this.schemeName,
      boundaryNorth: boundaryNorth ?? this.boundaryNorth,
      boundaryEast: boundaryEast ?? this.boundaryEast,
      boundarySouth: boundarySouth ?? this.boundarySouth,
      boundaryWest: boundaryWest ?? this.boundaryWest,
      landUse: landUse ?? this.landUse,
      subdivisionAllowed: subdivisionAllowed ?? this.subdivisionAllowed,
      hasDispute: hasDispute ?? this.hasDispute,
      disputeNote: disputeNote ?? this.disputeNote,
      notes: notes ?? this.notes,
      noBuildings: noBuildings ?? this.noBuildings,
      noTrees: noTrees ?? this.noTrees,
      noAnimals: noAnimals ?? this.noAnimals,
      status: status ?? this.status,
      infoSource: infoSource ?? this.infoSource,
      verifiedAt: verifiedAt ?? this.verifiedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (houseGroupId.present) {
      map['house_group_id'] = Variable<String>(houseGroupId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (addressText.present) {
      map['address_text'] = Variable<String>(addressText.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    if (gpsAccuracy.present) {
      map['gps_accuracy'] = Variable<double>(gpsAccuracy.value);
    }
    if (extentPerches.present) {
      map['extent_perches'] = Variable<double>(extentPerches.value);
    }
    if (extentSource.present) {
      map['extent_source'] = Variable<String>(extentSource.value);
    }
    if (ownershipType.present) {
      map['ownership_type'] = Variable<String>(ownershipType.value);
    }
    if (deedNo.present) {
      map['deed_no'] = Variable<String>(deedNo.value);
    }
    if (planNo.present) {
      map['plan_no'] = Variable<String>(planNo.value);
    }
    if (lotNo.present) {
      map['lot_no'] = Variable<String>(lotNo.value);
    }
    if (schemeName.present) {
      map['scheme_name'] = Variable<String>(schemeName.value);
    }
    if (boundaryNorth.present) {
      map['boundary_north'] = Variable<String>(boundaryNorth.value);
    }
    if (boundaryEast.present) {
      map['boundary_east'] = Variable<String>(boundaryEast.value);
    }
    if (boundarySouth.present) {
      map['boundary_south'] = Variable<String>(boundarySouth.value);
    }
    if (boundaryWest.present) {
      map['boundary_west'] = Variable<String>(boundaryWest.value);
    }
    if (landUse.present) {
      map['land_use'] = Variable<String>(landUse.value);
    }
    if (subdivisionAllowed.present) {
      map['subdivision_allowed'] = Variable<String>(subdivisionAllowed.value);
    }
    if (hasDispute.present) {
      map['has_dispute'] = Variable<bool>(hasDispute.value);
    }
    if (disputeNote.present) {
      map['dispute_note'] = Variable<String>(disputeNote.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (noBuildings.present) {
      map['no_buildings'] = Variable<bool>(noBuildings.value);
    }
    if (noTrees.present) {
      map['no_trees'] = Variable<bool>(noTrees.value);
    }
    if (noAnimals.present) {
      map['no_animals'] = Variable<bool>(noAnimals.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (infoSource.present) {
      map['info_source'] = Variable<String>(infoSource.value);
    }
    if (verifiedAt.present) {
      map['verified_at'] = Variable<DateTime>(verifiedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LandsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('houseGroupId: $houseGroupId, ')
          ..write('name: $name, ')
          ..write('addressText: $addressText, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('gpsAccuracy: $gpsAccuracy, ')
          ..write('extentPerches: $extentPerches, ')
          ..write('extentSource: $extentSource, ')
          ..write('ownershipType: $ownershipType, ')
          ..write('deedNo: $deedNo, ')
          ..write('planNo: $planNo, ')
          ..write('lotNo: $lotNo, ')
          ..write('schemeName: $schemeName, ')
          ..write('boundaryNorth: $boundaryNorth, ')
          ..write('boundaryEast: $boundaryEast, ')
          ..write('boundarySouth: $boundarySouth, ')
          ..write('boundaryWest: $boundaryWest, ')
          ..write('landUse: $landUse, ')
          ..write('subdivisionAllowed: $subdivisionAllowed, ')
          ..write('hasDispute: $hasDispute, ')
          ..write('disputeNote: $disputeNote, ')
          ..write('notes: $notes, ')
          ..write('noBuildings: $noBuildings, ')
          ..write('noTrees: $noTrees, ')
          ..write('noAnimals: $noAnimals, ')
          ..write('status: $status, ')
          ..write('infoSource: $infoSource, ')
          ..write('verifiedAt: $verifiedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BuildingsTable extends Buildings
    with TableInfo<$BuildingsTable, Building> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BuildingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _landIdMeta = const VerificationMeta('landId');
  @override
  late final GeneratedColumn<String> landId = GeneratedColumn<String>(
    'land_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES lands (id)',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _buildingNoMeta = const VerificationMeta(
    'buildingNo',
  );
  @override
  late final GeneratedColumn<String> buildingNo = GeneratedColumn<String>(
    'building_no',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _floorsMeta = const VerificationMeta('floors');
  @override
  late final GeneratedColumn<int> floors = GeneratedColumn<int>(
    'floors',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _floorAreaSqftMeta = const VerificationMeta(
    'floorAreaSqft',
  );
  @override
  late final GeneratedColumn<double> floorAreaSqft = GeneratedColumn<double>(
    'floor_area_sqft',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _roomsMeta = const VerificationMeta('rooms');
  @override
  late final GeneratedColumn<int> rooms = GeneratedColumn<int>(
    'rooms',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _wallMeta = const VerificationMeta('wall');
  @override
  late final GeneratedColumn<String> wall = GeneratedColumn<String>(
    'wall',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _roofMeta = const VerificationMeta('roof');
  @override
  late final GeneratedColumn<String> roof = GeneratedColumn<String>(
    'roof',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _floorMeta = const VerificationMeta('floor');
  @override
  late final GeneratedColumn<String> floor = GeneratedColumn<String>(
    'floor',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _permanenceMeta = const VerificationMeta(
    'permanence',
  );
  @override
  late final GeneratedColumn<String> permanence = GeneratedColumn<String>(
    'permanence',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _conditionMeta = const VerificationMeta(
    'condition',
  );
  @override
  late final GeneratedColumn<String> condition = GeneratedColumn<String>(
    'condition',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _yearBuiltMeta = const VerificationMeta(
    'yearBuilt',
  );
  @override
  late final GeneratedColumn<int> yearBuilt = GeneratedColumn<int>(
    'year_built',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _usageMeta = const VerificationMeta('usage');
  @override
  late final GeneratedColumn<String> usage = GeneratedColumn<String>(
    'usage',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _electricityMeta = const VerificationMeta(
    'electricity',
  );
  @override
  late final GeneratedColumn<String> electricity = GeneratedColumn<String>(
    'electricity',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _waterSourceMeta = const VerificationMeta(
    'waterSource',
  );
  @override
  late final GeneratedColumn<String> waterSource = GeneratedColumn<String>(
    'water_source',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _toiletMeta = const VerificationMeta('toilet');
  @override
  late final GeneratedColumn<String> toilet = GeneratedColumn<String>(
    'toilet',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _approvalMeta = const VerificationMeta(
    'approval',
  );
  @override
  late final GeneratedColumn<String> approval = GeneratedColumn<String>(
    'approval',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<double> lng = GeneratedColumn<double>(
    'lng',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    landId,
    type,
    buildingNo,
    floors,
    floorAreaSqft,
    rooms,
    wall,
    roof,
    floor,
    permanence,
    condition,
    yearBuilt,
    usage,
    electricity,
    waterSource,
    toilet,
    approval,
    lat,
    lng,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'buildings';
  @override
  VerificationContext validateIntegrity(
    Insertable<Building> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('land_id')) {
      context.handle(
        _landIdMeta,
        landId.isAcceptableOrUnknown(data['land_id']!, _landIdMeta),
      );
    } else if (isInserting) {
      context.missing(_landIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('building_no')) {
      context.handle(
        _buildingNoMeta,
        buildingNo.isAcceptableOrUnknown(data['building_no']!, _buildingNoMeta),
      );
    }
    if (data.containsKey('floors')) {
      context.handle(
        _floorsMeta,
        floors.isAcceptableOrUnknown(data['floors']!, _floorsMeta),
      );
    }
    if (data.containsKey('floor_area_sqft')) {
      context.handle(
        _floorAreaSqftMeta,
        floorAreaSqft.isAcceptableOrUnknown(
          data['floor_area_sqft']!,
          _floorAreaSqftMeta,
        ),
      );
    }
    if (data.containsKey('rooms')) {
      context.handle(
        _roomsMeta,
        rooms.isAcceptableOrUnknown(data['rooms']!, _roomsMeta),
      );
    }
    if (data.containsKey('wall')) {
      context.handle(
        _wallMeta,
        wall.isAcceptableOrUnknown(data['wall']!, _wallMeta),
      );
    }
    if (data.containsKey('roof')) {
      context.handle(
        _roofMeta,
        roof.isAcceptableOrUnknown(data['roof']!, _roofMeta),
      );
    }
    if (data.containsKey('floor')) {
      context.handle(
        _floorMeta,
        floor.isAcceptableOrUnknown(data['floor']!, _floorMeta),
      );
    }
    if (data.containsKey('permanence')) {
      context.handle(
        _permanenceMeta,
        permanence.isAcceptableOrUnknown(data['permanence']!, _permanenceMeta),
      );
    }
    if (data.containsKey('condition')) {
      context.handle(
        _conditionMeta,
        condition.isAcceptableOrUnknown(data['condition']!, _conditionMeta),
      );
    }
    if (data.containsKey('year_built')) {
      context.handle(
        _yearBuiltMeta,
        yearBuilt.isAcceptableOrUnknown(data['year_built']!, _yearBuiltMeta),
      );
    }
    if (data.containsKey('usage')) {
      context.handle(
        _usageMeta,
        usage.isAcceptableOrUnknown(data['usage']!, _usageMeta),
      );
    }
    if (data.containsKey('electricity')) {
      context.handle(
        _electricityMeta,
        electricity.isAcceptableOrUnknown(
          data['electricity']!,
          _electricityMeta,
        ),
      );
    }
    if (data.containsKey('water_source')) {
      context.handle(
        _waterSourceMeta,
        waterSource.isAcceptableOrUnknown(
          data['water_source']!,
          _waterSourceMeta,
        ),
      );
    }
    if (data.containsKey('toilet')) {
      context.handle(
        _toiletMeta,
        toilet.isAcceptableOrUnknown(data['toilet']!, _toiletMeta),
      );
    }
    if (data.containsKey('approval')) {
      context.handle(
        _approvalMeta,
        approval.isAcceptableOrUnknown(data['approval']!, _approvalMeta),
      );
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    }
    if (data.containsKey('lng')) {
      context.handle(
        _lngMeta,
        lng.isAcceptableOrUnknown(data['lng']!, _lngMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Building map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Building(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      landId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}land_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      buildingNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}building_no'],
      ),
      floors: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}floors'],
      ),
      floorAreaSqft: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}floor_area_sqft'],
      ),
      rooms: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rooms'],
      ),
      wall: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}wall'],
      ),
      roof: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}roof'],
      ),
      floor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}floor'],
      ),
      permanence: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}permanence'],
      ),
      condition: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}condition'],
      ),
      yearBuilt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year_built'],
      ),
      usage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}usage'],
      ),
      electricity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}electricity'],
      ),
      waterSource: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}water_source'],
      ),
      toilet: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}toilet'],
      ),
      approval: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}approval'],
      ),
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      ),
      lng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lng'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $BuildingsTable createAlias(String alias) {
    return $BuildingsTable(attachedDatabase, alias);
  }
}

class Building extends DataClass implements Insertable<Building> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String landId;
  final String type;
  final String? buildingNo;
  final int? floors;
  final double? floorAreaSqft;
  final int? rooms;
  final String? wall;
  final String? roof;
  final String? floor;
  final String? permanence;
  final String? condition;
  final int? yearBuilt;
  final String? usage;
  final String? electricity;
  final String? waterSource;
  final String? toilet;
  final String? approval;
  final double? lat;
  final double? lng;
  final String? notes;
  const Building({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.landId,
    required this.type,
    this.buildingNo,
    this.floors,
    this.floorAreaSqft,
    this.rooms,
    this.wall,
    this.roof,
    this.floor,
    this.permanence,
    this.condition,
    this.yearBuilt,
    this.usage,
    this.electricity,
    this.waterSource,
    this.toilet,
    this.approval,
    this.lat,
    this.lng,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['land_id'] = Variable<String>(landId);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || buildingNo != null) {
      map['building_no'] = Variable<String>(buildingNo);
    }
    if (!nullToAbsent || floors != null) {
      map['floors'] = Variable<int>(floors);
    }
    if (!nullToAbsent || floorAreaSqft != null) {
      map['floor_area_sqft'] = Variable<double>(floorAreaSqft);
    }
    if (!nullToAbsent || rooms != null) {
      map['rooms'] = Variable<int>(rooms);
    }
    if (!nullToAbsent || wall != null) {
      map['wall'] = Variable<String>(wall);
    }
    if (!nullToAbsent || roof != null) {
      map['roof'] = Variable<String>(roof);
    }
    if (!nullToAbsent || floor != null) {
      map['floor'] = Variable<String>(floor);
    }
    if (!nullToAbsent || permanence != null) {
      map['permanence'] = Variable<String>(permanence);
    }
    if (!nullToAbsent || condition != null) {
      map['condition'] = Variable<String>(condition);
    }
    if (!nullToAbsent || yearBuilt != null) {
      map['year_built'] = Variable<int>(yearBuilt);
    }
    if (!nullToAbsent || usage != null) {
      map['usage'] = Variable<String>(usage);
    }
    if (!nullToAbsent || electricity != null) {
      map['electricity'] = Variable<String>(electricity);
    }
    if (!nullToAbsent || waterSource != null) {
      map['water_source'] = Variable<String>(waterSource);
    }
    if (!nullToAbsent || toilet != null) {
      map['toilet'] = Variable<String>(toilet);
    }
    if (!nullToAbsent || approval != null) {
      map['approval'] = Variable<String>(approval);
    }
    if (!nullToAbsent || lat != null) {
      map['lat'] = Variable<double>(lat);
    }
    if (!nullToAbsent || lng != null) {
      map['lng'] = Variable<double>(lng);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  BuildingsCompanion toCompanion(bool nullToAbsent) {
    return BuildingsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      landId: Value(landId),
      type: Value(type),
      buildingNo: buildingNo == null && nullToAbsent
          ? const Value.absent()
          : Value(buildingNo),
      floors: floors == null && nullToAbsent
          ? const Value.absent()
          : Value(floors),
      floorAreaSqft: floorAreaSqft == null && nullToAbsent
          ? const Value.absent()
          : Value(floorAreaSqft),
      rooms: rooms == null && nullToAbsent
          ? const Value.absent()
          : Value(rooms),
      wall: wall == null && nullToAbsent ? const Value.absent() : Value(wall),
      roof: roof == null && nullToAbsent ? const Value.absent() : Value(roof),
      floor: floor == null && nullToAbsent
          ? const Value.absent()
          : Value(floor),
      permanence: permanence == null && nullToAbsent
          ? const Value.absent()
          : Value(permanence),
      condition: condition == null && nullToAbsent
          ? const Value.absent()
          : Value(condition),
      yearBuilt: yearBuilt == null && nullToAbsent
          ? const Value.absent()
          : Value(yearBuilt),
      usage: usage == null && nullToAbsent
          ? const Value.absent()
          : Value(usage),
      electricity: electricity == null && nullToAbsent
          ? const Value.absent()
          : Value(electricity),
      waterSource: waterSource == null && nullToAbsent
          ? const Value.absent()
          : Value(waterSource),
      toilet: toilet == null && nullToAbsent
          ? const Value.absent()
          : Value(toilet),
      approval: approval == null && nullToAbsent
          ? const Value.absent()
          : Value(approval),
      lat: lat == null && nullToAbsent ? const Value.absent() : Value(lat),
      lng: lng == null && nullToAbsent ? const Value.absent() : Value(lng),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory Building.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Building(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      landId: serializer.fromJson<String>(json['landId']),
      type: serializer.fromJson<String>(json['type']),
      buildingNo: serializer.fromJson<String?>(json['buildingNo']),
      floors: serializer.fromJson<int?>(json['floors']),
      floorAreaSqft: serializer.fromJson<double?>(json['floorAreaSqft']),
      rooms: serializer.fromJson<int?>(json['rooms']),
      wall: serializer.fromJson<String?>(json['wall']),
      roof: serializer.fromJson<String?>(json['roof']),
      floor: serializer.fromJson<String?>(json['floor']),
      permanence: serializer.fromJson<String?>(json['permanence']),
      condition: serializer.fromJson<String?>(json['condition']),
      yearBuilt: serializer.fromJson<int?>(json['yearBuilt']),
      usage: serializer.fromJson<String?>(json['usage']),
      electricity: serializer.fromJson<String?>(json['electricity']),
      waterSource: serializer.fromJson<String?>(json['waterSource']),
      toilet: serializer.fromJson<String?>(json['toilet']),
      approval: serializer.fromJson<String?>(json['approval']),
      lat: serializer.fromJson<double?>(json['lat']),
      lng: serializer.fromJson<double?>(json['lng']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'landId': serializer.toJson<String>(landId),
      'type': serializer.toJson<String>(type),
      'buildingNo': serializer.toJson<String?>(buildingNo),
      'floors': serializer.toJson<int?>(floors),
      'floorAreaSqft': serializer.toJson<double?>(floorAreaSqft),
      'rooms': serializer.toJson<int?>(rooms),
      'wall': serializer.toJson<String?>(wall),
      'roof': serializer.toJson<String?>(roof),
      'floor': serializer.toJson<String?>(floor),
      'permanence': serializer.toJson<String?>(permanence),
      'condition': serializer.toJson<String?>(condition),
      'yearBuilt': serializer.toJson<int?>(yearBuilt),
      'usage': serializer.toJson<String?>(usage),
      'electricity': serializer.toJson<String?>(electricity),
      'waterSource': serializer.toJson<String?>(waterSource),
      'toilet': serializer.toJson<String?>(toilet),
      'approval': serializer.toJson<String?>(approval),
      'lat': serializer.toJson<double?>(lat),
      'lng': serializer.toJson<double?>(lng),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Building copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? landId,
    String? type,
    Value<String?> buildingNo = const Value.absent(),
    Value<int?> floors = const Value.absent(),
    Value<double?> floorAreaSqft = const Value.absent(),
    Value<int?> rooms = const Value.absent(),
    Value<String?> wall = const Value.absent(),
    Value<String?> roof = const Value.absent(),
    Value<String?> floor = const Value.absent(),
    Value<String?> permanence = const Value.absent(),
    Value<String?> condition = const Value.absent(),
    Value<int?> yearBuilt = const Value.absent(),
    Value<String?> usage = const Value.absent(),
    Value<String?> electricity = const Value.absent(),
    Value<String?> waterSource = const Value.absent(),
    Value<String?> toilet = const Value.absent(),
    Value<String?> approval = const Value.absent(),
    Value<double?> lat = const Value.absent(),
    Value<double?> lng = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => Building(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    landId: landId ?? this.landId,
    type: type ?? this.type,
    buildingNo: buildingNo.present ? buildingNo.value : this.buildingNo,
    floors: floors.present ? floors.value : this.floors,
    floorAreaSqft: floorAreaSqft.present
        ? floorAreaSqft.value
        : this.floorAreaSqft,
    rooms: rooms.present ? rooms.value : this.rooms,
    wall: wall.present ? wall.value : this.wall,
    roof: roof.present ? roof.value : this.roof,
    floor: floor.present ? floor.value : this.floor,
    permanence: permanence.present ? permanence.value : this.permanence,
    condition: condition.present ? condition.value : this.condition,
    yearBuilt: yearBuilt.present ? yearBuilt.value : this.yearBuilt,
    usage: usage.present ? usage.value : this.usage,
    electricity: electricity.present ? electricity.value : this.electricity,
    waterSource: waterSource.present ? waterSource.value : this.waterSource,
    toilet: toilet.present ? toilet.value : this.toilet,
    approval: approval.present ? approval.value : this.approval,
    lat: lat.present ? lat.value : this.lat,
    lng: lng.present ? lng.value : this.lng,
    notes: notes.present ? notes.value : this.notes,
  );
  Building copyWithCompanion(BuildingsCompanion data) {
    return Building(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      landId: data.landId.present ? data.landId.value : this.landId,
      type: data.type.present ? data.type.value : this.type,
      buildingNo: data.buildingNo.present
          ? data.buildingNo.value
          : this.buildingNo,
      floors: data.floors.present ? data.floors.value : this.floors,
      floorAreaSqft: data.floorAreaSqft.present
          ? data.floorAreaSqft.value
          : this.floorAreaSqft,
      rooms: data.rooms.present ? data.rooms.value : this.rooms,
      wall: data.wall.present ? data.wall.value : this.wall,
      roof: data.roof.present ? data.roof.value : this.roof,
      floor: data.floor.present ? data.floor.value : this.floor,
      permanence: data.permanence.present
          ? data.permanence.value
          : this.permanence,
      condition: data.condition.present ? data.condition.value : this.condition,
      yearBuilt: data.yearBuilt.present ? data.yearBuilt.value : this.yearBuilt,
      usage: data.usage.present ? data.usage.value : this.usage,
      electricity: data.electricity.present
          ? data.electricity.value
          : this.electricity,
      waterSource: data.waterSource.present
          ? data.waterSource.value
          : this.waterSource,
      toilet: data.toilet.present ? data.toilet.value : this.toilet,
      approval: data.approval.present ? data.approval.value : this.approval,
      lat: data.lat.present ? data.lat.value : this.lat,
      lng: data.lng.present ? data.lng.value : this.lng,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Building(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('landId: $landId, ')
          ..write('type: $type, ')
          ..write('buildingNo: $buildingNo, ')
          ..write('floors: $floors, ')
          ..write('floorAreaSqft: $floorAreaSqft, ')
          ..write('rooms: $rooms, ')
          ..write('wall: $wall, ')
          ..write('roof: $roof, ')
          ..write('floor: $floor, ')
          ..write('permanence: $permanence, ')
          ..write('condition: $condition, ')
          ..write('yearBuilt: $yearBuilt, ')
          ..write('usage: $usage, ')
          ..write('electricity: $electricity, ')
          ..write('waterSource: $waterSource, ')
          ..write('toilet: $toilet, ')
          ..write('approval: $approval, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    createdAt,
    updatedAt,
    deletedAt,
    landId,
    type,
    buildingNo,
    floors,
    floorAreaSqft,
    rooms,
    wall,
    roof,
    floor,
    permanence,
    condition,
    yearBuilt,
    usage,
    electricity,
    waterSource,
    toilet,
    approval,
    lat,
    lng,
    notes,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Building &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.landId == this.landId &&
          other.type == this.type &&
          other.buildingNo == this.buildingNo &&
          other.floors == this.floors &&
          other.floorAreaSqft == this.floorAreaSqft &&
          other.rooms == this.rooms &&
          other.wall == this.wall &&
          other.roof == this.roof &&
          other.floor == this.floor &&
          other.permanence == this.permanence &&
          other.condition == this.condition &&
          other.yearBuilt == this.yearBuilt &&
          other.usage == this.usage &&
          other.electricity == this.electricity &&
          other.waterSource == this.waterSource &&
          other.toilet == this.toilet &&
          other.approval == this.approval &&
          other.lat == this.lat &&
          other.lng == this.lng &&
          other.notes == this.notes);
}

class BuildingsCompanion extends UpdateCompanion<Building> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> landId;
  final Value<String> type;
  final Value<String?> buildingNo;
  final Value<int?> floors;
  final Value<double?> floorAreaSqft;
  final Value<int?> rooms;
  final Value<String?> wall;
  final Value<String?> roof;
  final Value<String?> floor;
  final Value<String?> permanence;
  final Value<String?> condition;
  final Value<int?> yearBuilt;
  final Value<String?> usage;
  final Value<String?> electricity;
  final Value<String?> waterSource;
  final Value<String?> toilet;
  final Value<String?> approval;
  final Value<double?> lat;
  final Value<double?> lng;
  final Value<String?> notes;
  final Value<int> rowid;
  const BuildingsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.landId = const Value.absent(),
    this.type = const Value.absent(),
    this.buildingNo = const Value.absent(),
    this.floors = const Value.absent(),
    this.floorAreaSqft = const Value.absent(),
    this.rooms = const Value.absent(),
    this.wall = const Value.absent(),
    this.roof = const Value.absent(),
    this.floor = const Value.absent(),
    this.permanence = const Value.absent(),
    this.condition = const Value.absent(),
    this.yearBuilt = const Value.absent(),
    this.usage = const Value.absent(),
    this.electricity = const Value.absent(),
    this.waterSource = const Value.absent(),
    this.toilet = const Value.absent(),
    this.approval = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BuildingsCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String landId,
    required String type,
    this.buildingNo = const Value.absent(),
    this.floors = const Value.absent(),
    this.floorAreaSqft = const Value.absent(),
    this.rooms = const Value.absent(),
    this.wall = const Value.absent(),
    this.roof = const Value.absent(),
    this.floor = const Value.absent(),
    this.permanence = const Value.absent(),
    this.condition = const Value.absent(),
    this.yearBuilt = const Value.absent(),
    this.usage = const Value.absent(),
    this.electricity = const Value.absent(),
    this.waterSource = const Value.absent(),
    this.toilet = const Value.absent(),
    this.approval = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       landId = Value(landId),
       type = Value(type);
  static Insertable<Building> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? landId,
    Expression<String>? type,
    Expression<String>? buildingNo,
    Expression<int>? floors,
    Expression<double>? floorAreaSqft,
    Expression<int>? rooms,
    Expression<String>? wall,
    Expression<String>? roof,
    Expression<String>? floor,
    Expression<String>? permanence,
    Expression<String>? condition,
    Expression<int>? yearBuilt,
    Expression<String>? usage,
    Expression<String>? electricity,
    Expression<String>? waterSource,
    Expression<String>? toilet,
    Expression<String>? approval,
    Expression<double>? lat,
    Expression<double>? lng,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (landId != null) 'land_id': landId,
      if (type != null) 'type': type,
      if (buildingNo != null) 'building_no': buildingNo,
      if (floors != null) 'floors': floors,
      if (floorAreaSqft != null) 'floor_area_sqft': floorAreaSqft,
      if (rooms != null) 'rooms': rooms,
      if (wall != null) 'wall': wall,
      if (roof != null) 'roof': roof,
      if (floor != null) 'floor': floor,
      if (permanence != null) 'permanence': permanence,
      if (condition != null) 'condition': condition,
      if (yearBuilt != null) 'year_built': yearBuilt,
      if (usage != null) 'usage': usage,
      if (electricity != null) 'electricity': electricity,
      if (waterSource != null) 'water_source': waterSource,
      if (toilet != null) 'toilet': toilet,
      if (approval != null) 'approval': approval,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BuildingsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? landId,
    Value<String>? type,
    Value<String?>? buildingNo,
    Value<int?>? floors,
    Value<double?>? floorAreaSqft,
    Value<int?>? rooms,
    Value<String?>? wall,
    Value<String?>? roof,
    Value<String?>? floor,
    Value<String?>? permanence,
    Value<String?>? condition,
    Value<int?>? yearBuilt,
    Value<String?>? usage,
    Value<String?>? electricity,
    Value<String?>? waterSource,
    Value<String?>? toilet,
    Value<String?>? approval,
    Value<double?>? lat,
    Value<double?>? lng,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return BuildingsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      landId: landId ?? this.landId,
      type: type ?? this.type,
      buildingNo: buildingNo ?? this.buildingNo,
      floors: floors ?? this.floors,
      floorAreaSqft: floorAreaSqft ?? this.floorAreaSqft,
      rooms: rooms ?? this.rooms,
      wall: wall ?? this.wall,
      roof: roof ?? this.roof,
      floor: floor ?? this.floor,
      permanence: permanence ?? this.permanence,
      condition: condition ?? this.condition,
      yearBuilt: yearBuilt ?? this.yearBuilt,
      usage: usage ?? this.usage,
      electricity: electricity ?? this.electricity,
      waterSource: waterSource ?? this.waterSource,
      toilet: toilet ?? this.toilet,
      approval: approval ?? this.approval,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (landId.present) {
      map['land_id'] = Variable<String>(landId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (buildingNo.present) {
      map['building_no'] = Variable<String>(buildingNo.value);
    }
    if (floors.present) {
      map['floors'] = Variable<int>(floors.value);
    }
    if (floorAreaSqft.present) {
      map['floor_area_sqft'] = Variable<double>(floorAreaSqft.value);
    }
    if (rooms.present) {
      map['rooms'] = Variable<int>(rooms.value);
    }
    if (wall.present) {
      map['wall'] = Variable<String>(wall.value);
    }
    if (roof.present) {
      map['roof'] = Variable<String>(roof.value);
    }
    if (floor.present) {
      map['floor'] = Variable<String>(floor.value);
    }
    if (permanence.present) {
      map['permanence'] = Variable<String>(permanence.value);
    }
    if (condition.present) {
      map['condition'] = Variable<String>(condition.value);
    }
    if (yearBuilt.present) {
      map['year_built'] = Variable<int>(yearBuilt.value);
    }
    if (usage.present) {
      map['usage'] = Variable<String>(usage.value);
    }
    if (electricity.present) {
      map['electricity'] = Variable<String>(electricity.value);
    }
    if (waterSource.present) {
      map['water_source'] = Variable<String>(waterSource.value);
    }
    if (toilet.present) {
      map['toilet'] = Variable<String>(toilet.value);
    }
    if (approval.present) {
      map['approval'] = Variable<String>(approval.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BuildingsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('landId: $landId, ')
          ..write('type: $type, ')
          ..write('buildingNo: $buildingNo, ')
          ..write('floors: $floors, ')
          ..write('floorAreaSqft: $floorAreaSqft, ')
          ..write('rooms: $rooms, ')
          ..write('wall: $wall, ')
          ..write('roof: $roof, ')
          ..write('floor: $floor, ')
          ..write('permanence: $permanence, ')
          ..write('condition: $condition, ')
          ..write('yearBuilt: $yearBuilt, ')
          ..write('usage: $usage, ')
          ..write('electricity: $electricity, ')
          ..write('waterSource: $waterSource, ')
          ..write('toilet: $toilet, ')
          ..write('approval: $approval, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FamiliesTable extends Families with TableInfo<$FamiliesTable, Family> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FamiliesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _buildingIdMeta = const VerificationMeta(
    'buildingId',
  );
  @override
  late final GeneratedColumn<String> buildingId = GeneratedColumn<String>(
    'building_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES buildings (id)',
    ),
  );
  static const VerificationMeta _headPersonIdMeta = const VerificationMeta(
    'headPersonId',
  );
  @override
  late final GeneratedColumn<String> headPersonId = GeneratedColumn<String>(
    'head_person_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tenureMeta = const VerificationMeta('tenure');
  @override
  late final GeneratedColumn<String> tenure = GeneratedColumn<String>(
    'tenure',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _incomeRangeMeta = const VerificationMeta(
    'incomeRange',
  );
  @override
  late final GeneratedColumn<String> incomeRange = GeneratedColumn<String>(
    'income_range',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mainIncomeSourceMeta = const VerificationMeta(
    'mainIncomeSource',
  );
  @override
  late final GeneratedColumn<String> mainIncomeSource = GeneratedColumn<String>(
    'main_income_source',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cookingFuelMeta = const VerificationMeta(
    'cookingFuel',
  );
  @override
  late final GeneratedColumn<String> cookingFuel = GeneratedColumn<String>(
    'cooking_fuel',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _welfareMeta = const VerificationMeta(
    'welfare',
  );
  @override
  late final GeneratedColumn<String> welfare = GeneratedColumn<String>(
    'welfare',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sinceYearMeta = const VerificationMeta(
    'sinceYear',
  );
  @override
  late final GeneratedColumn<int> sinceYear = GeneratedColumn<int>(
    'since_year',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    buildingId,
    headPersonId,
    tenure,
    incomeRange,
    mainIncomeSource,
    cookingFuel,
    welfare,
    sinceYear,
    phone,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'families';
  @override
  VerificationContext validateIntegrity(
    Insertable<Family> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('building_id')) {
      context.handle(
        _buildingIdMeta,
        buildingId.isAcceptableOrUnknown(data['building_id']!, _buildingIdMeta),
      );
    } else if (isInserting) {
      context.missing(_buildingIdMeta);
    }
    if (data.containsKey('head_person_id')) {
      context.handle(
        _headPersonIdMeta,
        headPersonId.isAcceptableOrUnknown(
          data['head_person_id']!,
          _headPersonIdMeta,
        ),
      );
    }
    if (data.containsKey('tenure')) {
      context.handle(
        _tenureMeta,
        tenure.isAcceptableOrUnknown(data['tenure']!, _tenureMeta),
      );
    }
    if (data.containsKey('income_range')) {
      context.handle(
        _incomeRangeMeta,
        incomeRange.isAcceptableOrUnknown(
          data['income_range']!,
          _incomeRangeMeta,
        ),
      );
    }
    if (data.containsKey('main_income_source')) {
      context.handle(
        _mainIncomeSourceMeta,
        mainIncomeSource.isAcceptableOrUnknown(
          data['main_income_source']!,
          _mainIncomeSourceMeta,
        ),
      );
    }
    if (data.containsKey('cooking_fuel')) {
      context.handle(
        _cookingFuelMeta,
        cookingFuel.isAcceptableOrUnknown(
          data['cooking_fuel']!,
          _cookingFuelMeta,
        ),
      );
    }
    if (data.containsKey('welfare')) {
      context.handle(
        _welfareMeta,
        welfare.isAcceptableOrUnknown(data['welfare']!, _welfareMeta),
      );
    }
    if (data.containsKey('since_year')) {
      context.handle(
        _sinceYearMeta,
        sinceYear.isAcceptableOrUnknown(data['since_year']!, _sinceYearMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Family map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Family(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      buildingId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}building_id'],
      )!,
      headPersonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}head_person_id'],
      ),
      tenure: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenure'],
      ),
      incomeRange: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}income_range'],
      ),
      mainIncomeSource: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}main_income_source'],
      ),
      cookingFuel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cooking_fuel'],
      ),
      welfare: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}welfare'],
      ),
      sinceYear: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}since_year'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $FamiliesTable createAlias(String alias) {
    return $FamiliesTable(attachedDatabase, alias);
  }
}

class Family extends DataClass implements Insertable<Family> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String buildingId;
  final String? headPersonId;
  final String? tenure;
  final String? incomeRange;
  final String? mainIncomeSource;
  final String? cookingFuel;

  /// Comma separated `welfare` pick list codes.
  final String? welfare;
  final int? sinceYear;
  final String? phone;
  final String? notes;
  const Family({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.buildingId,
    this.headPersonId,
    this.tenure,
    this.incomeRange,
    this.mainIncomeSource,
    this.cookingFuel,
    this.welfare,
    this.sinceYear,
    this.phone,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['building_id'] = Variable<String>(buildingId);
    if (!nullToAbsent || headPersonId != null) {
      map['head_person_id'] = Variable<String>(headPersonId);
    }
    if (!nullToAbsent || tenure != null) {
      map['tenure'] = Variable<String>(tenure);
    }
    if (!nullToAbsent || incomeRange != null) {
      map['income_range'] = Variable<String>(incomeRange);
    }
    if (!nullToAbsent || mainIncomeSource != null) {
      map['main_income_source'] = Variable<String>(mainIncomeSource);
    }
    if (!nullToAbsent || cookingFuel != null) {
      map['cooking_fuel'] = Variable<String>(cookingFuel);
    }
    if (!nullToAbsent || welfare != null) {
      map['welfare'] = Variable<String>(welfare);
    }
    if (!nullToAbsent || sinceYear != null) {
      map['since_year'] = Variable<int>(sinceYear);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  FamiliesCompanion toCompanion(bool nullToAbsent) {
    return FamiliesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      buildingId: Value(buildingId),
      headPersonId: headPersonId == null && nullToAbsent
          ? const Value.absent()
          : Value(headPersonId),
      tenure: tenure == null && nullToAbsent
          ? const Value.absent()
          : Value(tenure),
      incomeRange: incomeRange == null && nullToAbsent
          ? const Value.absent()
          : Value(incomeRange),
      mainIncomeSource: mainIncomeSource == null && nullToAbsent
          ? const Value.absent()
          : Value(mainIncomeSource),
      cookingFuel: cookingFuel == null && nullToAbsent
          ? const Value.absent()
          : Value(cookingFuel),
      welfare: welfare == null && nullToAbsent
          ? const Value.absent()
          : Value(welfare),
      sinceYear: sinceYear == null && nullToAbsent
          ? const Value.absent()
          : Value(sinceYear),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory Family.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Family(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      buildingId: serializer.fromJson<String>(json['buildingId']),
      headPersonId: serializer.fromJson<String?>(json['headPersonId']),
      tenure: serializer.fromJson<String?>(json['tenure']),
      incomeRange: serializer.fromJson<String?>(json['incomeRange']),
      mainIncomeSource: serializer.fromJson<String?>(json['mainIncomeSource']),
      cookingFuel: serializer.fromJson<String?>(json['cookingFuel']),
      welfare: serializer.fromJson<String?>(json['welfare']),
      sinceYear: serializer.fromJson<int?>(json['sinceYear']),
      phone: serializer.fromJson<String?>(json['phone']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'buildingId': serializer.toJson<String>(buildingId),
      'headPersonId': serializer.toJson<String?>(headPersonId),
      'tenure': serializer.toJson<String?>(tenure),
      'incomeRange': serializer.toJson<String?>(incomeRange),
      'mainIncomeSource': serializer.toJson<String?>(mainIncomeSource),
      'cookingFuel': serializer.toJson<String?>(cookingFuel),
      'welfare': serializer.toJson<String?>(welfare),
      'sinceYear': serializer.toJson<int?>(sinceYear),
      'phone': serializer.toJson<String?>(phone),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Family copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? buildingId,
    Value<String?> headPersonId = const Value.absent(),
    Value<String?> tenure = const Value.absent(),
    Value<String?> incomeRange = const Value.absent(),
    Value<String?> mainIncomeSource = const Value.absent(),
    Value<String?> cookingFuel = const Value.absent(),
    Value<String?> welfare = const Value.absent(),
    Value<int?> sinceYear = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => Family(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    buildingId: buildingId ?? this.buildingId,
    headPersonId: headPersonId.present ? headPersonId.value : this.headPersonId,
    tenure: tenure.present ? tenure.value : this.tenure,
    incomeRange: incomeRange.present ? incomeRange.value : this.incomeRange,
    mainIncomeSource: mainIncomeSource.present
        ? mainIncomeSource.value
        : this.mainIncomeSource,
    cookingFuel: cookingFuel.present ? cookingFuel.value : this.cookingFuel,
    welfare: welfare.present ? welfare.value : this.welfare,
    sinceYear: sinceYear.present ? sinceYear.value : this.sinceYear,
    phone: phone.present ? phone.value : this.phone,
    notes: notes.present ? notes.value : this.notes,
  );
  Family copyWithCompanion(FamiliesCompanion data) {
    return Family(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      buildingId: data.buildingId.present
          ? data.buildingId.value
          : this.buildingId,
      headPersonId: data.headPersonId.present
          ? data.headPersonId.value
          : this.headPersonId,
      tenure: data.tenure.present ? data.tenure.value : this.tenure,
      incomeRange: data.incomeRange.present
          ? data.incomeRange.value
          : this.incomeRange,
      mainIncomeSource: data.mainIncomeSource.present
          ? data.mainIncomeSource.value
          : this.mainIncomeSource,
      cookingFuel: data.cookingFuel.present
          ? data.cookingFuel.value
          : this.cookingFuel,
      welfare: data.welfare.present ? data.welfare.value : this.welfare,
      sinceYear: data.sinceYear.present ? data.sinceYear.value : this.sinceYear,
      phone: data.phone.present ? data.phone.value : this.phone,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Family(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('buildingId: $buildingId, ')
          ..write('headPersonId: $headPersonId, ')
          ..write('tenure: $tenure, ')
          ..write('incomeRange: $incomeRange, ')
          ..write('mainIncomeSource: $mainIncomeSource, ')
          ..write('cookingFuel: $cookingFuel, ')
          ..write('welfare: $welfare, ')
          ..write('sinceYear: $sinceYear, ')
          ..write('phone: $phone, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    buildingId,
    headPersonId,
    tenure,
    incomeRange,
    mainIncomeSource,
    cookingFuel,
    welfare,
    sinceYear,
    phone,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Family &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.buildingId == this.buildingId &&
          other.headPersonId == this.headPersonId &&
          other.tenure == this.tenure &&
          other.incomeRange == this.incomeRange &&
          other.mainIncomeSource == this.mainIncomeSource &&
          other.cookingFuel == this.cookingFuel &&
          other.welfare == this.welfare &&
          other.sinceYear == this.sinceYear &&
          other.phone == this.phone &&
          other.notes == this.notes);
}

class FamiliesCompanion extends UpdateCompanion<Family> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> buildingId;
  final Value<String?> headPersonId;
  final Value<String?> tenure;
  final Value<String?> incomeRange;
  final Value<String?> mainIncomeSource;
  final Value<String?> cookingFuel;
  final Value<String?> welfare;
  final Value<int?> sinceYear;
  final Value<String?> phone;
  final Value<String?> notes;
  final Value<int> rowid;
  const FamiliesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.buildingId = const Value.absent(),
    this.headPersonId = const Value.absent(),
    this.tenure = const Value.absent(),
    this.incomeRange = const Value.absent(),
    this.mainIncomeSource = const Value.absent(),
    this.cookingFuel = const Value.absent(),
    this.welfare = const Value.absent(),
    this.sinceYear = const Value.absent(),
    this.phone = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FamiliesCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String buildingId,
    this.headPersonId = const Value.absent(),
    this.tenure = const Value.absent(),
    this.incomeRange = const Value.absent(),
    this.mainIncomeSource = const Value.absent(),
    this.cookingFuel = const Value.absent(),
    this.welfare = const Value.absent(),
    this.sinceYear = const Value.absent(),
    this.phone = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       buildingId = Value(buildingId);
  static Insertable<Family> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? buildingId,
    Expression<String>? headPersonId,
    Expression<String>? tenure,
    Expression<String>? incomeRange,
    Expression<String>? mainIncomeSource,
    Expression<String>? cookingFuel,
    Expression<String>? welfare,
    Expression<int>? sinceYear,
    Expression<String>? phone,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (buildingId != null) 'building_id': buildingId,
      if (headPersonId != null) 'head_person_id': headPersonId,
      if (tenure != null) 'tenure': tenure,
      if (incomeRange != null) 'income_range': incomeRange,
      if (mainIncomeSource != null) 'main_income_source': mainIncomeSource,
      if (cookingFuel != null) 'cooking_fuel': cookingFuel,
      if (welfare != null) 'welfare': welfare,
      if (sinceYear != null) 'since_year': sinceYear,
      if (phone != null) 'phone': phone,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FamiliesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? buildingId,
    Value<String?>? headPersonId,
    Value<String?>? tenure,
    Value<String?>? incomeRange,
    Value<String?>? mainIncomeSource,
    Value<String?>? cookingFuel,
    Value<String?>? welfare,
    Value<int?>? sinceYear,
    Value<String?>? phone,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return FamiliesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      buildingId: buildingId ?? this.buildingId,
      headPersonId: headPersonId ?? this.headPersonId,
      tenure: tenure ?? this.tenure,
      incomeRange: incomeRange ?? this.incomeRange,
      mainIncomeSource: mainIncomeSource ?? this.mainIncomeSource,
      cookingFuel: cookingFuel ?? this.cookingFuel,
      welfare: welfare ?? this.welfare,
      sinceYear: sinceYear ?? this.sinceYear,
      phone: phone ?? this.phone,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (buildingId.present) {
      map['building_id'] = Variable<String>(buildingId.value);
    }
    if (headPersonId.present) {
      map['head_person_id'] = Variable<String>(headPersonId.value);
    }
    if (tenure.present) {
      map['tenure'] = Variable<String>(tenure.value);
    }
    if (incomeRange.present) {
      map['income_range'] = Variable<String>(incomeRange.value);
    }
    if (mainIncomeSource.present) {
      map['main_income_source'] = Variable<String>(mainIncomeSource.value);
    }
    if (cookingFuel.present) {
      map['cooking_fuel'] = Variable<String>(cookingFuel.value);
    }
    if (welfare.present) {
      map['welfare'] = Variable<String>(welfare.value);
    }
    if (sinceYear.present) {
      map['since_year'] = Variable<int>(sinceYear.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FamiliesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('buildingId: $buildingId, ')
          ..write('headPersonId: $headPersonId, ')
          ..write('tenure: $tenure, ')
          ..write('incomeRange: $incomeRange, ')
          ..write('mainIncomeSource: $mainIncomeSource, ')
          ..write('cookingFuel: $cookingFuel, ')
          ..write('welfare: $welfare, ')
          ..write('sinceYear: $sinceYear, ')
          ..write('phone: $phone, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PersonsTable extends Persons with TableInfo<$PersonsTable, Person> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _familyIdMeta = const VerificationMeta(
    'familyId',
  );
  @override
  late final GeneratedColumn<String> familyId = GeneratedColumn<String>(
    'family_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES families (id)',
    ),
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _initialsNameMeta = const VerificationMeta(
    'initialsName',
  );
  @override
  late final GeneratedColumn<String> initialsName = GeneratedColumn<String>(
    'initials_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nicMeta = const VerificationMeta('nic');
  @override
  late final GeneratedColumn<String> nic = GeneratedColumn<String>(
    'nic',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dobMeta = const VerificationMeta('dob');
  @override
  late final GeneratedColumn<DateTime> dob = GeneratedColumn<DateTime>(
    'dob',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gender',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _relationMeta = const VerificationMeta(
    'relation',
  );
  @override
  late final GeneratedColumn<String> relation = GeneratedColumn<String>(
    'relation',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ethnicityMeta = const VerificationMeta(
    'ethnicity',
  );
  @override
  late final GeneratedColumn<String> ethnicity = GeneratedColumn<String>(
    'ethnicity',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _religionMeta = const VerificationMeta(
    'religion',
  );
  @override
  late final GeneratedColumn<String> religion = GeneratedColumn<String>(
    'religion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _civilStatusMeta = const VerificationMeta(
    'civilStatus',
  );
  @override
  late final GeneratedColumn<String> civilStatus = GeneratedColumn<String>(
    'civil_status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _educationMeta = const VerificationMeta(
    'education',
  );
  @override
  late final GeneratedColumn<String> education = GeneratedColumn<String>(
    'education',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _schoolGradeMeta = const VerificationMeta(
    'schoolGrade',
  );
  @override
  late final GeneratedColumn<String> schoolGrade = GeneratedColumn<String>(
    'school_grade',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _occupationMeta = const VerificationMeta(
    'occupation',
  );
  @override
  late final GeneratedColumn<String> occupation = GeneratedColumn<String>(
    'occupation',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _workplaceMeta = const VerificationMeta(
    'workplace',
  );
  @override
  late final GeneratedColumn<String> workplace = GeneratedColumn<String>(
    'workplace',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _disabilityMeta = const VerificationMeta(
    'disability',
  );
  @override
  late final GeneratedColumn<String> disability = GeneratedColumn<String>(
    'disability',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _chronicIllnessMeta = const VerificationMeta(
    'chronicIllness',
  );
  @override
  late final GeneratedColumn<String> chronicIllness = GeneratedColumn<String>(
    'chronic_illness',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isVoterMeta = const VerificationMeta(
    'isVoter',
  );
  @override
  late final GeneratedColumn<String> isVoter = GeneratedColumn<String>(
    'is_voter',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('resident'),
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    familyId,
    fullName,
    initialsName,
    nic,
    dob,
    gender,
    relation,
    ethnicity,
    religion,
    civilStatus,
    education,
    schoolGrade,
    occupation,
    workplace,
    disability,
    chronicIllness,
    isVoter,
    status,
    phone,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'persons';
  @override
  VerificationContext validateIntegrity(
    Insertable<Person> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('family_id')) {
      context.handle(
        _familyIdMeta,
        familyId.isAcceptableOrUnknown(data['family_id']!, _familyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_familyIdMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('initials_name')) {
      context.handle(
        _initialsNameMeta,
        initialsName.isAcceptableOrUnknown(
          data['initials_name']!,
          _initialsNameMeta,
        ),
      );
    }
    if (data.containsKey('nic')) {
      context.handle(
        _nicMeta,
        nic.isAcceptableOrUnknown(data['nic']!, _nicMeta),
      );
    }
    if (data.containsKey('dob')) {
      context.handle(
        _dobMeta,
        dob.isAcceptableOrUnknown(data['dob']!, _dobMeta),
      );
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    }
    if (data.containsKey('relation')) {
      context.handle(
        _relationMeta,
        relation.isAcceptableOrUnknown(data['relation']!, _relationMeta),
      );
    }
    if (data.containsKey('ethnicity')) {
      context.handle(
        _ethnicityMeta,
        ethnicity.isAcceptableOrUnknown(data['ethnicity']!, _ethnicityMeta),
      );
    }
    if (data.containsKey('religion')) {
      context.handle(
        _religionMeta,
        religion.isAcceptableOrUnknown(data['religion']!, _religionMeta),
      );
    }
    if (data.containsKey('civil_status')) {
      context.handle(
        _civilStatusMeta,
        civilStatus.isAcceptableOrUnknown(
          data['civil_status']!,
          _civilStatusMeta,
        ),
      );
    }
    if (data.containsKey('education')) {
      context.handle(
        _educationMeta,
        education.isAcceptableOrUnknown(data['education']!, _educationMeta),
      );
    }
    if (data.containsKey('school_grade')) {
      context.handle(
        _schoolGradeMeta,
        schoolGrade.isAcceptableOrUnknown(
          data['school_grade']!,
          _schoolGradeMeta,
        ),
      );
    }
    if (data.containsKey('occupation')) {
      context.handle(
        _occupationMeta,
        occupation.isAcceptableOrUnknown(data['occupation']!, _occupationMeta),
      );
    }
    if (data.containsKey('workplace')) {
      context.handle(
        _workplaceMeta,
        workplace.isAcceptableOrUnknown(data['workplace']!, _workplaceMeta),
      );
    }
    if (data.containsKey('disability')) {
      context.handle(
        _disabilityMeta,
        disability.isAcceptableOrUnknown(data['disability']!, _disabilityMeta),
      );
    }
    if (data.containsKey('chronic_illness')) {
      context.handle(
        _chronicIllnessMeta,
        chronicIllness.isAcceptableOrUnknown(
          data['chronic_illness']!,
          _chronicIllnessMeta,
        ),
      );
    }
    if (data.containsKey('is_voter')) {
      context.handle(
        _isVoterMeta,
        isVoter.isAcceptableOrUnknown(data['is_voter']!, _isVoterMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Person map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Person(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      familyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}family_id'],
      )!,
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      )!,
      initialsName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}initials_name'],
      ),
      nic: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nic'],
      ),
      dob: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}dob'],
      ),
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      ),
      relation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}relation'],
      ),
      ethnicity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ethnicity'],
      ),
      religion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}religion'],
      ),
      civilStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}civil_status'],
      ),
      education: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}education'],
      ),
      schoolGrade: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}school_grade'],
      ),
      occupation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}occupation'],
      ),
      workplace: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}workplace'],
      ),
      disability: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}disability'],
      ),
      chronicIllness: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}chronic_illness'],
      ),
      isVoter: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}is_voter'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $PersonsTable createAlias(String alias) {
    return $PersonsTable(attachedDatabase, alias);
  }
}

class Person extends DataClass implements Insertable<Person> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String familyId;
  final String fullName;
  final String? initialsName;
  final String? nic;
  final DateTime? dob;
  final String? gender;
  final String? relation;
  final String? ethnicity;
  final String? religion;
  final String? civilStatus;
  final String? education;
  final String? schoolGrade;
  final String? occupation;
  final String? workplace;
  final String? disability;
  final String? chronicIllness;
  final String? isVoter;

  /// resident | away | moved | dead
  final String status;
  final String? phone;
  final String? notes;
  const Person({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.familyId,
    required this.fullName,
    this.initialsName,
    this.nic,
    this.dob,
    this.gender,
    this.relation,
    this.ethnicity,
    this.religion,
    this.civilStatus,
    this.education,
    this.schoolGrade,
    this.occupation,
    this.workplace,
    this.disability,
    this.chronicIllness,
    this.isVoter,
    required this.status,
    this.phone,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['family_id'] = Variable<String>(familyId);
    map['full_name'] = Variable<String>(fullName);
    if (!nullToAbsent || initialsName != null) {
      map['initials_name'] = Variable<String>(initialsName);
    }
    if (!nullToAbsent || nic != null) {
      map['nic'] = Variable<String>(nic);
    }
    if (!nullToAbsent || dob != null) {
      map['dob'] = Variable<DateTime>(dob);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    if (!nullToAbsent || relation != null) {
      map['relation'] = Variable<String>(relation);
    }
    if (!nullToAbsent || ethnicity != null) {
      map['ethnicity'] = Variable<String>(ethnicity);
    }
    if (!nullToAbsent || religion != null) {
      map['religion'] = Variable<String>(religion);
    }
    if (!nullToAbsent || civilStatus != null) {
      map['civil_status'] = Variable<String>(civilStatus);
    }
    if (!nullToAbsent || education != null) {
      map['education'] = Variable<String>(education);
    }
    if (!nullToAbsent || schoolGrade != null) {
      map['school_grade'] = Variable<String>(schoolGrade);
    }
    if (!nullToAbsent || occupation != null) {
      map['occupation'] = Variable<String>(occupation);
    }
    if (!nullToAbsent || workplace != null) {
      map['workplace'] = Variable<String>(workplace);
    }
    if (!nullToAbsent || disability != null) {
      map['disability'] = Variable<String>(disability);
    }
    if (!nullToAbsent || chronicIllness != null) {
      map['chronic_illness'] = Variable<String>(chronicIllness);
    }
    if (!nullToAbsent || isVoter != null) {
      map['is_voter'] = Variable<String>(isVoter);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  PersonsCompanion toCompanion(bool nullToAbsent) {
    return PersonsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      familyId: Value(familyId),
      fullName: Value(fullName),
      initialsName: initialsName == null && nullToAbsent
          ? const Value.absent()
          : Value(initialsName),
      nic: nic == null && nullToAbsent ? const Value.absent() : Value(nic),
      dob: dob == null && nullToAbsent ? const Value.absent() : Value(dob),
      gender: gender == null && nullToAbsent
          ? const Value.absent()
          : Value(gender),
      relation: relation == null && nullToAbsent
          ? const Value.absent()
          : Value(relation),
      ethnicity: ethnicity == null && nullToAbsent
          ? const Value.absent()
          : Value(ethnicity),
      religion: religion == null && nullToAbsent
          ? const Value.absent()
          : Value(religion),
      civilStatus: civilStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(civilStatus),
      education: education == null && nullToAbsent
          ? const Value.absent()
          : Value(education),
      schoolGrade: schoolGrade == null && nullToAbsent
          ? const Value.absent()
          : Value(schoolGrade),
      occupation: occupation == null && nullToAbsent
          ? const Value.absent()
          : Value(occupation),
      workplace: workplace == null && nullToAbsent
          ? const Value.absent()
          : Value(workplace),
      disability: disability == null && nullToAbsent
          ? const Value.absent()
          : Value(disability),
      chronicIllness: chronicIllness == null && nullToAbsent
          ? const Value.absent()
          : Value(chronicIllness),
      isVoter: isVoter == null && nullToAbsent
          ? const Value.absent()
          : Value(isVoter),
      status: Value(status),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory Person.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Person(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      familyId: serializer.fromJson<String>(json['familyId']),
      fullName: serializer.fromJson<String>(json['fullName']),
      initialsName: serializer.fromJson<String?>(json['initialsName']),
      nic: serializer.fromJson<String?>(json['nic']),
      dob: serializer.fromJson<DateTime?>(json['dob']),
      gender: serializer.fromJson<String?>(json['gender']),
      relation: serializer.fromJson<String?>(json['relation']),
      ethnicity: serializer.fromJson<String?>(json['ethnicity']),
      religion: serializer.fromJson<String?>(json['religion']),
      civilStatus: serializer.fromJson<String?>(json['civilStatus']),
      education: serializer.fromJson<String?>(json['education']),
      schoolGrade: serializer.fromJson<String?>(json['schoolGrade']),
      occupation: serializer.fromJson<String?>(json['occupation']),
      workplace: serializer.fromJson<String?>(json['workplace']),
      disability: serializer.fromJson<String?>(json['disability']),
      chronicIllness: serializer.fromJson<String?>(json['chronicIllness']),
      isVoter: serializer.fromJson<String?>(json['isVoter']),
      status: serializer.fromJson<String>(json['status']),
      phone: serializer.fromJson<String?>(json['phone']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'familyId': serializer.toJson<String>(familyId),
      'fullName': serializer.toJson<String>(fullName),
      'initialsName': serializer.toJson<String?>(initialsName),
      'nic': serializer.toJson<String?>(nic),
      'dob': serializer.toJson<DateTime?>(dob),
      'gender': serializer.toJson<String?>(gender),
      'relation': serializer.toJson<String?>(relation),
      'ethnicity': serializer.toJson<String?>(ethnicity),
      'religion': serializer.toJson<String?>(religion),
      'civilStatus': serializer.toJson<String?>(civilStatus),
      'education': serializer.toJson<String?>(education),
      'schoolGrade': serializer.toJson<String?>(schoolGrade),
      'occupation': serializer.toJson<String?>(occupation),
      'workplace': serializer.toJson<String?>(workplace),
      'disability': serializer.toJson<String?>(disability),
      'chronicIllness': serializer.toJson<String?>(chronicIllness),
      'isVoter': serializer.toJson<String?>(isVoter),
      'status': serializer.toJson<String>(status),
      'phone': serializer.toJson<String?>(phone),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Person copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? familyId,
    String? fullName,
    Value<String?> initialsName = const Value.absent(),
    Value<String?> nic = const Value.absent(),
    Value<DateTime?> dob = const Value.absent(),
    Value<String?> gender = const Value.absent(),
    Value<String?> relation = const Value.absent(),
    Value<String?> ethnicity = const Value.absent(),
    Value<String?> religion = const Value.absent(),
    Value<String?> civilStatus = const Value.absent(),
    Value<String?> education = const Value.absent(),
    Value<String?> schoolGrade = const Value.absent(),
    Value<String?> occupation = const Value.absent(),
    Value<String?> workplace = const Value.absent(),
    Value<String?> disability = const Value.absent(),
    Value<String?> chronicIllness = const Value.absent(),
    Value<String?> isVoter = const Value.absent(),
    String? status,
    Value<String?> phone = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => Person(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    familyId: familyId ?? this.familyId,
    fullName: fullName ?? this.fullName,
    initialsName: initialsName.present ? initialsName.value : this.initialsName,
    nic: nic.present ? nic.value : this.nic,
    dob: dob.present ? dob.value : this.dob,
    gender: gender.present ? gender.value : this.gender,
    relation: relation.present ? relation.value : this.relation,
    ethnicity: ethnicity.present ? ethnicity.value : this.ethnicity,
    religion: religion.present ? religion.value : this.religion,
    civilStatus: civilStatus.present ? civilStatus.value : this.civilStatus,
    education: education.present ? education.value : this.education,
    schoolGrade: schoolGrade.present ? schoolGrade.value : this.schoolGrade,
    occupation: occupation.present ? occupation.value : this.occupation,
    workplace: workplace.present ? workplace.value : this.workplace,
    disability: disability.present ? disability.value : this.disability,
    chronicIllness: chronicIllness.present
        ? chronicIllness.value
        : this.chronicIllness,
    isVoter: isVoter.present ? isVoter.value : this.isVoter,
    status: status ?? this.status,
    phone: phone.present ? phone.value : this.phone,
    notes: notes.present ? notes.value : this.notes,
  );
  Person copyWithCompanion(PersonsCompanion data) {
    return Person(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      familyId: data.familyId.present ? data.familyId.value : this.familyId,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      initialsName: data.initialsName.present
          ? data.initialsName.value
          : this.initialsName,
      nic: data.nic.present ? data.nic.value : this.nic,
      dob: data.dob.present ? data.dob.value : this.dob,
      gender: data.gender.present ? data.gender.value : this.gender,
      relation: data.relation.present ? data.relation.value : this.relation,
      ethnicity: data.ethnicity.present ? data.ethnicity.value : this.ethnicity,
      religion: data.religion.present ? data.religion.value : this.religion,
      civilStatus: data.civilStatus.present
          ? data.civilStatus.value
          : this.civilStatus,
      education: data.education.present ? data.education.value : this.education,
      schoolGrade: data.schoolGrade.present
          ? data.schoolGrade.value
          : this.schoolGrade,
      occupation: data.occupation.present
          ? data.occupation.value
          : this.occupation,
      workplace: data.workplace.present ? data.workplace.value : this.workplace,
      disability: data.disability.present
          ? data.disability.value
          : this.disability,
      chronicIllness: data.chronicIllness.present
          ? data.chronicIllness.value
          : this.chronicIllness,
      isVoter: data.isVoter.present ? data.isVoter.value : this.isVoter,
      status: data.status.present ? data.status.value : this.status,
      phone: data.phone.present ? data.phone.value : this.phone,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Person(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('familyId: $familyId, ')
          ..write('fullName: $fullName, ')
          ..write('initialsName: $initialsName, ')
          ..write('nic: $nic, ')
          ..write('dob: $dob, ')
          ..write('gender: $gender, ')
          ..write('relation: $relation, ')
          ..write('ethnicity: $ethnicity, ')
          ..write('religion: $religion, ')
          ..write('civilStatus: $civilStatus, ')
          ..write('education: $education, ')
          ..write('schoolGrade: $schoolGrade, ')
          ..write('occupation: $occupation, ')
          ..write('workplace: $workplace, ')
          ..write('disability: $disability, ')
          ..write('chronicIllness: $chronicIllness, ')
          ..write('isVoter: $isVoter, ')
          ..write('status: $status, ')
          ..write('phone: $phone, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    createdAt,
    updatedAt,
    deletedAt,
    familyId,
    fullName,
    initialsName,
    nic,
    dob,
    gender,
    relation,
    ethnicity,
    religion,
    civilStatus,
    education,
    schoolGrade,
    occupation,
    workplace,
    disability,
    chronicIllness,
    isVoter,
    status,
    phone,
    notes,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Person &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.familyId == this.familyId &&
          other.fullName == this.fullName &&
          other.initialsName == this.initialsName &&
          other.nic == this.nic &&
          other.dob == this.dob &&
          other.gender == this.gender &&
          other.relation == this.relation &&
          other.ethnicity == this.ethnicity &&
          other.religion == this.religion &&
          other.civilStatus == this.civilStatus &&
          other.education == this.education &&
          other.schoolGrade == this.schoolGrade &&
          other.occupation == this.occupation &&
          other.workplace == this.workplace &&
          other.disability == this.disability &&
          other.chronicIllness == this.chronicIllness &&
          other.isVoter == this.isVoter &&
          other.status == this.status &&
          other.phone == this.phone &&
          other.notes == this.notes);
}

class PersonsCompanion extends UpdateCompanion<Person> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> familyId;
  final Value<String> fullName;
  final Value<String?> initialsName;
  final Value<String?> nic;
  final Value<DateTime?> dob;
  final Value<String?> gender;
  final Value<String?> relation;
  final Value<String?> ethnicity;
  final Value<String?> religion;
  final Value<String?> civilStatus;
  final Value<String?> education;
  final Value<String?> schoolGrade;
  final Value<String?> occupation;
  final Value<String?> workplace;
  final Value<String?> disability;
  final Value<String?> chronicIllness;
  final Value<String?> isVoter;
  final Value<String> status;
  final Value<String?> phone;
  final Value<String?> notes;
  final Value<int> rowid;
  const PersonsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.familyId = const Value.absent(),
    this.fullName = const Value.absent(),
    this.initialsName = const Value.absent(),
    this.nic = const Value.absent(),
    this.dob = const Value.absent(),
    this.gender = const Value.absent(),
    this.relation = const Value.absent(),
    this.ethnicity = const Value.absent(),
    this.religion = const Value.absent(),
    this.civilStatus = const Value.absent(),
    this.education = const Value.absent(),
    this.schoolGrade = const Value.absent(),
    this.occupation = const Value.absent(),
    this.workplace = const Value.absent(),
    this.disability = const Value.absent(),
    this.chronicIllness = const Value.absent(),
    this.isVoter = const Value.absent(),
    this.status = const Value.absent(),
    this.phone = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PersonsCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String familyId,
    required String fullName,
    this.initialsName = const Value.absent(),
    this.nic = const Value.absent(),
    this.dob = const Value.absent(),
    this.gender = const Value.absent(),
    this.relation = const Value.absent(),
    this.ethnicity = const Value.absent(),
    this.religion = const Value.absent(),
    this.civilStatus = const Value.absent(),
    this.education = const Value.absent(),
    this.schoolGrade = const Value.absent(),
    this.occupation = const Value.absent(),
    this.workplace = const Value.absent(),
    this.disability = const Value.absent(),
    this.chronicIllness = const Value.absent(),
    this.isVoter = const Value.absent(),
    this.status = const Value.absent(),
    this.phone = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       familyId = Value(familyId),
       fullName = Value(fullName);
  static Insertable<Person> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? familyId,
    Expression<String>? fullName,
    Expression<String>? initialsName,
    Expression<String>? nic,
    Expression<DateTime>? dob,
    Expression<String>? gender,
    Expression<String>? relation,
    Expression<String>? ethnicity,
    Expression<String>? religion,
    Expression<String>? civilStatus,
    Expression<String>? education,
    Expression<String>? schoolGrade,
    Expression<String>? occupation,
    Expression<String>? workplace,
    Expression<String>? disability,
    Expression<String>? chronicIllness,
    Expression<String>? isVoter,
    Expression<String>? status,
    Expression<String>? phone,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (familyId != null) 'family_id': familyId,
      if (fullName != null) 'full_name': fullName,
      if (initialsName != null) 'initials_name': initialsName,
      if (nic != null) 'nic': nic,
      if (dob != null) 'dob': dob,
      if (gender != null) 'gender': gender,
      if (relation != null) 'relation': relation,
      if (ethnicity != null) 'ethnicity': ethnicity,
      if (religion != null) 'religion': religion,
      if (civilStatus != null) 'civil_status': civilStatus,
      if (education != null) 'education': education,
      if (schoolGrade != null) 'school_grade': schoolGrade,
      if (occupation != null) 'occupation': occupation,
      if (workplace != null) 'workplace': workplace,
      if (disability != null) 'disability': disability,
      if (chronicIllness != null) 'chronic_illness': chronicIllness,
      if (isVoter != null) 'is_voter': isVoter,
      if (status != null) 'status': status,
      if (phone != null) 'phone': phone,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PersonsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? familyId,
    Value<String>? fullName,
    Value<String?>? initialsName,
    Value<String?>? nic,
    Value<DateTime?>? dob,
    Value<String?>? gender,
    Value<String?>? relation,
    Value<String?>? ethnicity,
    Value<String?>? religion,
    Value<String?>? civilStatus,
    Value<String?>? education,
    Value<String?>? schoolGrade,
    Value<String?>? occupation,
    Value<String?>? workplace,
    Value<String?>? disability,
    Value<String?>? chronicIllness,
    Value<String?>? isVoter,
    Value<String>? status,
    Value<String?>? phone,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return PersonsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      familyId: familyId ?? this.familyId,
      fullName: fullName ?? this.fullName,
      initialsName: initialsName ?? this.initialsName,
      nic: nic ?? this.nic,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      relation: relation ?? this.relation,
      ethnicity: ethnicity ?? this.ethnicity,
      religion: religion ?? this.religion,
      civilStatus: civilStatus ?? this.civilStatus,
      education: education ?? this.education,
      schoolGrade: schoolGrade ?? this.schoolGrade,
      occupation: occupation ?? this.occupation,
      workplace: workplace ?? this.workplace,
      disability: disability ?? this.disability,
      chronicIllness: chronicIllness ?? this.chronicIllness,
      isVoter: isVoter ?? this.isVoter,
      status: status ?? this.status,
      phone: phone ?? this.phone,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (familyId.present) {
      map['family_id'] = Variable<String>(familyId.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (initialsName.present) {
      map['initials_name'] = Variable<String>(initialsName.value);
    }
    if (nic.present) {
      map['nic'] = Variable<String>(nic.value);
    }
    if (dob.present) {
      map['dob'] = Variable<DateTime>(dob.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (relation.present) {
      map['relation'] = Variable<String>(relation.value);
    }
    if (ethnicity.present) {
      map['ethnicity'] = Variable<String>(ethnicity.value);
    }
    if (religion.present) {
      map['religion'] = Variable<String>(religion.value);
    }
    if (civilStatus.present) {
      map['civil_status'] = Variable<String>(civilStatus.value);
    }
    if (education.present) {
      map['education'] = Variable<String>(education.value);
    }
    if (schoolGrade.present) {
      map['school_grade'] = Variable<String>(schoolGrade.value);
    }
    if (occupation.present) {
      map['occupation'] = Variable<String>(occupation.value);
    }
    if (workplace.present) {
      map['workplace'] = Variable<String>(workplace.value);
    }
    if (disability.present) {
      map['disability'] = Variable<String>(disability.value);
    }
    if (chronicIllness.present) {
      map['chronic_illness'] = Variable<String>(chronicIllness.value);
    }
    if (isVoter.present) {
      map['is_voter'] = Variable<String>(isVoter.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('familyId: $familyId, ')
          ..write('fullName: $fullName, ')
          ..write('initialsName: $initialsName, ')
          ..write('nic: $nic, ')
          ..write('dob: $dob, ')
          ..write('gender: $gender, ')
          ..write('relation: $relation, ')
          ..write('ethnicity: $ethnicity, ')
          ..write('religion: $religion, ')
          ..write('civilStatus: $civilStatus, ')
          ..write('education: $education, ')
          ..write('schoolGrade: $schoolGrade, ')
          ..write('occupation: $occupation, ')
          ..write('workplace: $workplace, ')
          ..write('disability: $disability, ')
          ..write('chronicIllness: $chronicIllness, ')
          ..write('isVoter: $isVoter, ')
          ..write('status: $status, ')
          ..write('phone: $phone, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LandPartiesTable extends LandParties
    with TableInfo<$LandPartiesTable, LandParty> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LandPartiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _landIdMeta = const VerificationMeta('landId');
  @override
  late final GeneratedColumn<String> landId = GeneratedColumn<String>(
    'land_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES lands (id)',
    ),
  );
  static const VerificationMeta _personIdMeta = const VerificationMeta(
    'personId',
  );
  @override
  late final GeneratedColumn<String> personId = GeneratedColumn<String>(
    'person_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES persons (id)',
    ),
  );
  static const VerificationMeta _outsideNameMeta = const VerificationMeta(
    'outsideName',
  );
  @override
  late final GeneratedColumn<String> outsideName = GeneratedColumn<String>(
    'outside_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shareMeta = const VerificationMeta('share');
  @override
  late final GeneratedColumn<String> share = GeneratedColumn<String>(
    'share',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    landId,
    personId,
    outsideName,
    role,
    share,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'land_parties';
  @override
  VerificationContext validateIntegrity(
    Insertable<LandParty> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('land_id')) {
      context.handle(
        _landIdMeta,
        landId.isAcceptableOrUnknown(data['land_id']!, _landIdMeta),
      );
    } else if (isInserting) {
      context.missing(_landIdMeta);
    }
    if (data.containsKey('person_id')) {
      context.handle(
        _personIdMeta,
        personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta),
      );
    }
    if (data.containsKey('outside_name')) {
      context.handle(
        _outsideNameMeta,
        outsideName.isAcceptableOrUnknown(
          data['outside_name']!,
          _outsideNameMeta,
        ),
      );
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('share')) {
      context.handle(
        _shareMeta,
        share.isAcceptableOrUnknown(data['share']!, _shareMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LandParty map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LandParty(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      landId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}land_id'],
      )!,
      personId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}person_id'],
      ),
      outsideName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}outside_name'],
      ),
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      share: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}share'],
      ),
    );
  }

  @override
  $LandPartiesTable createAlias(String alias) {
    return $LandPartiesTable(attachedDatabase, alias);
  }
}

class LandParty extends DataClass implements Insertable<LandParty> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String landId;
  final String? personId;
  final String? outsideName;
  final String role;
  final String? share;
  const LandParty({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.landId,
    this.personId,
    this.outsideName,
    required this.role,
    this.share,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['land_id'] = Variable<String>(landId);
    if (!nullToAbsent || personId != null) {
      map['person_id'] = Variable<String>(personId);
    }
    if (!nullToAbsent || outsideName != null) {
      map['outside_name'] = Variable<String>(outsideName);
    }
    map['role'] = Variable<String>(role);
    if (!nullToAbsent || share != null) {
      map['share'] = Variable<String>(share);
    }
    return map;
  }

  LandPartiesCompanion toCompanion(bool nullToAbsent) {
    return LandPartiesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      landId: Value(landId),
      personId: personId == null && nullToAbsent
          ? const Value.absent()
          : Value(personId),
      outsideName: outsideName == null && nullToAbsent
          ? const Value.absent()
          : Value(outsideName),
      role: Value(role),
      share: share == null && nullToAbsent
          ? const Value.absent()
          : Value(share),
    );
  }

  factory LandParty.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LandParty(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      landId: serializer.fromJson<String>(json['landId']),
      personId: serializer.fromJson<String?>(json['personId']),
      outsideName: serializer.fromJson<String?>(json['outsideName']),
      role: serializer.fromJson<String>(json['role']),
      share: serializer.fromJson<String?>(json['share']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'landId': serializer.toJson<String>(landId),
      'personId': serializer.toJson<String?>(personId),
      'outsideName': serializer.toJson<String?>(outsideName),
      'role': serializer.toJson<String>(role),
      'share': serializer.toJson<String?>(share),
    };
  }

  LandParty copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? landId,
    Value<String?> personId = const Value.absent(),
    Value<String?> outsideName = const Value.absent(),
    String? role,
    Value<String?> share = const Value.absent(),
  }) => LandParty(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    landId: landId ?? this.landId,
    personId: personId.present ? personId.value : this.personId,
    outsideName: outsideName.present ? outsideName.value : this.outsideName,
    role: role ?? this.role,
    share: share.present ? share.value : this.share,
  );
  LandParty copyWithCompanion(LandPartiesCompanion data) {
    return LandParty(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      landId: data.landId.present ? data.landId.value : this.landId,
      personId: data.personId.present ? data.personId.value : this.personId,
      outsideName: data.outsideName.present
          ? data.outsideName.value
          : this.outsideName,
      role: data.role.present ? data.role.value : this.role,
      share: data.share.present ? data.share.value : this.share,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LandParty(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('landId: $landId, ')
          ..write('personId: $personId, ')
          ..write('outsideName: $outsideName, ')
          ..write('role: $role, ')
          ..write('share: $share')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    landId,
    personId,
    outsideName,
    role,
    share,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LandParty &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.landId == this.landId &&
          other.personId == this.personId &&
          other.outsideName == this.outsideName &&
          other.role == this.role &&
          other.share == this.share);
}

class LandPartiesCompanion extends UpdateCompanion<LandParty> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> landId;
  final Value<String?> personId;
  final Value<String?> outsideName;
  final Value<String> role;
  final Value<String?> share;
  final Value<int> rowid;
  const LandPartiesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.landId = const Value.absent(),
    this.personId = const Value.absent(),
    this.outsideName = const Value.absent(),
    this.role = const Value.absent(),
    this.share = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LandPartiesCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String landId,
    this.personId = const Value.absent(),
    this.outsideName = const Value.absent(),
    required String role,
    this.share = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       landId = Value(landId),
       role = Value(role);
  static Insertable<LandParty> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? landId,
    Expression<String>? personId,
    Expression<String>? outsideName,
    Expression<String>? role,
    Expression<String>? share,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (landId != null) 'land_id': landId,
      if (personId != null) 'person_id': personId,
      if (outsideName != null) 'outside_name': outsideName,
      if (role != null) 'role': role,
      if (share != null) 'share': share,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LandPartiesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? landId,
    Value<String?>? personId,
    Value<String?>? outsideName,
    Value<String>? role,
    Value<String?>? share,
    Value<int>? rowid,
  }) {
    return LandPartiesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      landId: landId ?? this.landId,
      personId: personId ?? this.personId,
      outsideName: outsideName ?? this.outsideName,
      role: role ?? this.role,
      share: share ?? this.share,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (landId.present) {
      map['land_id'] = Variable<String>(landId.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<String>(personId.value);
    }
    if (outsideName.present) {
      map['outside_name'] = Variable<String>(outsideName.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (share.present) {
      map['share'] = Variable<String>(share.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LandPartiesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('landId: $landId, ')
          ..write('personId: $personId, ')
          ..write('outsideName: $outsideName, ')
          ..write('role: $role, ')
          ..write('share: $share, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ResidenceEventsTable extends ResidenceEvents
    with TableInfo<$ResidenceEventsTable, ResidenceEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ResidenceEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _personIdMeta = const VerificationMeta(
    'personId',
  );
  @override
  late final GeneratedColumn<String> personId = GeneratedColumn<String>(
    'person_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES persons (id)',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    personId,
    type,
    date,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'residence_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<ResidenceEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('person_id')) {
      context.handle(
        _personIdMeta,
        personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta),
      );
    } else if (isInserting) {
      context.missing(_personIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ResidenceEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ResidenceEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      personId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}person_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $ResidenceEventsTable createAlias(String alias) {
    return $ResidenceEventsTable(attachedDatabase, alias);
  }
}

class ResidenceEvent extends DataClass implements Insertable<ResidenceEvent> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String personId;

  /// arrived | left | birth | death | away | returned
  final String type;
  final DateTime date;
  final String? note;
  const ResidenceEvent({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.personId,
    required this.type,
    required this.date,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['person_id'] = Variable<String>(personId);
    map['type'] = Variable<String>(type);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  ResidenceEventsCompanion toCompanion(bool nullToAbsent) {
    return ResidenceEventsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      personId: Value(personId),
      type: Value(type),
      date: Value(date),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory ResidenceEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ResidenceEvent(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      personId: serializer.fromJson<String>(json['personId']),
      type: serializer.fromJson<String>(json['type']),
      date: serializer.fromJson<DateTime>(json['date']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'personId': serializer.toJson<String>(personId),
      'type': serializer.toJson<String>(type),
      'date': serializer.toJson<DateTime>(date),
      'note': serializer.toJson<String?>(note),
    };
  }

  ResidenceEvent copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? personId,
    String? type,
    DateTime? date,
    Value<String?> note = const Value.absent(),
  }) => ResidenceEvent(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    personId: personId ?? this.personId,
    type: type ?? this.type,
    date: date ?? this.date,
    note: note.present ? note.value : this.note,
  );
  ResidenceEvent copyWithCompanion(ResidenceEventsCompanion data) {
    return ResidenceEvent(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      personId: data.personId.present ? data.personId.value : this.personId,
      type: data.type.present ? data.type.value : this.type,
      date: data.date.present ? data.date.value : this.date,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ResidenceEvent(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('personId: $personId, ')
          ..write('type: $type, ')
          ..write('date: $date, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    personId,
    type,
    date,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ResidenceEvent &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.personId == this.personId &&
          other.type == this.type &&
          other.date == this.date &&
          other.note == this.note);
}

class ResidenceEventsCompanion extends UpdateCompanion<ResidenceEvent> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> personId;
  final Value<String> type;
  final Value<DateTime> date;
  final Value<String?> note;
  final Value<int> rowid;
  const ResidenceEventsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.personId = const Value.absent(),
    this.type = const Value.absent(),
    this.date = const Value.absent(),
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ResidenceEventsCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String personId,
    required String type,
    required DateTime date,
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       personId = Value(personId),
       type = Value(type),
       date = Value(date);
  static Insertable<ResidenceEvent> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? personId,
    Expression<String>? type,
    Expression<DateTime>? date,
    Expression<String>? note,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (personId != null) 'person_id': personId,
      if (type != null) 'type': type,
      if (date != null) 'date': date,
      if (note != null) 'note': note,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ResidenceEventsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? personId,
    Value<String>? type,
    Value<DateTime>? date,
    Value<String?>? note,
    Value<int>? rowid,
  }) {
    return ResidenceEventsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      personId: personId ?? this.personId,
      type: type ?? this.type,
      date: date ?? this.date,
      note: note ?? this.note,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<String>(personId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ResidenceEventsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('personId: $personId, ')
          ..write('type: $type, ')
          ..write('date: $date, ')
          ..write('note: $note, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TreeCountsTable extends TreeCounts
    with TableInfo<$TreeCountsTable, TreeCount> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TreeCountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _landIdMeta = const VerificationMeta('landId');
  @override
  late final GeneratedColumn<String> landId = GeneratedColumn<String>(
    'land_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES lands (id)',
    ),
  );
  static const VerificationMeta _speciesMeta = const VerificationMeta(
    'species',
  );
  @override
  late final GeneratedColumn<String> species = GeneratedColumn<String>(
    'species',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bearingMeta = const VerificationMeta(
    'bearing',
  );
  @override
  late final GeneratedColumn<int> bearing = GeneratedColumn<int>(
    'bearing',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _youngMeta = const VerificationMeta('young');
  @override
  late final GeneratedColumn<int> young = GeneratedColumn<int>(
    'young',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    landId,
    species,
    bearing,
    young,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tree_counts';
  @override
  VerificationContext validateIntegrity(
    Insertable<TreeCount> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('land_id')) {
      context.handle(
        _landIdMeta,
        landId.isAcceptableOrUnknown(data['land_id']!, _landIdMeta),
      );
    } else if (isInserting) {
      context.missing(_landIdMeta);
    }
    if (data.containsKey('species')) {
      context.handle(
        _speciesMeta,
        species.isAcceptableOrUnknown(data['species']!, _speciesMeta),
      );
    } else if (isInserting) {
      context.missing(_speciesMeta);
    }
    if (data.containsKey('bearing')) {
      context.handle(
        _bearingMeta,
        bearing.isAcceptableOrUnknown(data['bearing']!, _bearingMeta),
      );
    }
    if (data.containsKey('young')) {
      context.handle(
        _youngMeta,
        young.isAcceptableOrUnknown(data['young']!, _youngMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TreeCount map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TreeCount(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      landId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}land_id'],
      )!,
      species: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}species'],
      )!,
      bearing: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bearing'],
      )!,
      young: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}young'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $TreeCountsTable createAlias(String alias) {
    return $TreeCountsTable(attachedDatabase, alias);
  }
}

class TreeCount extends DataClass implements Insertable<TreeCount> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String landId;
  final String species;
  final int bearing;
  final int young;
  final String? note;
  const TreeCount({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.landId,
    required this.species,
    required this.bearing,
    required this.young,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['land_id'] = Variable<String>(landId);
    map['species'] = Variable<String>(species);
    map['bearing'] = Variable<int>(bearing);
    map['young'] = Variable<int>(young);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  TreeCountsCompanion toCompanion(bool nullToAbsent) {
    return TreeCountsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      landId: Value(landId),
      species: Value(species),
      bearing: Value(bearing),
      young: Value(young),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory TreeCount.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TreeCount(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      landId: serializer.fromJson<String>(json['landId']),
      species: serializer.fromJson<String>(json['species']),
      bearing: serializer.fromJson<int>(json['bearing']),
      young: serializer.fromJson<int>(json['young']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'landId': serializer.toJson<String>(landId),
      'species': serializer.toJson<String>(species),
      'bearing': serializer.toJson<int>(bearing),
      'young': serializer.toJson<int>(young),
      'note': serializer.toJson<String?>(note),
    };
  }

  TreeCount copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? landId,
    String? species,
    int? bearing,
    int? young,
    Value<String?> note = const Value.absent(),
  }) => TreeCount(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    landId: landId ?? this.landId,
    species: species ?? this.species,
    bearing: bearing ?? this.bearing,
    young: young ?? this.young,
    note: note.present ? note.value : this.note,
  );
  TreeCount copyWithCompanion(TreeCountsCompanion data) {
    return TreeCount(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      landId: data.landId.present ? data.landId.value : this.landId,
      species: data.species.present ? data.species.value : this.species,
      bearing: data.bearing.present ? data.bearing.value : this.bearing,
      young: data.young.present ? data.young.value : this.young,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TreeCount(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('landId: $landId, ')
          ..write('species: $species, ')
          ..write('bearing: $bearing, ')
          ..write('young: $young, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    landId,
    species,
    bearing,
    young,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TreeCount &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.landId == this.landId &&
          other.species == this.species &&
          other.bearing == this.bearing &&
          other.young == this.young &&
          other.note == this.note);
}

class TreeCountsCompanion extends UpdateCompanion<TreeCount> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> landId;
  final Value<String> species;
  final Value<int> bearing;
  final Value<int> young;
  final Value<String?> note;
  final Value<int> rowid;
  const TreeCountsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.landId = const Value.absent(),
    this.species = const Value.absent(),
    this.bearing = const Value.absent(),
    this.young = const Value.absent(),
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TreeCountsCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String landId,
    required String species,
    this.bearing = const Value.absent(),
    this.young = const Value.absent(),
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       landId = Value(landId),
       species = Value(species);
  static Insertable<TreeCount> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? landId,
    Expression<String>? species,
    Expression<int>? bearing,
    Expression<int>? young,
    Expression<String>? note,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (landId != null) 'land_id': landId,
      if (species != null) 'species': species,
      if (bearing != null) 'bearing': bearing,
      if (young != null) 'young': young,
      if (note != null) 'note': note,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TreeCountsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? landId,
    Value<String>? species,
    Value<int>? bearing,
    Value<int>? young,
    Value<String?>? note,
    Value<int>? rowid,
  }) {
    return TreeCountsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      landId: landId ?? this.landId,
      species: species ?? this.species,
      bearing: bearing ?? this.bearing,
      young: young ?? this.young,
      note: note ?? this.note,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (landId.present) {
      map['land_id'] = Variable<String>(landId.value);
    }
    if (species.present) {
      map['species'] = Variable<String>(species.value);
    }
    if (bearing.present) {
      map['bearing'] = Variable<int>(bearing.value);
    }
    if (young.present) {
      map['young'] = Variable<int>(young.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TreeCountsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('landId: $landId, ')
          ..write('species: $species, ')
          ..write('bearing: $bearing, ')
          ..write('young: $young, ')
          ..write('note: $note, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TreesTable extends Trees with TableInfo<$TreesTable, Tree> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TreesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _landIdMeta = const VerificationMeta('landId');
  @override
  late final GeneratedColumn<String> landId = GeneratedColumn<String>(
    'land_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES lands (id)',
    ),
  );
  static const VerificationMeta _speciesMeta = const VerificationMeta(
    'species',
  );
  @override
  late final GeneratedColumn<String> species = GeneratedColumn<String>(
    'species',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _girthInMeta = const VerificationMeta(
    'girthIn',
  );
  @override
  late final GeneratedColumn<double> girthIn = GeneratedColumn<double>(
    'girth_in',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _heightFtMeta = const VerificationMeta(
    'heightFt',
  );
  @override
  late final GeneratedColumn<double> heightFt = GeneratedColumn<double>(
    'height_ft',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ageYearsMeta = const VerificationMeta(
    'ageYears',
  );
  @override
  late final GeneratedColumn<int> ageYears = GeneratedColumn<int>(
    'age_years',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _conditionMeta = const VerificationMeta(
    'condition',
  );
  @override
  late final GeneratedColumn<String> condition = GeneratedColumn<String>(
    'condition',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isHazardMeta = const VerificationMeta(
    'isHazard',
  );
  @override
  late final GeneratedColumn<bool> isHazard = GeneratedColumn<bool>(
    'is_hazard',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_hazard" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<double> lng = GeneratedColumn<double>(
    'lng',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    landId,
    species,
    girthIn,
    heightFt,
    ageYears,
    condition,
    isHazard,
    lat,
    lng,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trees';
  @override
  VerificationContext validateIntegrity(
    Insertable<Tree> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('land_id')) {
      context.handle(
        _landIdMeta,
        landId.isAcceptableOrUnknown(data['land_id']!, _landIdMeta),
      );
    } else if (isInserting) {
      context.missing(_landIdMeta);
    }
    if (data.containsKey('species')) {
      context.handle(
        _speciesMeta,
        species.isAcceptableOrUnknown(data['species']!, _speciesMeta),
      );
    } else if (isInserting) {
      context.missing(_speciesMeta);
    }
    if (data.containsKey('girth_in')) {
      context.handle(
        _girthInMeta,
        girthIn.isAcceptableOrUnknown(data['girth_in']!, _girthInMeta),
      );
    }
    if (data.containsKey('height_ft')) {
      context.handle(
        _heightFtMeta,
        heightFt.isAcceptableOrUnknown(data['height_ft']!, _heightFtMeta),
      );
    }
    if (data.containsKey('age_years')) {
      context.handle(
        _ageYearsMeta,
        ageYears.isAcceptableOrUnknown(data['age_years']!, _ageYearsMeta),
      );
    }
    if (data.containsKey('condition')) {
      context.handle(
        _conditionMeta,
        condition.isAcceptableOrUnknown(data['condition']!, _conditionMeta),
      );
    }
    if (data.containsKey('is_hazard')) {
      context.handle(
        _isHazardMeta,
        isHazard.isAcceptableOrUnknown(data['is_hazard']!, _isHazardMeta),
      );
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    }
    if (data.containsKey('lng')) {
      context.handle(
        _lngMeta,
        lng.isAcceptableOrUnknown(data['lng']!, _lngMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tree map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tree(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      landId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}land_id'],
      )!,
      species: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}species'],
      )!,
      girthIn: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}girth_in'],
      ),
      heightFt: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}height_ft'],
      ),
      ageYears: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age_years'],
      ),
      condition: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}condition'],
      ),
      isHazard: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_hazard'],
      )!,
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      ),
      lng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lng'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $TreesTable createAlias(String alias) {
    return $TreesTable(attachedDatabase, alias);
  }
}

class Tree extends DataClass implements Insertable<Tree> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String landId;
  final String species;
  final double? girthIn;
  final double? heightFt;
  final int? ageYears;
  final String? condition;

  /// Could fall on a house / power line.
  final bool isHazard;
  final double? lat;
  final double? lng;
  final String? note;
  const Tree({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.landId,
    required this.species,
    this.girthIn,
    this.heightFt,
    this.ageYears,
    this.condition,
    required this.isHazard,
    this.lat,
    this.lng,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['land_id'] = Variable<String>(landId);
    map['species'] = Variable<String>(species);
    if (!nullToAbsent || girthIn != null) {
      map['girth_in'] = Variable<double>(girthIn);
    }
    if (!nullToAbsent || heightFt != null) {
      map['height_ft'] = Variable<double>(heightFt);
    }
    if (!nullToAbsent || ageYears != null) {
      map['age_years'] = Variable<int>(ageYears);
    }
    if (!nullToAbsent || condition != null) {
      map['condition'] = Variable<String>(condition);
    }
    map['is_hazard'] = Variable<bool>(isHazard);
    if (!nullToAbsent || lat != null) {
      map['lat'] = Variable<double>(lat);
    }
    if (!nullToAbsent || lng != null) {
      map['lng'] = Variable<double>(lng);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  TreesCompanion toCompanion(bool nullToAbsent) {
    return TreesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      landId: Value(landId),
      species: Value(species),
      girthIn: girthIn == null && nullToAbsent
          ? const Value.absent()
          : Value(girthIn),
      heightFt: heightFt == null && nullToAbsent
          ? const Value.absent()
          : Value(heightFt),
      ageYears: ageYears == null && nullToAbsent
          ? const Value.absent()
          : Value(ageYears),
      condition: condition == null && nullToAbsent
          ? const Value.absent()
          : Value(condition),
      isHazard: Value(isHazard),
      lat: lat == null && nullToAbsent ? const Value.absent() : Value(lat),
      lng: lng == null && nullToAbsent ? const Value.absent() : Value(lng),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory Tree.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tree(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      landId: serializer.fromJson<String>(json['landId']),
      species: serializer.fromJson<String>(json['species']),
      girthIn: serializer.fromJson<double?>(json['girthIn']),
      heightFt: serializer.fromJson<double?>(json['heightFt']),
      ageYears: serializer.fromJson<int?>(json['ageYears']),
      condition: serializer.fromJson<String?>(json['condition']),
      isHazard: serializer.fromJson<bool>(json['isHazard']),
      lat: serializer.fromJson<double?>(json['lat']),
      lng: serializer.fromJson<double?>(json['lng']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'landId': serializer.toJson<String>(landId),
      'species': serializer.toJson<String>(species),
      'girthIn': serializer.toJson<double?>(girthIn),
      'heightFt': serializer.toJson<double?>(heightFt),
      'ageYears': serializer.toJson<int?>(ageYears),
      'condition': serializer.toJson<String?>(condition),
      'isHazard': serializer.toJson<bool>(isHazard),
      'lat': serializer.toJson<double?>(lat),
      'lng': serializer.toJson<double?>(lng),
      'note': serializer.toJson<String?>(note),
    };
  }

  Tree copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? landId,
    String? species,
    Value<double?> girthIn = const Value.absent(),
    Value<double?> heightFt = const Value.absent(),
    Value<int?> ageYears = const Value.absent(),
    Value<String?> condition = const Value.absent(),
    bool? isHazard,
    Value<double?> lat = const Value.absent(),
    Value<double?> lng = const Value.absent(),
    Value<String?> note = const Value.absent(),
  }) => Tree(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    landId: landId ?? this.landId,
    species: species ?? this.species,
    girthIn: girthIn.present ? girthIn.value : this.girthIn,
    heightFt: heightFt.present ? heightFt.value : this.heightFt,
    ageYears: ageYears.present ? ageYears.value : this.ageYears,
    condition: condition.present ? condition.value : this.condition,
    isHazard: isHazard ?? this.isHazard,
    lat: lat.present ? lat.value : this.lat,
    lng: lng.present ? lng.value : this.lng,
    note: note.present ? note.value : this.note,
  );
  Tree copyWithCompanion(TreesCompanion data) {
    return Tree(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      landId: data.landId.present ? data.landId.value : this.landId,
      species: data.species.present ? data.species.value : this.species,
      girthIn: data.girthIn.present ? data.girthIn.value : this.girthIn,
      heightFt: data.heightFt.present ? data.heightFt.value : this.heightFt,
      ageYears: data.ageYears.present ? data.ageYears.value : this.ageYears,
      condition: data.condition.present ? data.condition.value : this.condition,
      isHazard: data.isHazard.present ? data.isHazard.value : this.isHazard,
      lat: data.lat.present ? data.lat.value : this.lat,
      lng: data.lng.present ? data.lng.value : this.lng,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tree(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('landId: $landId, ')
          ..write('species: $species, ')
          ..write('girthIn: $girthIn, ')
          ..write('heightFt: $heightFt, ')
          ..write('ageYears: $ageYears, ')
          ..write('condition: $condition, ')
          ..write('isHazard: $isHazard, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    landId,
    species,
    girthIn,
    heightFt,
    ageYears,
    condition,
    isHazard,
    lat,
    lng,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tree &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.landId == this.landId &&
          other.species == this.species &&
          other.girthIn == this.girthIn &&
          other.heightFt == this.heightFt &&
          other.ageYears == this.ageYears &&
          other.condition == this.condition &&
          other.isHazard == this.isHazard &&
          other.lat == this.lat &&
          other.lng == this.lng &&
          other.note == this.note);
}

class TreesCompanion extends UpdateCompanion<Tree> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> landId;
  final Value<String> species;
  final Value<double?> girthIn;
  final Value<double?> heightFt;
  final Value<int?> ageYears;
  final Value<String?> condition;
  final Value<bool> isHazard;
  final Value<double?> lat;
  final Value<double?> lng;
  final Value<String?> note;
  final Value<int> rowid;
  const TreesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.landId = const Value.absent(),
    this.species = const Value.absent(),
    this.girthIn = const Value.absent(),
    this.heightFt = const Value.absent(),
    this.ageYears = const Value.absent(),
    this.condition = const Value.absent(),
    this.isHazard = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TreesCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String landId,
    required String species,
    this.girthIn = const Value.absent(),
    this.heightFt = const Value.absent(),
    this.ageYears = const Value.absent(),
    this.condition = const Value.absent(),
    this.isHazard = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       landId = Value(landId),
       species = Value(species);
  static Insertable<Tree> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? landId,
    Expression<String>? species,
    Expression<double>? girthIn,
    Expression<double>? heightFt,
    Expression<int>? ageYears,
    Expression<String>? condition,
    Expression<bool>? isHazard,
    Expression<double>? lat,
    Expression<double>? lng,
    Expression<String>? note,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (landId != null) 'land_id': landId,
      if (species != null) 'species': species,
      if (girthIn != null) 'girth_in': girthIn,
      if (heightFt != null) 'height_ft': heightFt,
      if (ageYears != null) 'age_years': ageYears,
      if (condition != null) 'condition': condition,
      if (isHazard != null) 'is_hazard': isHazard,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (note != null) 'note': note,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TreesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? landId,
    Value<String>? species,
    Value<double?>? girthIn,
    Value<double?>? heightFt,
    Value<int?>? ageYears,
    Value<String?>? condition,
    Value<bool>? isHazard,
    Value<double?>? lat,
    Value<double?>? lng,
    Value<String?>? note,
    Value<int>? rowid,
  }) {
    return TreesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      landId: landId ?? this.landId,
      species: species ?? this.species,
      girthIn: girthIn ?? this.girthIn,
      heightFt: heightFt ?? this.heightFt,
      ageYears: ageYears ?? this.ageYears,
      condition: condition ?? this.condition,
      isHazard: isHazard ?? this.isHazard,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      note: note ?? this.note,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (landId.present) {
      map['land_id'] = Variable<String>(landId.value);
    }
    if (species.present) {
      map['species'] = Variable<String>(species.value);
    }
    if (girthIn.present) {
      map['girth_in'] = Variable<double>(girthIn.value);
    }
    if (heightFt.present) {
      map['height_ft'] = Variable<double>(heightFt.value);
    }
    if (ageYears.present) {
      map['age_years'] = Variable<int>(ageYears.value);
    }
    if (condition.present) {
      map['condition'] = Variable<String>(condition.value);
    }
    if (isHazard.present) {
      map['is_hazard'] = Variable<bool>(isHazard.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TreesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('landId: $landId, ')
          ..write('species: $species, ')
          ..write('girthIn: $girthIn, ')
          ..write('heightFt: $heightFt, ')
          ..write('ageYears: $ageYears, ')
          ..write('condition: $condition, ')
          ..write('isHazard: $isHazard, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('note: $note, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CropsTable extends Crops with TableInfo<$CropsTable, Crop> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CropsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _landIdMeta = const VerificationMeta('landId');
  @override
  late final GeneratedColumn<String> landId = GeneratedColumn<String>(
    'land_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES lands (id)',
    ),
  );
  static const VerificationMeta _cropMeta = const VerificationMeta('crop');
  @override
  late final GeneratedColumn<String> crop = GeneratedColumn<String>(
    'crop',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _extentValueMeta = const VerificationMeta(
    'extentValue',
  );
  @override
  late final GeneratedColumn<double> extentValue = GeneratedColumn<double>(
    'extent_value',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _extentUnitMeta = const VerificationMeta(
    'extentUnit',
  );
  @override
  late final GeneratedColumn<String> extentUnit = GeneratedColumn<String>(
    'extent_unit',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _seasonMeta = const VerificationMeta('season');
  @override
  late final GeneratedColumn<String> season = GeneratedColumn<String>(
    'season',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cultivatorMeta = const VerificationMeta(
    'cultivator',
  );
  @override
  late final GeneratedColumn<String> cultivator = GeneratedColumn<String>(
    'cultivator',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _irrigationMeta = const VerificationMeta(
    'irrigation',
  );
  @override
  late final GeneratedColumn<String> irrigation = GeneratedColumn<String>(
    'irrigation',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    landId,
    crop,
    extentValue,
    extentUnit,
    season,
    cultivator,
    irrigation,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'crops';
  @override
  VerificationContext validateIntegrity(
    Insertable<Crop> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('land_id')) {
      context.handle(
        _landIdMeta,
        landId.isAcceptableOrUnknown(data['land_id']!, _landIdMeta),
      );
    } else if (isInserting) {
      context.missing(_landIdMeta);
    }
    if (data.containsKey('crop')) {
      context.handle(
        _cropMeta,
        crop.isAcceptableOrUnknown(data['crop']!, _cropMeta),
      );
    } else if (isInserting) {
      context.missing(_cropMeta);
    }
    if (data.containsKey('extent_value')) {
      context.handle(
        _extentValueMeta,
        extentValue.isAcceptableOrUnknown(
          data['extent_value']!,
          _extentValueMeta,
        ),
      );
    }
    if (data.containsKey('extent_unit')) {
      context.handle(
        _extentUnitMeta,
        extentUnit.isAcceptableOrUnknown(data['extent_unit']!, _extentUnitMeta),
      );
    }
    if (data.containsKey('season')) {
      context.handle(
        _seasonMeta,
        season.isAcceptableOrUnknown(data['season']!, _seasonMeta),
      );
    }
    if (data.containsKey('cultivator')) {
      context.handle(
        _cultivatorMeta,
        cultivator.isAcceptableOrUnknown(data['cultivator']!, _cultivatorMeta),
      );
    }
    if (data.containsKey('irrigation')) {
      context.handle(
        _irrigationMeta,
        irrigation.isAcceptableOrUnknown(data['irrigation']!, _irrigationMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Crop map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Crop(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      landId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}land_id'],
      )!,
      crop: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}crop'],
      )!,
      extentValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}extent_value'],
      ),
      extentUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}extent_unit'],
      ),
      season: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}season'],
      ),
      cultivator: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cultivator'],
      ),
      irrigation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}irrigation'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $CropsTable createAlias(String alias) {
    return $CropsTable(attachedDatabase, alias);
  }
}

class Crop extends DataClass implements Insertable<Crop> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String landId;
  final String crop;
  final double? extentValue;
  final String? extentUnit;
  final String? season;
  final String? cultivator;
  final String? irrigation;
  final String? note;
  const Crop({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.landId,
    required this.crop,
    this.extentValue,
    this.extentUnit,
    this.season,
    this.cultivator,
    this.irrigation,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['land_id'] = Variable<String>(landId);
    map['crop'] = Variable<String>(crop);
    if (!nullToAbsent || extentValue != null) {
      map['extent_value'] = Variable<double>(extentValue);
    }
    if (!nullToAbsent || extentUnit != null) {
      map['extent_unit'] = Variable<String>(extentUnit);
    }
    if (!nullToAbsent || season != null) {
      map['season'] = Variable<String>(season);
    }
    if (!nullToAbsent || cultivator != null) {
      map['cultivator'] = Variable<String>(cultivator);
    }
    if (!nullToAbsent || irrigation != null) {
      map['irrigation'] = Variable<String>(irrigation);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  CropsCompanion toCompanion(bool nullToAbsent) {
    return CropsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      landId: Value(landId),
      crop: Value(crop),
      extentValue: extentValue == null && nullToAbsent
          ? const Value.absent()
          : Value(extentValue),
      extentUnit: extentUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(extentUnit),
      season: season == null && nullToAbsent
          ? const Value.absent()
          : Value(season),
      cultivator: cultivator == null && nullToAbsent
          ? const Value.absent()
          : Value(cultivator),
      irrigation: irrigation == null && nullToAbsent
          ? const Value.absent()
          : Value(irrigation),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory Crop.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Crop(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      landId: serializer.fromJson<String>(json['landId']),
      crop: serializer.fromJson<String>(json['crop']),
      extentValue: serializer.fromJson<double?>(json['extentValue']),
      extentUnit: serializer.fromJson<String?>(json['extentUnit']),
      season: serializer.fromJson<String?>(json['season']),
      cultivator: serializer.fromJson<String?>(json['cultivator']),
      irrigation: serializer.fromJson<String?>(json['irrigation']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'landId': serializer.toJson<String>(landId),
      'crop': serializer.toJson<String>(crop),
      'extentValue': serializer.toJson<double?>(extentValue),
      'extentUnit': serializer.toJson<String?>(extentUnit),
      'season': serializer.toJson<String?>(season),
      'cultivator': serializer.toJson<String?>(cultivator),
      'irrigation': serializer.toJson<String?>(irrigation),
      'note': serializer.toJson<String?>(note),
    };
  }

  Crop copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? landId,
    String? crop,
    Value<double?> extentValue = const Value.absent(),
    Value<String?> extentUnit = const Value.absent(),
    Value<String?> season = const Value.absent(),
    Value<String?> cultivator = const Value.absent(),
    Value<String?> irrigation = const Value.absent(),
    Value<String?> note = const Value.absent(),
  }) => Crop(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    landId: landId ?? this.landId,
    crop: crop ?? this.crop,
    extentValue: extentValue.present ? extentValue.value : this.extentValue,
    extentUnit: extentUnit.present ? extentUnit.value : this.extentUnit,
    season: season.present ? season.value : this.season,
    cultivator: cultivator.present ? cultivator.value : this.cultivator,
    irrigation: irrigation.present ? irrigation.value : this.irrigation,
    note: note.present ? note.value : this.note,
  );
  Crop copyWithCompanion(CropsCompanion data) {
    return Crop(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      landId: data.landId.present ? data.landId.value : this.landId,
      crop: data.crop.present ? data.crop.value : this.crop,
      extentValue: data.extentValue.present
          ? data.extentValue.value
          : this.extentValue,
      extentUnit: data.extentUnit.present
          ? data.extentUnit.value
          : this.extentUnit,
      season: data.season.present ? data.season.value : this.season,
      cultivator: data.cultivator.present
          ? data.cultivator.value
          : this.cultivator,
      irrigation: data.irrigation.present
          ? data.irrigation.value
          : this.irrigation,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Crop(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('landId: $landId, ')
          ..write('crop: $crop, ')
          ..write('extentValue: $extentValue, ')
          ..write('extentUnit: $extentUnit, ')
          ..write('season: $season, ')
          ..write('cultivator: $cultivator, ')
          ..write('irrigation: $irrigation, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    landId,
    crop,
    extentValue,
    extentUnit,
    season,
    cultivator,
    irrigation,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Crop &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.landId == this.landId &&
          other.crop == this.crop &&
          other.extentValue == this.extentValue &&
          other.extentUnit == this.extentUnit &&
          other.season == this.season &&
          other.cultivator == this.cultivator &&
          other.irrigation == this.irrigation &&
          other.note == this.note);
}

class CropsCompanion extends UpdateCompanion<Crop> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> landId;
  final Value<String> crop;
  final Value<double?> extentValue;
  final Value<String?> extentUnit;
  final Value<String?> season;
  final Value<String?> cultivator;
  final Value<String?> irrigation;
  final Value<String?> note;
  final Value<int> rowid;
  const CropsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.landId = const Value.absent(),
    this.crop = const Value.absent(),
    this.extentValue = const Value.absent(),
    this.extentUnit = const Value.absent(),
    this.season = const Value.absent(),
    this.cultivator = const Value.absent(),
    this.irrigation = const Value.absent(),
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CropsCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String landId,
    required String crop,
    this.extentValue = const Value.absent(),
    this.extentUnit = const Value.absent(),
    this.season = const Value.absent(),
    this.cultivator = const Value.absent(),
    this.irrigation = const Value.absent(),
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       landId = Value(landId),
       crop = Value(crop);
  static Insertable<Crop> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? landId,
    Expression<String>? crop,
    Expression<double>? extentValue,
    Expression<String>? extentUnit,
    Expression<String>? season,
    Expression<String>? cultivator,
    Expression<String>? irrigation,
    Expression<String>? note,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (landId != null) 'land_id': landId,
      if (crop != null) 'crop': crop,
      if (extentValue != null) 'extent_value': extentValue,
      if (extentUnit != null) 'extent_unit': extentUnit,
      if (season != null) 'season': season,
      if (cultivator != null) 'cultivator': cultivator,
      if (irrigation != null) 'irrigation': irrigation,
      if (note != null) 'note': note,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CropsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? landId,
    Value<String>? crop,
    Value<double?>? extentValue,
    Value<String?>? extentUnit,
    Value<String?>? season,
    Value<String?>? cultivator,
    Value<String?>? irrigation,
    Value<String?>? note,
    Value<int>? rowid,
  }) {
    return CropsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      landId: landId ?? this.landId,
      crop: crop ?? this.crop,
      extentValue: extentValue ?? this.extentValue,
      extentUnit: extentUnit ?? this.extentUnit,
      season: season ?? this.season,
      cultivator: cultivator ?? this.cultivator,
      irrigation: irrigation ?? this.irrigation,
      note: note ?? this.note,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (landId.present) {
      map['land_id'] = Variable<String>(landId.value);
    }
    if (crop.present) {
      map['crop'] = Variable<String>(crop.value);
    }
    if (extentValue.present) {
      map['extent_value'] = Variable<double>(extentValue.value);
    }
    if (extentUnit.present) {
      map['extent_unit'] = Variable<String>(extentUnit.value);
    }
    if (season.present) {
      map['season'] = Variable<String>(season.value);
    }
    if (cultivator.present) {
      map['cultivator'] = Variable<String>(cultivator.value);
    }
    if (irrigation.present) {
      map['irrigation'] = Variable<String>(irrigation.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CropsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('landId: $landId, ')
          ..write('crop: $crop, ')
          ..write('extentValue: $extentValue, ')
          ..write('extentUnit: $extentUnit, ')
          ..write('season: $season, ')
          ..write('cultivator: $cultivator, ')
          ..write('irrigation: $irrigation, ')
          ..write('note: $note, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AnimalsTable extends Animals with TableInfo<$AnimalsTable, Animal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnimalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _landIdMeta = const VerificationMeta('landId');
  @override
  late final GeneratedColumn<String> landId = GeneratedColumn<String>(
    'land_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES lands (id)',
    ),
  );
  static const VerificationMeta _familyIdMeta = const VerificationMeta(
    'familyId',
  );
  @override
  late final GeneratedColumn<String> familyId = GeneratedColumn<String>(
    'family_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _speciesMeta = const VerificationMeta(
    'species',
  );
  @override
  late final GeneratedColumn<String> species = GeneratedColumn<String>(
    'species',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _maleMeta = const VerificationMeta('male');
  @override
  late final GeneratedColumn<int> male = GeneratedColumn<int>(
    'male',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _femaleMeta = const VerificationMeta('female');
  @override
  late final GeneratedColumn<int> female = GeneratedColumn<int>(
    'female',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _youngMeta = const VerificationMeta('young');
  @override
  late final GeneratedColumn<int> young = GeneratedColumn<int>(
    'young',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _purposeMeta = const VerificationMeta(
    'purpose',
  );
  @override
  late final GeneratedColumn<String> purpose = GeneratedColumn<String>(
    'purpose',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dailyMilkLMeta = const VerificationMeta(
    'dailyMilkL',
  );
  @override
  late final GeneratedColumn<double> dailyMilkL = GeneratedColumn<double>(
    'daily_milk_l',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _housingMeta = const VerificationMeta(
    'housing',
  );
  @override
  late final GeneratedColumn<String> housing = GeneratedColumn<String>(
    'housing',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _vaccinatedMeta = const VerificationMeta(
    'vaccinated',
  );
  @override
  late final GeneratedColumn<String> vaccinated = GeneratedColumn<String>(
    'vaccinated',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastVaccinationMeta = const VerificationMeta(
    'lastVaccination',
  );
  @override
  late final GeneratedColumn<DateTime> lastVaccination =
      GeneratedColumn<DateTime>(
        'last_vaccination',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    landId,
    familyId,
    species,
    male,
    female,
    young,
    purpose,
    dailyMilkL,
    housing,
    vaccinated,
    lastVaccination,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'animals';
  @override
  VerificationContext validateIntegrity(
    Insertable<Animal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('land_id')) {
      context.handle(
        _landIdMeta,
        landId.isAcceptableOrUnknown(data['land_id']!, _landIdMeta),
      );
    } else if (isInserting) {
      context.missing(_landIdMeta);
    }
    if (data.containsKey('family_id')) {
      context.handle(
        _familyIdMeta,
        familyId.isAcceptableOrUnknown(data['family_id']!, _familyIdMeta),
      );
    }
    if (data.containsKey('species')) {
      context.handle(
        _speciesMeta,
        species.isAcceptableOrUnknown(data['species']!, _speciesMeta),
      );
    } else if (isInserting) {
      context.missing(_speciesMeta);
    }
    if (data.containsKey('male')) {
      context.handle(
        _maleMeta,
        male.isAcceptableOrUnknown(data['male']!, _maleMeta),
      );
    }
    if (data.containsKey('female')) {
      context.handle(
        _femaleMeta,
        female.isAcceptableOrUnknown(data['female']!, _femaleMeta),
      );
    }
    if (data.containsKey('young')) {
      context.handle(
        _youngMeta,
        young.isAcceptableOrUnknown(data['young']!, _youngMeta),
      );
    }
    if (data.containsKey('purpose')) {
      context.handle(
        _purposeMeta,
        purpose.isAcceptableOrUnknown(data['purpose']!, _purposeMeta),
      );
    }
    if (data.containsKey('daily_milk_l')) {
      context.handle(
        _dailyMilkLMeta,
        dailyMilkL.isAcceptableOrUnknown(
          data['daily_milk_l']!,
          _dailyMilkLMeta,
        ),
      );
    }
    if (data.containsKey('housing')) {
      context.handle(
        _housingMeta,
        housing.isAcceptableOrUnknown(data['housing']!, _housingMeta),
      );
    }
    if (data.containsKey('vaccinated')) {
      context.handle(
        _vaccinatedMeta,
        vaccinated.isAcceptableOrUnknown(data['vaccinated']!, _vaccinatedMeta),
      );
    }
    if (data.containsKey('last_vaccination')) {
      context.handle(
        _lastVaccinationMeta,
        lastVaccination.isAcceptableOrUnknown(
          data['last_vaccination']!,
          _lastVaccinationMeta,
        ),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Animal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Animal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      landId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}land_id'],
      )!,
      familyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}family_id'],
      ),
      species: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}species'],
      )!,
      male: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}male'],
      )!,
      female: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}female'],
      )!,
      young: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}young'],
      )!,
      purpose: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}purpose'],
      ),
      dailyMilkL: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}daily_milk_l'],
      ),
      housing: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}housing'],
      ),
      vaccinated: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vaccinated'],
      ),
      lastVaccination: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_vaccination'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $AnimalsTable createAlias(String alias) {
    return $AnimalsTable(attachedDatabase, alias);
  }
}

class Animal extends DataClass implements Insertable<Animal> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String landId;
  final String? familyId;
  final String species;
  final int male;
  final int female;
  final int young;
  final String? purpose;
  final double? dailyMilkL;
  final String? housing;
  final String? vaccinated;
  final DateTime? lastVaccination;
  final String? note;
  const Animal({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.landId,
    this.familyId,
    required this.species,
    required this.male,
    required this.female,
    required this.young,
    this.purpose,
    this.dailyMilkL,
    this.housing,
    this.vaccinated,
    this.lastVaccination,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['land_id'] = Variable<String>(landId);
    if (!nullToAbsent || familyId != null) {
      map['family_id'] = Variable<String>(familyId);
    }
    map['species'] = Variable<String>(species);
    map['male'] = Variable<int>(male);
    map['female'] = Variable<int>(female);
    map['young'] = Variable<int>(young);
    if (!nullToAbsent || purpose != null) {
      map['purpose'] = Variable<String>(purpose);
    }
    if (!nullToAbsent || dailyMilkL != null) {
      map['daily_milk_l'] = Variable<double>(dailyMilkL);
    }
    if (!nullToAbsent || housing != null) {
      map['housing'] = Variable<String>(housing);
    }
    if (!nullToAbsent || vaccinated != null) {
      map['vaccinated'] = Variable<String>(vaccinated);
    }
    if (!nullToAbsent || lastVaccination != null) {
      map['last_vaccination'] = Variable<DateTime>(lastVaccination);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  AnimalsCompanion toCompanion(bool nullToAbsent) {
    return AnimalsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      landId: Value(landId),
      familyId: familyId == null && nullToAbsent
          ? const Value.absent()
          : Value(familyId),
      species: Value(species),
      male: Value(male),
      female: Value(female),
      young: Value(young),
      purpose: purpose == null && nullToAbsent
          ? const Value.absent()
          : Value(purpose),
      dailyMilkL: dailyMilkL == null && nullToAbsent
          ? const Value.absent()
          : Value(dailyMilkL),
      housing: housing == null && nullToAbsent
          ? const Value.absent()
          : Value(housing),
      vaccinated: vaccinated == null && nullToAbsent
          ? const Value.absent()
          : Value(vaccinated),
      lastVaccination: lastVaccination == null && nullToAbsent
          ? const Value.absent()
          : Value(lastVaccination),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory Animal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Animal(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      landId: serializer.fromJson<String>(json['landId']),
      familyId: serializer.fromJson<String?>(json['familyId']),
      species: serializer.fromJson<String>(json['species']),
      male: serializer.fromJson<int>(json['male']),
      female: serializer.fromJson<int>(json['female']),
      young: serializer.fromJson<int>(json['young']),
      purpose: serializer.fromJson<String?>(json['purpose']),
      dailyMilkL: serializer.fromJson<double?>(json['dailyMilkL']),
      housing: serializer.fromJson<String?>(json['housing']),
      vaccinated: serializer.fromJson<String?>(json['vaccinated']),
      lastVaccination: serializer.fromJson<DateTime?>(json['lastVaccination']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'landId': serializer.toJson<String>(landId),
      'familyId': serializer.toJson<String?>(familyId),
      'species': serializer.toJson<String>(species),
      'male': serializer.toJson<int>(male),
      'female': serializer.toJson<int>(female),
      'young': serializer.toJson<int>(young),
      'purpose': serializer.toJson<String?>(purpose),
      'dailyMilkL': serializer.toJson<double?>(dailyMilkL),
      'housing': serializer.toJson<String?>(housing),
      'vaccinated': serializer.toJson<String?>(vaccinated),
      'lastVaccination': serializer.toJson<DateTime?>(lastVaccination),
      'note': serializer.toJson<String?>(note),
    };
  }

  Animal copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? landId,
    Value<String?> familyId = const Value.absent(),
    String? species,
    int? male,
    int? female,
    int? young,
    Value<String?> purpose = const Value.absent(),
    Value<double?> dailyMilkL = const Value.absent(),
    Value<String?> housing = const Value.absent(),
    Value<String?> vaccinated = const Value.absent(),
    Value<DateTime?> lastVaccination = const Value.absent(),
    Value<String?> note = const Value.absent(),
  }) => Animal(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    landId: landId ?? this.landId,
    familyId: familyId.present ? familyId.value : this.familyId,
    species: species ?? this.species,
    male: male ?? this.male,
    female: female ?? this.female,
    young: young ?? this.young,
    purpose: purpose.present ? purpose.value : this.purpose,
    dailyMilkL: dailyMilkL.present ? dailyMilkL.value : this.dailyMilkL,
    housing: housing.present ? housing.value : this.housing,
    vaccinated: vaccinated.present ? vaccinated.value : this.vaccinated,
    lastVaccination: lastVaccination.present
        ? lastVaccination.value
        : this.lastVaccination,
    note: note.present ? note.value : this.note,
  );
  Animal copyWithCompanion(AnimalsCompanion data) {
    return Animal(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      landId: data.landId.present ? data.landId.value : this.landId,
      familyId: data.familyId.present ? data.familyId.value : this.familyId,
      species: data.species.present ? data.species.value : this.species,
      male: data.male.present ? data.male.value : this.male,
      female: data.female.present ? data.female.value : this.female,
      young: data.young.present ? data.young.value : this.young,
      purpose: data.purpose.present ? data.purpose.value : this.purpose,
      dailyMilkL: data.dailyMilkL.present
          ? data.dailyMilkL.value
          : this.dailyMilkL,
      housing: data.housing.present ? data.housing.value : this.housing,
      vaccinated: data.vaccinated.present
          ? data.vaccinated.value
          : this.vaccinated,
      lastVaccination: data.lastVaccination.present
          ? data.lastVaccination.value
          : this.lastVaccination,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Animal(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('landId: $landId, ')
          ..write('familyId: $familyId, ')
          ..write('species: $species, ')
          ..write('male: $male, ')
          ..write('female: $female, ')
          ..write('young: $young, ')
          ..write('purpose: $purpose, ')
          ..write('dailyMilkL: $dailyMilkL, ')
          ..write('housing: $housing, ')
          ..write('vaccinated: $vaccinated, ')
          ..write('lastVaccination: $lastVaccination, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    landId,
    familyId,
    species,
    male,
    female,
    young,
    purpose,
    dailyMilkL,
    housing,
    vaccinated,
    lastVaccination,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Animal &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.landId == this.landId &&
          other.familyId == this.familyId &&
          other.species == this.species &&
          other.male == this.male &&
          other.female == this.female &&
          other.young == this.young &&
          other.purpose == this.purpose &&
          other.dailyMilkL == this.dailyMilkL &&
          other.housing == this.housing &&
          other.vaccinated == this.vaccinated &&
          other.lastVaccination == this.lastVaccination &&
          other.note == this.note);
}

class AnimalsCompanion extends UpdateCompanion<Animal> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> landId;
  final Value<String?> familyId;
  final Value<String> species;
  final Value<int> male;
  final Value<int> female;
  final Value<int> young;
  final Value<String?> purpose;
  final Value<double?> dailyMilkL;
  final Value<String?> housing;
  final Value<String?> vaccinated;
  final Value<DateTime?> lastVaccination;
  final Value<String?> note;
  final Value<int> rowid;
  const AnimalsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.landId = const Value.absent(),
    this.familyId = const Value.absent(),
    this.species = const Value.absent(),
    this.male = const Value.absent(),
    this.female = const Value.absent(),
    this.young = const Value.absent(),
    this.purpose = const Value.absent(),
    this.dailyMilkL = const Value.absent(),
    this.housing = const Value.absent(),
    this.vaccinated = const Value.absent(),
    this.lastVaccination = const Value.absent(),
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AnimalsCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String landId,
    this.familyId = const Value.absent(),
    required String species,
    this.male = const Value.absent(),
    this.female = const Value.absent(),
    this.young = const Value.absent(),
    this.purpose = const Value.absent(),
    this.dailyMilkL = const Value.absent(),
    this.housing = const Value.absent(),
    this.vaccinated = const Value.absent(),
    this.lastVaccination = const Value.absent(),
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       landId = Value(landId),
       species = Value(species);
  static Insertable<Animal> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? landId,
    Expression<String>? familyId,
    Expression<String>? species,
    Expression<int>? male,
    Expression<int>? female,
    Expression<int>? young,
    Expression<String>? purpose,
    Expression<double>? dailyMilkL,
    Expression<String>? housing,
    Expression<String>? vaccinated,
    Expression<DateTime>? lastVaccination,
    Expression<String>? note,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (landId != null) 'land_id': landId,
      if (familyId != null) 'family_id': familyId,
      if (species != null) 'species': species,
      if (male != null) 'male': male,
      if (female != null) 'female': female,
      if (young != null) 'young': young,
      if (purpose != null) 'purpose': purpose,
      if (dailyMilkL != null) 'daily_milk_l': dailyMilkL,
      if (housing != null) 'housing': housing,
      if (vaccinated != null) 'vaccinated': vaccinated,
      if (lastVaccination != null) 'last_vaccination': lastVaccination,
      if (note != null) 'note': note,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AnimalsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? landId,
    Value<String?>? familyId,
    Value<String>? species,
    Value<int>? male,
    Value<int>? female,
    Value<int>? young,
    Value<String?>? purpose,
    Value<double?>? dailyMilkL,
    Value<String?>? housing,
    Value<String?>? vaccinated,
    Value<DateTime?>? lastVaccination,
    Value<String?>? note,
    Value<int>? rowid,
  }) {
    return AnimalsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      landId: landId ?? this.landId,
      familyId: familyId ?? this.familyId,
      species: species ?? this.species,
      male: male ?? this.male,
      female: female ?? this.female,
      young: young ?? this.young,
      purpose: purpose ?? this.purpose,
      dailyMilkL: dailyMilkL ?? this.dailyMilkL,
      housing: housing ?? this.housing,
      vaccinated: vaccinated ?? this.vaccinated,
      lastVaccination: lastVaccination ?? this.lastVaccination,
      note: note ?? this.note,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (landId.present) {
      map['land_id'] = Variable<String>(landId.value);
    }
    if (familyId.present) {
      map['family_id'] = Variable<String>(familyId.value);
    }
    if (species.present) {
      map['species'] = Variable<String>(species.value);
    }
    if (male.present) {
      map['male'] = Variable<int>(male.value);
    }
    if (female.present) {
      map['female'] = Variable<int>(female.value);
    }
    if (young.present) {
      map['young'] = Variable<int>(young.value);
    }
    if (purpose.present) {
      map['purpose'] = Variable<String>(purpose.value);
    }
    if (dailyMilkL.present) {
      map['daily_milk_l'] = Variable<double>(dailyMilkL.value);
    }
    if (housing.present) {
      map['housing'] = Variable<String>(housing.value);
    }
    if (vaccinated.present) {
      map['vaccinated'] = Variable<String>(vaccinated.value);
    }
    if (lastVaccination.present) {
      map['last_vaccination'] = Variable<DateTime>(lastVaccination.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnimalsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('landId: $landId, ')
          ..write('familyId: $familyId, ')
          ..write('species: $species, ')
          ..write('male: $male, ')
          ..write('female: $female, ')
          ..write('young: $young, ')
          ..write('purpose: $purpose, ')
          ..write('dailyMilkL: $dailyMilkL, ')
          ..write('housing: $housing, ')
          ..write('vaccinated: $vaccinated, ')
          ..write('lastVaccination: $lastVaccination, ')
          ..write('note: $note, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PhotosTable extends Photos with TableInfo<$PhotosTable, Photo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PhotosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerTypeMeta = const VerificationMeta(
    'ownerType',
  );
  @override
  late final GeneratedColumn<String> ownerType = GeneratedColumn<String>(
    'owner_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerIdMeta = const VerificationMeta(
    'ownerId',
  );
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
    'owner_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _landIdMeta = const VerificationMeta('landId');
  @override
  late final GeneratedColumn<String> landId = GeneratedColumn<String>(
    'land_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fileNameMeta = const VerificationMeta(
    'fileName',
  );
  @override
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
    'file_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _takenAtMeta = const VerificationMeta(
    'takenAt',
  );
  @override
  late final GeneratedColumn<DateTime> takenAt = GeneratedColumn<DateTime>(
    'taken_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<double> lng = GeneratedColumn<double>(
    'lng',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    ownerType,
    ownerId,
    landId,
    fileName,
    takenAt,
    lat,
    lng,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'photos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Photo> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('owner_type')) {
      context.handle(
        _ownerTypeMeta,
        ownerType.isAcceptableOrUnknown(data['owner_type']!, _ownerTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_ownerTypeMeta);
    }
    if (data.containsKey('owner_id')) {
      context.handle(
        _ownerIdMeta,
        ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    if (data.containsKey('land_id')) {
      context.handle(
        _landIdMeta,
        landId.isAcceptableOrUnknown(data['land_id']!, _landIdMeta),
      );
    }
    if (data.containsKey('file_name')) {
      context.handle(
        _fileNameMeta,
        fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fileNameMeta);
    }
    if (data.containsKey('taken_at')) {
      context.handle(
        _takenAtMeta,
        takenAt.isAcceptableOrUnknown(data['taken_at']!, _takenAtMeta),
      );
    } else if (isInserting) {
      context.missing(_takenAtMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    }
    if (data.containsKey('lng')) {
      context.handle(
        _lngMeta,
        lng.isAcceptableOrUnknown(data['lng']!, _lngMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Photo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Photo(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      ownerType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_type'],
      )!,
      ownerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_id'],
      )!,
      landId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}land_id'],
      ),
      fileName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_name'],
      )!,
      takenAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}taken_at'],
      )!,
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      ),
      lng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lng'],
      ),
    );
  }

  @override
  $PhotosTable createAlias(String alias) {
    return $PhotosTable(attachedDatabase, alias);
  }
}

class Photo extends DataClass implements Insertable<Photo> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  /// land | building | tree | person
  final String ownerType;
  final String ownerId;

  /// Land the photo belongs to (for the land's photo tab).
  final String? landId;

  /// File name inside the app's private photos folder.
  final String fileName;
  final DateTime takenAt;
  final double? lat;
  final double? lng;
  const Photo({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.ownerType,
    required this.ownerId,
    this.landId,
    required this.fileName,
    required this.takenAt,
    this.lat,
    this.lng,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['owner_type'] = Variable<String>(ownerType);
    map['owner_id'] = Variable<String>(ownerId);
    if (!nullToAbsent || landId != null) {
      map['land_id'] = Variable<String>(landId);
    }
    map['file_name'] = Variable<String>(fileName);
    map['taken_at'] = Variable<DateTime>(takenAt);
    if (!nullToAbsent || lat != null) {
      map['lat'] = Variable<double>(lat);
    }
    if (!nullToAbsent || lng != null) {
      map['lng'] = Variable<double>(lng);
    }
    return map;
  }

  PhotosCompanion toCompanion(bool nullToAbsent) {
    return PhotosCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      ownerType: Value(ownerType),
      ownerId: Value(ownerId),
      landId: landId == null && nullToAbsent
          ? const Value.absent()
          : Value(landId),
      fileName: Value(fileName),
      takenAt: Value(takenAt),
      lat: lat == null && nullToAbsent ? const Value.absent() : Value(lat),
      lng: lng == null && nullToAbsent ? const Value.absent() : Value(lng),
    );
  }

  factory Photo.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Photo(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      ownerType: serializer.fromJson<String>(json['ownerType']),
      ownerId: serializer.fromJson<String>(json['ownerId']),
      landId: serializer.fromJson<String?>(json['landId']),
      fileName: serializer.fromJson<String>(json['fileName']),
      takenAt: serializer.fromJson<DateTime>(json['takenAt']),
      lat: serializer.fromJson<double?>(json['lat']),
      lng: serializer.fromJson<double?>(json['lng']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'ownerType': serializer.toJson<String>(ownerType),
      'ownerId': serializer.toJson<String>(ownerId),
      'landId': serializer.toJson<String?>(landId),
      'fileName': serializer.toJson<String>(fileName),
      'takenAt': serializer.toJson<DateTime>(takenAt),
      'lat': serializer.toJson<double?>(lat),
      'lng': serializer.toJson<double?>(lng),
    };
  }

  Photo copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? ownerType,
    String? ownerId,
    Value<String?> landId = const Value.absent(),
    String? fileName,
    DateTime? takenAt,
    Value<double?> lat = const Value.absent(),
    Value<double?> lng = const Value.absent(),
  }) => Photo(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    ownerType: ownerType ?? this.ownerType,
    ownerId: ownerId ?? this.ownerId,
    landId: landId.present ? landId.value : this.landId,
    fileName: fileName ?? this.fileName,
    takenAt: takenAt ?? this.takenAt,
    lat: lat.present ? lat.value : this.lat,
    lng: lng.present ? lng.value : this.lng,
  );
  Photo copyWithCompanion(PhotosCompanion data) {
    return Photo(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      ownerType: data.ownerType.present ? data.ownerType.value : this.ownerType,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      landId: data.landId.present ? data.landId.value : this.landId,
      fileName: data.fileName.present ? data.fileName.value : this.fileName,
      takenAt: data.takenAt.present ? data.takenAt.value : this.takenAt,
      lat: data.lat.present ? data.lat.value : this.lat,
      lng: data.lng.present ? data.lng.value : this.lng,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Photo(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('ownerType: $ownerType, ')
          ..write('ownerId: $ownerId, ')
          ..write('landId: $landId, ')
          ..write('fileName: $fileName, ')
          ..write('takenAt: $takenAt, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    ownerType,
    ownerId,
    landId,
    fileName,
    takenAt,
    lat,
    lng,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Photo &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.ownerType == this.ownerType &&
          other.ownerId == this.ownerId &&
          other.landId == this.landId &&
          other.fileName == this.fileName &&
          other.takenAt == this.takenAt &&
          other.lat == this.lat &&
          other.lng == this.lng);
}

class PhotosCompanion extends UpdateCompanion<Photo> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> ownerType;
  final Value<String> ownerId;
  final Value<String?> landId;
  final Value<String> fileName;
  final Value<DateTime> takenAt;
  final Value<double?> lat;
  final Value<double?> lng;
  final Value<int> rowid;
  const PhotosCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.ownerType = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.landId = const Value.absent(),
    this.fileName = const Value.absent(),
    this.takenAt = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PhotosCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String ownerType,
    required String ownerId,
    this.landId = const Value.absent(),
    required String fileName,
    required DateTime takenAt,
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       ownerType = Value(ownerType),
       ownerId = Value(ownerId),
       fileName = Value(fileName),
       takenAt = Value(takenAt);
  static Insertable<Photo> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? ownerType,
    Expression<String>? ownerId,
    Expression<String>? landId,
    Expression<String>? fileName,
    Expression<DateTime>? takenAt,
    Expression<double>? lat,
    Expression<double>? lng,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (ownerType != null) 'owner_type': ownerType,
      if (ownerId != null) 'owner_id': ownerId,
      if (landId != null) 'land_id': landId,
      if (fileName != null) 'file_name': fileName,
      if (takenAt != null) 'taken_at': takenAt,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PhotosCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? ownerType,
    Value<String>? ownerId,
    Value<String?>? landId,
    Value<String>? fileName,
    Value<DateTime>? takenAt,
    Value<double?>? lat,
    Value<double?>? lng,
    Value<int>? rowid,
  }) {
    return PhotosCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      ownerType: ownerType ?? this.ownerType,
      ownerId: ownerId ?? this.ownerId,
      landId: landId ?? this.landId,
      fileName: fileName ?? this.fileName,
      takenAt: takenAt ?? this.takenAt,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (ownerType.present) {
      map['owner_type'] = Variable<String>(ownerType.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (landId.present) {
      map['land_id'] = Variable<String>(landId.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (takenAt.present) {
      map['taken_at'] = Variable<DateTime>(takenAt.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhotosCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('ownerType: $ownerType, ')
          ..write('ownerId: $ownerId, ')
          ..write('landId: $landId, ')
          ..write('fileName: $fileName, ')
          ..write('takenAt: $takenAt, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PickItemsTable extends PickItems
    with TableInfo<$PickItemsTable, PickItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PickItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _listNameMeta = const VerificationMeta(
    'listName',
  );
  @override
  late final GeneratedColumn<String> listName = GeneratedColumn<String>(
    'list_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    listName,
    code,
    label,
    active,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pick_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<PickItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('list_name')) {
      context.handle(
        _listNameMeta,
        listName.isAcceptableOrUnknown(data['list_name']!, _listNameMeta),
      );
    } else if (isInserting) {
      context.missing(_listNameMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PickItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PickItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      listName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}list_name'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
    );
  }

  @override
  $PickItemsTable createAlias(String alias) {
    return $PickItemsTable(attachedDatabase, alias);
  }
}

class PickItem extends DataClass implements Insertable<PickItem> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String listName;
  final String code;
  final String label;
  final bool active;
  const PickItem({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.listName,
    required this.code,
    required this.label,
    required this.active,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['list_name'] = Variable<String>(listName);
    map['code'] = Variable<String>(code);
    map['label'] = Variable<String>(label);
    map['active'] = Variable<bool>(active);
    return map;
  }

  PickItemsCompanion toCompanion(bool nullToAbsent) {
    return PickItemsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      listName: Value(listName),
      code: Value(code),
      label: Value(label),
      active: Value(active),
    );
  }

  factory PickItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PickItem(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      listName: serializer.fromJson<String>(json['listName']),
      code: serializer.fromJson<String>(json['code']),
      label: serializer.fromJson<String>(json['label']),
      active: serializer.fromJson<bool>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'listName': serializer.toJson<String>(listName),
      'code': serializer.toJson<String>(code),
      'label': serializer.toJson<String>(label),
      'active': serializer.toJson<bool>(active),
    };
  }

  PickItem copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? listName,
    String? code,
    String? label,
    bool? active,
  }) => PickItem(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    listName: listName ?? this.listName,
    code: code ?? this.code,
    label: label ?? this.label,
    active: active ?? this.active,
  );
  PickItem copyWithCompanion(PickItemsCompanion data) {
    return PickItem(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      listName: data.listName.present ? data.listName.value : this.listName,
      code: data.code.present ? data.code.value : this.code,
      label: data.label.present ? data.label.value : this.label,
      active: data.active.present ? data.active.value : this.active,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PickItem(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('listName: $listName, ')
          ..write('code: $code, ')
          ..write('label: $label, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    listName,
    code,
    label,
    active,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PickItem &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.listName == this.listName &&
          other.code == this.code &&
          other.label == this.label &&
          other.active == this.active);
}

class PickItemsCompanion extends UpdateCompanion<PickItem> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> listName;
  final Value<String> code;
  final Value<String> label;
  final Value<bool> active;
  final Value<int> rowid;
  const PickItemsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.listName = const Value.absent(),
    this.code = const Value.absent(),
    this.label = const Value.absent(),
    this.active = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PickItemsCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String listName,
    required String code,
    required String label,
    this.active = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       listName = Value(listName),
       code = Value(code),
       label = Value(label);
  static Insertable<PickItem> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? listName,
    Expression<String>? code,
    Expression<String>? label,
    Expression<bool>? active,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (listName != null) 'list_name': listName,
      if (code != null) 'code': code,
      if (label != null) 'label': label,
      if (active != null) 'active': active,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PickItemsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? listName,
    Value<String>? code,
    Value<String>? label,
    Value<bool>? active,
    Value<int>? rowid,
  }) {
    return PickItemsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      listName: listName ?? this.listName,
      code: code ?? this.code,
      label: label ?? this.label,
      active: active ?? this.active,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (listName.present) {
      map['list_name'] = Variable<String>(listName.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PickItemsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('listName: $listName, ')
          ..write('code: $code, ')
          ..write('label: $label, ')
          ..write('active: $active, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChangeLogsTable extends ChangeLogs
    with TableInfo<$ChangeLogsTable, ChangeLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChangeLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _seqMeta = const VerificationMeta('seq');
  @override
  late final GeneratedColumn<int> seq = GeneratedColumn<int>(
    'seq',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _entityMeta = const VerificationMeta('entity');
  @override
  late final GeneratedColumn<String> entity = GeneratedColumn<String>(
    'entity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordIdMeta = const VerificationMeta(
    'recordId',
  );
  @override
  late final GeneratedColumn<String> recordId = GeneratedColumn<String>(
    'record_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _landIdMeta = const VerificationMeta('landId');
  @override
  late final GeneratedColumn<String> landId = GeneratedColumn<String>(
    'land_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _changesMeta = const VerificationMeta(
    'changes',
  );
  @override
  late final GeneratedColumn<String> changes = GeneratedColumn<String>(
    'changes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _atMeta = const VerificationMeta('at');
  @override
  late final GeneratedColumn<DateTime> at = GeneratedColumn<DateTime>(
    'at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    seq,
    entity,
    recordId,
    landId,
    action,
    changes,
    at,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'change_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChangeLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('seq')) {
      context.handle(
        _seqMeta,
        seq.isAcceptableOrUnknown(data['seq']!, _seqMeta),
      );
    }
    if (data.containsKey('entity')) {
      context.handle(
        _entityMeta,
        entity.isAcceptableOrUnknown(data['entity']!, _entityMeta),
      );
    } else if (isInserting) {
      context.missing(_entityMeta);
    }
    if (data.containsKey('record_id')) {
      context.handle(
        _recordIdMeta,
        recordId.isAcceptableOrUnknown(data['record_id']!, _recordIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recordIdMeta);
    }
    if (data.containsKey('land_id')) {
      context.handle(
        _landIdMeta,
        landId.isAcceptableOrUnknown(data['land_id']!, _landIdMeta),
      );
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('changes')) {
      context.handle(
        _changesMeta,
        changes.isAcceptableOrUnknown(data['changes']!, _changesMeta),
      );
    } else if (isInserting) {
      context.missing(_changesMeta);
    }
    if (data.containsKey('at')) {
      context.handle(_atMeta, at.isAcceptableOrUnknown(data['at']!, _atMeta));
    } else if (isInserting) {
      context.missing(_atMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {seq};
  @override
  ChangeLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChangeLog(
      seq: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}seq'],
      )!,
      entity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity'],
      )!,
      recordId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}record_id'],
      )!,
      landId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}land_id'],
      ),
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      )!,
      changes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}changes'],
      )!,
      at: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}at'],
      )!,
    );
  }

  @override
  $ChangeLogsTable createAlias(String alias) {
    return $ChangeLogsTable(attachedDatabase, alias);
  }
}

class ChangeLog extends DataClass implements Insertable<ChangeLog> {
  final int seq;
  final String entity;
  final String recordId;

  /// Land the change belongs to, so a land's history tab is one query.
  final String? landId;

  /// create | update | delete
  final String action;

  /// JSON: {field: [old, new]}
  final String changes;
  final DateTime at;
  const ChangeLog({
    required this.seq,
    required this.entity,
    required this.recordId,
    this.landId,
    required this.action,
    required this.changes,
    required this.at,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['seq'] = Variable<int>(seq);
    map['entity'] = Variable<String>(entity);
    map['record_id'] = Variable<String>(recordId);
    if (!nullToAbsent || landId != null) {
      map['land_id'] = Variable<String>(landId);
    }
    map['action'] = Variable<String>(action);
    map['changes'] = Variable<String>(changes);
    map['at'] = Variable<DateTime>(at);
    return map;
  }

  ChangeLogsCompanion toCompanion(bool nullToAbsent) {
    return ChangeLogsCompanion(
      seq: Value(seq),
      entity: Value(entity),
      recordId: Value(recordId),
      landId: landId == null && nullToAbsent
          ? const Value.absent()
          : Value(landId),
      action: Value(action),
      changes: Value(changes),
      at: Value(at),
    );
  }

  factory ChangeLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChangeLog(
      seq: serializer.fromJson<int>(json['seq']),
      entity: serializer.fromJson<String>(json['entity']),
      recordId: serializer.fromJson<String>(json['recordId']),
      landId: serializer.fromJson<String?>(json['landId']),
      action: serializer.fromJson<String>(json['action']),
      changes: serializer.fromJson<String>(json['changes']),
      at: serializer.fromJson<DateTime>(json['at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'seq': serializer.toJson<int>(seq),
      'entity': serializer.toJson<String>(entity),
      'recordId': serializer.toJson<String>(recordId),
      'landId': serializer.toJson<String?>(landId),
      'action': serializer.toJson<String>(action),
      'changes': serializer.toJson<String>(changes),
      'at': serializer.toJson<DateTime>(at),
    };
  }

  ChangeLog copyWith({
    int? seq,
    String? entity,
    String? recordId,
    Value<String?> landId = const Value.absent(),
    String? action,
    String? changes,
    DateTime? at,
  }) => ChangeLog(
    seq: seq ?? this.seq,
    entity: entity ?? this.entity,
    recordId: recordId ?? this.recordId,
    landId: landId.present ? landId.value : this.landId,
    action: action ?? this.action,
    changes: changes ?? this.changes,
    at: at ?? this.at,
  );
  ChangeLog copyWithCompanion(ChangeLogsCompanion data) {
    return ChangeLog(
      seq: data.seq.present ? data.seq.value : this.seq,
      entity: data.entity.present ? data.entity.value : this.entity,
      recordId: data.recordId.present ? data.recordId.value : this.recordId,
      landId: data.landId.present ? data.landId.value : this.landId,
      action: data.action.present ? data.action.value : this.action,
      changes: data.changes.present ? data.changes.value : this.changes,
      at: data.at.present ? data.at.value : this.at,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChangeLog(')
          ..write('seq: $seq, ')
          ..write('entity: $entity, ')
          ..write('recordId: $recordId, ')
          ..write('landId: $landId, ')
          ..write('action: $action, ')
          ..write('changes: $changes, ')
          ..write('at: $at')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(seq, entity, recordId, landId, action, changes, at);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChangeLog &&
          other.seq == this.seq &&
          other.entity == this.entity &&
          other.recordId == this.recordId &&
          other.landId == this.landId &&
          other.action == this.action &&
          other.changes == this.changes &&
          other.at == this.at);
}

class ChangeLogsCompanion extends UpdateCompanion<ChangeLog> {
  final Value<int> seq;
  final Value<String> entity;
  final Value<String> recordId;
  final Value<String?> landId;
  final Value<String> action;
  final Value<String> changes;
  final Value<DateTime> at;
  const ChangeLogsCompanion({
    this.seq = const Value.absent(),
    this.entity = const Value.absent(),
    this.recordId = const Value.absent(),
    this.landId = const Value.absent(),
    this.action = const Value.absent(),
    this.changes = const Value.absent(),
    this.at = const Value.absent(),
  });
  ChangeLogsCompanion.insert({
    this.seq = const Value.absent(),
    required String entity,
    required String recordId,
    this.landId = const Value.absent(),
    required String action,
    required String changes,
    required DateTime at,
  }) : entity = Value(entity),
       recordId = Value(recordId),
       action = Value(action),
       changes = Value(changes),
       at = Value(at);
  static Insertable<ChangeLog> custom({
    Expression<int>? seq,
    Expression<String>? entity,
    Expression<String>? recordId,
    Expression<String>? landId,
    Expression<String>? action,
    Expression<String>? changes,
    Expression<DateTime>? at,
  }) {
    return RawValuesInsertable({
      if (seq != null) 'seq': seq,
      if (entity != null) 'entity': entity,
      if (recordId != null) 'record_id': recordId,
      if (landId != null) 'land_id': landId,
      if (action != null) 'action': action,
      if (changes != null) 'changes': changes,
      if (at != null) 'at': at,
    });
  }

  ChangeLogsCompanion copyWith({
    Value<int>? seq,
    Value<String>? entity,
    Value<String>? recordId,
    Value<String?>? landId,
    Value<String>? action,
    Value<String>? changes,
    Value<DateTime>? at,
  }) {
    return ChangeLogsCompanion(
      seq: seq ?? this.seq,
      entity: entity ?? this.entity,
      recordId: recordId ?? this.recordId,
      landId: landId ?? this.landId,
      action: action ?? this.action,
      changes: changes ?? this.changes,
      at: at ?? this.at,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (seq.present) {
      map['seq'] = Variable<int>(seq.value);
    }
    if (entity.present) {
      map['entity'] = Variable<String>(entity.value);
    }
    if (recordId.present) {
      map['record_id'] = Variable<String>(recordId.value);
    }
    if (landId.present) {
      map['land_id'] = Variable<String>(landId.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (changes.present) {
      map['changes'] = Variable<String>(changes.value);
    }
    if (at.present) {
      map['at'] = Variable<DateTime>(at.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChangeLogsCompanion(')
          ..write('seq: $seq, ')
          ..write('entity: $entity, ')
          ..write('recordId: $recordId, ')
          ..write('landId: $landId, ')
          ..write('action: $action, ')
          ..write('changes: $changes, ')
          ..write('at: $at')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<Setting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  final String key;
  final String value;
  const Setting({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(key: Value(key), value: Value(value));
  }

  factory Setting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  Setting copyWith({String? key, String? value}) =>
      Setting(key: key ?? this.key, value: value ?? this.value);
  Setting copyWithCompanion(SettingsCompanion data) {
    return Setting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting && other.key == this.key && other.value == this.value);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const SettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettingsCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<Setting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return SettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $DivisionsTable divisions = $DivisionsTable(this);
  late final $VillagesTable villages = $VillagesTable(this);
  late final $HouseGroupsTable houseGroups = $HouseGroupsTable(this);
  late final $LandsTable lands = $LandsTable(this);
  late final $BuildingsTable buildings = $BuildingsTable(this);
  late final $FamiliesTable families = $FamiliesTable(this);
  late final $PersonsTable persons = $PersonsTable(this);
  late final $LandPartiesTable landParties = $LandPartiesTable(this);
  late final $ResidenceEventsTable residenceEvents = $ResidenceEventsTable(
    this,
  );
  late final $TreeCountsTable treeCounts = $TreeCountsTable(this);
  late final $TreesTable trees = $TreesTable(this);
  late final $CropsTable crops = $CropsTable(this);
  late final $AnimalsTable animals = $AnimalsTable(this);
  late final $PhotosTable photos = $PhotosTable(this);
  late final $PickItemsTable pickItems = $PickItemsTable(this);
  late final $ChangeLogsTable changeLogs = $ChangeLogsTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    divisions,
    villages,
    houseGroups,
    lands,
    buildings,
    families,
    persons,
    landParties,
    residenceEvents,
    treeCounts,
    trees,
    crops,
    animals,
    photos,
    pickItems,
    changeLogs,
    settings,
  ];
}

typedef $$DivisionsTableCreateCompanionBuilder =
    DivisionsCompanion Function({
      required String id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      required String code,
      required String name,
      Value<String> dsDivision,
      Value<String> district,
      Value<String> officerName,
      Value<int> rowid,
    });
typedef $$DivisionsTableUpdateCompanionBuilder =
    DivisionsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> code,
      Value<String> name,
      Value<String> dsDivision,
      Value<String> district,
      Value<String> officerName,
      Value<int> rowid,
    });

class $$DivisionsTableFilterComposer
    extends Composer<_$AppDb, $DivisionsTable> {
  $$DivisionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dsDivision => $composableBuilder(
    column: $table.dsDivision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get district => $composableBuilder(
    column: $table.district,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get officerName => $composableBuilder(
    column: $table.officerName,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DivisionsTableOrderingComposer
    extends Composer<_$AppDb, $DivisionsTable> {
  $$DivisionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dsDivision => $composableBuilder(
    column: $table.dsDivision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get district => $composableBuilder(
    column: $table.district,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get officerName => $composableBuilder(
    column: $table.officerName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DivisionsTableAnnotationComposer
    extends Composer<_$AppDb, $DivisionsTable> {
  $$DivisionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get dsDivision => $composableBuilder(
    column: $table.dsDivision,
    builder: (column) => column,
  );

  GeneratedColumn<String> get district =>
      $composableBuilder(column: $table.district, builder: (column) => column);

  GeneratedColumn<String> get officerName => $composableBuilder(
    column: $table.officerName,
    builder: (column) => column,
  );
}

class $$DivisionsTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $DivisionsTable,
          Division,
          $$DivisionsTableFilterComposer,
          $$DivisionsTableOrderingComposer,
          $$DivisionsTableAnnotationComposer,
          $$DivisionsTableCreateCompanionBuilder,
          $$DivisionsTableUpdateCompanionBuilder,
          (Division, BaseReferences<_$AppDb, $DivisionsTable, Division>),
          Division,
          PrefetchHooks Function()
        > {
  $$DivisionsTableTableManager(_$AppDb db, $DivisionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DivisionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DivisionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DivisionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> dsDivision = const Value.absent(),
                Value<String> district = const Value.absent(),
                Value<String> officerName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DivisionsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                code: code,
                name: name,
                dsDivision: dsDivision,
                district: district,
                officerName: officerName,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String code,
                required String name,
                Value<String> dsDivision = const Value.absent(),
                Value<String> district = const Value.absent(),
                Value<String> officerName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DivisionsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                code: code,
                name: name,
                dsDivision: dsDivision,
                district: district,
                officerName: officerName,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DivisionsTable, Division>(table),
                  BaseReferences<_$AppDb, $DivisionsTable, Division>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DivisionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $DivisionsTable,
      Division,
      $$DivisionsTableFilterComposer,
      $$DivisionsTableOrderingComposer,
      $$DivisionsTableAnnotationComposer,
      $$DivisionsTableCreateCompanionBuilder,
      $$DivisionsTableUpdateCompanionBuilder,
      (Division, BaseReferences<_$AppDb, $DivisionsTable, Division>),
      Division,
      PrefetchHooks Function()
    >;
typedef $$VillagesTableCreateCompanionBuilder =
    VillagesCompanion Function({
      required String id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      required String name,
      Value<String?> supervisingOfficer,
      Value<int> sortOrder,
      Value<int> rowid,
    });
typedef $$VillagesTableUpdateCompanionBuilder =
    VillagesCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> name,
      Value<String?> supervisingOfficer,
      Value<int> sortOrder,
      Value<int> rowid,
    });

final class $$VillagesTableReferences
    extends BaseReferences<_$AppDb, $VillagesTable, Village> {
  $$VillagesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$HouseGroupsTable, List<HouseGroup>>
  _houseGroupsRefsTable(_$AppDb db) => MultiTypedResultKey.fromTable(
    db.houseGroups,
    aliasName: 'villages__id__house_groups__village_id',
  );

  $$HouseGroupsTableProcessedTableManager get houseGroupsRefs {
    final manager = $$HouseGroupsTableTableManager(
      $_db,
      $_db.houseGroups,
    ).filter((f) => f.villageId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_houseGroupsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$VillagesTableFilterComposer extends Composer<_$AppDb, $VillagesTable> {
  $$VillagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get supervisingOfficer => $composableBuilder(
    column: $table.supervisingOfficer,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> houseGroupsRefs(
    Expression<bool> Function($$HouseGroupsTableFilterComposer f) f,
  ) {
    final $$HouseGroupsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.houseGroups,
      getReferencedColumn: (t) => t.villageId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HouseGroupsTableFilterComposer(
            $db: $db,
            $table: $db.houseGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VillagesTableOrderingComposer
    extends Composer<_$AppDb, $VillagesTable> {
  $$VillagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get supervisingOfficer => $composableBuilder(
    column: $table.supervisingOfficer,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VillagesTableAnnotationComposer
    extends Composer<_$AppDb, $VillagesTable> {
  $$VillagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get supervisingOfficer => $composableBuilder(
    column: $table.supervisingOfficer,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  Expression<T> houseGroupsRefs<T extends Object>(
    Expression<T> Function($$HouseGroupsTableAnnotationComposer a) f,
  ) {
    final $$HouseGroupsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.houseGroups,
      getReferencedColumn: (t) => t.villageId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HouseGroupsTableAnnotationComposer(
            $db: $db,
            $table: $db.houseGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VillagesTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $VillagesTable,
          Village,
          $$VillagesTableFilterComposer,
          $$VillagesTableOrderingComposer,
          $$VillagesTableAnnotationComposer,
          $$VillagesTableCreateCompanionBuilder,
          $$VillagesTableUpdateCompanionBuilder,
          (Village, $$VillagesTableReferences),
          Village,
          PrefetchHooks Function({bool houseGroupsRefs})
        > {
  $$VillagesTableTableManager(_$AppDb db, $VillagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VillagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VillagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VillagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> supervisingOfficer = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VillagesCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                name: name,
                supervisingOfficer: supervisingOfficer,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String name,
                Value<String?> supervisingOfficer = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VillagesCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                name: name,
                supervisingOfficer: supervisingOfficer,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$VillagesTable, Village>(table),
                  $$VillagesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({houseGroupsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (houseGroupsRefs) db.houseGroups],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (houseGroupsRefs)
                    await $_getPrefetchedDataByColumns<
                      Village,
                      $VillagesTable,
                      HouseGroup,
                      $HouseGroupsTable
                    >(
                      currentTable: table,
                      referencedTable: $$VillagesTableReferences
                          ._houseGroupsRefsTable(db),
                      managerFromTypedResult: (p0) => $$VillagesTableReferences(
                        db,
                        table,
                        p0,
                      ).houseGroupsRefs,
                      currentColumn: 'id',
                      referencedColumn: 'village_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$VillagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $VillagesTable,
      Village,
      $$VillagesTableFilterComposer,
      $$VillagesTableOrderingComposer,
      $$VillagesTableAnnotationComposer,
      $$VillagesTableCreateCompanionBuilder,
      $$VillagesTableUpdateCompanionBuilder,
      (Village, $$VillagesTableReferences),
      Village,
      PrefetchHooks Function({bool houseGroupsRefs})
    >;
typedef $$HouseGroupsTableCreateCompanionBuilder =
    HouseGroupsCompanion Function({
      required String id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      required String villageId,
      required String code,
      Value<String?> leaderName,
      Value<String?> leaderPhone,
      Value<int?> expectedLands,
      Value<int> rowid,
    });
typedef $$HouseGroupsTableUpdateCompanionBuilder =
    HouseGroupsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> villageId,
      Value<String> code,
      Value<String?> leaderName,
      Value<String?> leaderPhone,
      Value<int?> expectedLands,
      Value<int> rowid,
    });

final class $$HouseGroupsTableReferences
    extends BaseReferences<_$AppDb, $HouseGroupsTable, HouseGroup> {
  $$HouseGroupsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $VillagesTable _villageIdTable(_$AppDb db) =>
      db.villages.createAlias('house_groups__village_id__villages__id');

  $$VillagesTableProcessedTableManager get villageId {
    final $_column = $_itemColumn<String>('village_id')!;

    final manager = $$VillagesTableTableManager(
      $_db,
      $_db.villages,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_villageIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$LandsTable, List<Land>> _landsRefsTable(
    _$AppDb db,
  ) => MultiTypedResultKey.fromTable(
    db.lands,
    aliasName: 'house_groups__id__lands__house_group_id',
  );

  $$LandsTableProcessedTableManager get landsRefs {
    final manager = $$LandsTableTableManager(
      $_db,
      $_db.lands,
    ).filter((f) => f.houseGroupId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_landsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$HouseGroupsTableFilterComposer
    extends Composer<_$AppDb, $HouseGroupsTable> {
  $$HouseGroupsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get leaderName => $composableBuilder(
    column: $table.leaderName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get leaderPhone => $composableBuilder(
    column: $table.leaderPhone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get expectedLands => $composableBuilder(
    column: $table.expectedLands,
    builder: (column) => ColumnFilters(column),
  );

  $$VillagesTableFilterComposer get villageId {
    final $$VillagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.villageId,
      referencedTable: $db.villages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VillagesTableFilterComposer(
            $db: $db,
            $table: $db.villages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> landsRefs(
    Expression<bool> Function($$LandsTableFilterComposer f) f,
  ) {
    final $$LandsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lands,
      getReferencedColumn: (t) => t.houseGroupId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandsTableFilterComposer(
            $db: $db,
            $table: $db.lands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$HouseGroupsTableOrderingComposer
    extends Composer<_$AppDb, $HouseGroupsTable> {
  $$HouseGroupsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get leaderName => $composableBuilder(
    column: $table.leaderName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get leaderPhone => $composableBuilder(
    column: $table.leaderPhone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get expectedLands => $composableBuilder(
    column: $table.expectedLands,
    builder: (column) => ColumnOrderings(column),
  );

  $$VillagesTableOrderingComposer get villageId {
    final $$VillagesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.villageId,
      referencedTable: $db.villages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VillagesTableOrderingComposer(
            $db: $db,
            $table: $db.villages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HouseGroupsTableAnnotationComposer
    extends Composer<_$AppDb, $HouseGroupsTable> {
  $$HouseGroupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get leaderName => $composableBuilder(
    column: $table.leaderName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get leaderPhone => $composableBuilder(
    column: $table.leaderPhone,
    builder: (column) => column,
  );

  GeneratedColumn<int> get expectedLands => $composableBuilder(
    column: $table.expectedLands,
    builder: (column) => column,
  );

  $$VillagesTableAnnotationComposer get villageId {
    final $$VillagesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.villageId,
      referencedTable: $db.villages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VillagesTableAnnotationComposer(
            $db: $db,
            $table: $db.villages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> landsRefs<T extends Object>(
    Expression<T> Function($$LandsTableAnnotationComposer a) f,
  ) {
    final $$LandsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lands,
      getReferencedColumn: (t) => t.houseGroupId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandsTableAnnotationComposer(
            $db: $db,
            $table: $db.lands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$HouseGroupsTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $HouseGroupsTable,
          HouseGroup,
          $$HouseGroupsTableFilterComposer,
          $$HouseGroupsTableOrderingComposer,
          $$HouseGroupsTableAnnotationComposer,
          $$HouseGroupsTableCreateCompanionBuilder,
          $$HouseGroupsTableUpdateCompanionBuilder,
          (HouseGroup, $$HouseGroupsTableReferences),
          HouseGroup,
          PrefetchHooks Function({bool villageId, bool landsRefs})
        > {
  $$HouseGroupsTableTableManager(_$AppDb db, $HouseGroupsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HouseGroupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HouseGroupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HouseGroupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> villageId = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String?> leaderName = const Value.absent(),
                Value<String?> leaderPhone = const Value.absent(),
                Value<int?> expectedLands = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HouseGroupsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                villageId: villageId,
                code: code,
                leaderName: leaderName,
                leaderPhone: leaderPhone,
                expectedLands: expectedLands,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String villageId,
                required String code,
                Value<String?> leaderName = const Value.absent(),
                Value<String?> leaderPhone = const Value.absent(),
                Value<int?> expectedLands = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HouseGroupsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                villageId: villageId,
                code: code,
                leaderName: leaderName,
                leaderPhone: leaderPhone,
                expectedLands: expectedLands,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$HouseGroupsTable, HouseGroup>(table),
                  $$HouseGroupsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({villageId = false, landsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (landsRefs) db.lands],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (villageId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.villageId,
                                referencedTable: $$HouseGroupsTableReferences
                                    ._villageIdTable(db),
                                referencedColumn: $$HouseGroupsTableReferences
                                    ._villageIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (landsRefs)
                    await $_getPrefetchedDataByColumns<
                      HouseGroup,
                      $HouseGroupsTable,
                      Land,
                      $LandsTable
                    >(
                      currentTable: table,
                      referencedTable: $$HouseGroupsTableReferences
                          ._landsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$HouseGroupsTableReferences(db, table, p0).landsRefs,
                      currentColumn: 'id',
                      referencedColumn: 'house_group_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$HouseGroupsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $HouseGroupsTable,
      HouseGroup,
      $$HouseGroupsTableFilterComposer,
      $$HouseGroupsTableOrderingComposer,
      $$HouseGroupsTableAnnotationComposer,
      $$HouseGroupsTableCreateCompanionBuilder,
      $$HouseGroupsTableUpdateCompanionBuilder,
      (HouseGroup, $$HouseGroupsTableReferences),
      HouseGroup,
      PrefetchHooks Function({bool villageId, bool landsRefs})
    >;
typedef $$LandsTableCreateCompanionBuilder =
    LandsCompanion Function({
      required String id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      required String houseGroupId,
      required String name,
      Value<String?> addressText,
      Value<double?> lat,
      Value<double?> lng,
      Value<double?> gpsAccuracy,
      Value<double?> extentPerches,
      Value<String?> extentSource,
      Value<String?> ownershipType,
      Value<String?> deedNo,
      Value<String?> planNo,
      Value<String?> lotNo,
      Value<String?> schemeName,
      Value<String?> boundaryNorth,
      Value<String?> boundaryEast,
      Value<String?> boundarySouth,
      Value<String?> boundaryWest,
      Value<String?> landUse,
      Value<String?> subdivisionAllowed,
      Value<bool> hasDispute,
      Value<String?> disputeNote,
      Value<String?> notes,
      Value<bool> noBuildings,
      Value<bool> noTrees,
      Value<bool> noAnimals,
      Value<String> status,
      Value<String?> infoSource,
      Value<DateTime?> verifiedAt,
      Value<int> rowid,
    });
typedef $$LandsTableUpdateCompanionBuilder =
    LandsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> houseGroupId,
      Value<String> name,
      Value<String?> addressText,
      Value<double?> lat,
      Value<double?> lng,
      Value<double?> gpsAccuracy,
      Value<double?> extentPerches,
      Value<String?> extentSource,
      Value<String?> ownershipType,
      Value<String?> deedNo,
      Value<String?> planNo,
      Value<String?> lotNo,
      Value<String?> schemeName,
      Value<String?> boundaryNorth,
      Value<String?> boundaryEast,
      Value<String?> boundarySouth,
      Value<String?> boundaryWest,
      Value<String?> landUse,
      Value<String?> subdivisionAllowed,
      Value<bool> hasDispute,
      Value<String?> disputeNote,
      Value<String?> notes,
      Value<bool> noBuildings,
      Value<bool> noTrees,
      Value<bool> noAnimals,
      Value<String> status,
      Value<String?> infoSource,
      Value<DateTime?> verifiedAt,
      Value<int> rowid,
    });

final class $$LandsTableReferences
    extends BaseReferences<_$AppDb, $LandsTable, Land> {
  $$LandsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $HouseGroupsTable _houseGroupIdTable(_$AppDb db) =>
      db.houseGroups.createAlias('lands__house_group_id__house_groups__id');

  $$HouseGroupsTableProcessedTableManager get houseGroupId {
    final $_column = $_itemColumn<String>('house_group_id')!;

    final manager = $$HouseGroupsTableTableManager(
      $_db,
      $_db.houseGroups,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_houseGroupIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$BuildingsTable, List<Building>>
  _buildingsRefsTable(_$AppDb db) => MultiTypedResultKey.fromTable(
    db.buildings,
    aliasName: 'lands__id__buildings__land_id',
  );

  $$BuildingsTableProcessedTableManager get buildingsRefs {
    final manager = $$BuildingsTableTableManager(
      $_db,
      $_db.buildings,
    ).filter((f) => f.landId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_buildingsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LandPartiesTable, List<LandParty>>
  _landPartiesRefsTable(_$AppDb db) => MultiTypedResultKey.fromTable(
    db.landParties,
    aliasName: 'lands__id__land_parties__land_id',
  );

  $$LandPartiesTableProcessedTableManager get landPartiesRefs {
    final manager = $$LandPartiesTableTableManager(
      $_db,
      $_db.landParties,
    ).filter((f) => f.landId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_landPartiesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TreeCountsTable, List<TreeCount>>
  _treeCountsRefsTable(_$AppDb db) => MultiTypedResultKey.fromTable(
    db.treeCounts,
    aliasName: 'lands__id__tree_counts__land_id',
  );

  $$TreeCountsTableProcessedTableManager get treeCountsRefs {
    final manager = $$TreeCountsTableTableManager(
      $_db,
      $_db.treeCounts,
    ).filter((f) => f.landId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_treeCountsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TreesTable, List<Tree>> _treesRefsTable(
    _$AppDb db,
  ) => MultiTypedResultKey.fromTable(
    db.trees,
    aliasName: 'lands__id__trees__land_id',
  );

  $$TreesTableProcessedTableManager get treesRefs {
    final manager = $$TreesTableTableManager(
      $_db,
      $_db.trees,
    ).filter((f) => f.landId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_treesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CropsTable, List<Crop>> _cropsRefsTable(
    _$AppDb db,
  ) => MultiTypedResultKey.fromTable(
    db.crops,
    aliasName: 'lands__id__crops__land_id',
  );

  $$CropsTableProcessedTableManager get cropsRefs {
    final manager = $$CropsTableTableManager(
      $_db,
      $_db.crops,
    ).filter((f) => f.landId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_cropsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AnimalsTable, List<Animal>> _animalsRefsTable(
    _$AppDb db,
  ) => MultiTypedResultKey.fromTable(
    db.animals,
    aliasName: 'lands__id__animals__land_id',
  );

  $$AnimalsTableProcessedTableManager get animalsRefs {
    final manager = $$AnimalsTableTableManager(
      $_db,
      $_db.animals,
    ).filter((f) => f.landId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_animalsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LandsTableFilterComposer extends Composer<_$AppDb, $LandsTable> {
  $$LandsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get addressText => $composableBuilder(
    column: $table.addressText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get gpsAccuracy => $composableBuilder(
    column: $table.gpsAccuracy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get extentPerches => $composableBuilder(
    column: $table.extentPerches,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get extentSource => $composableBuilder(
    column: $table.extentSource,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownershipType => $composableBuilder(
    column: $table.ownershipType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deedNo => $composableBuilder(
    column: $table.deedNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get planNo => $composableBuilder(
    column: $table.planNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lotNo => $composableBuilder(
    column: $table.lotNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get schemeName => $composableBuilder(
    column: $table.schemeName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get boundaryNorth => $composableBuilder(
    column: $table.boundaryNorth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get boundaryEast => $composableBuilder(
    column: $table.boundaryEast,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get boundarySouth => $composableBuilder(
    column: $table.boundarySouth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get boundaryWest => $composableBuilder(
    column: $table.boundaryWest,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get landUse => $composableBuilder(
    column: $table.landUse,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subdivisionAllowed => $composableBuilder(
    column: $table.subdivisionAllowed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasDispute => $composableBuilder(
    column: $table.hasDispute,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get disputeNote => $composableBuilder(
    column: $table.disputeNote,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get noBuildings => $composableBuilder(
    column: $table.noBuildings,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get noTrees => $composableBuilder(
    column: $table.noTrees,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get noAnimals => $composableBuilder(
    column: $table.noAnimals,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get infoSource => $composableBuilder(
    column: $table.infoSource,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get verifiedAt => $composableBuilder(
    column: $table.verifiedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$HouseGroupsTableFilterComposer get houseGroupId {
    final $$HouseGroupsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.houseGroupId,
      referencedTable: $db.houseGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HouseGroupsTableFilterComposer(
            $db: $db,
            $table: $db.houseGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> buildingsRefs(
    Expression<bool> Function($$BuildingsTableFilterComposer f) f,
  ) {
    final $$BuildingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.buildings,
      getReferencedColumn: (t) => t.landId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BuildingsTableFilterComposer(
            $db: $db,
            $table: $db.buildings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> landPartiesRefs(
    Expression<bool> Function($$LandPartiesTableFilterComposer f) f,
  ) {
    final $$LandPartiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.landParties,
      getReferencedColumn: (t) => t.landId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandPartiesTableFilterComposer(
            $db: $db,
            $table: $db.landParties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> treeCountsRefs(
    Expression<bool> Function($$TreeCountsTableFilterComposer f) f,
  ) {
    final $$TreeCountsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.treeCounts,
      getReferencedColumn: (t) => t.landId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TreeCountsTableFilterComposer(
            $db: $db,
            $table: $db.treeCounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> treesRefs(
    Expression<bool> Function($$TreesTableFilterComposer f) f,
  ) {
    final $$TreesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.trees,
      getReferencedColumn: (t) => t.landId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TreesTableFilterComposer(
            $db: $db,
            $table: $db.trees,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> cropsRefs(
    Expression<bool> Function($$CropsTableFilterComposer f) f,
  ) {
    final $$CropsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.crops,
      getReferencedColumn: (t) => t.landId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CropsTableFilterComposer(
            $db: $db,
            $table: $db.crops,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> animalsRefs(
    Expression<bool> Function($$AnimalsTableFilterComposer f) f,
  ) {
    final $$AnimalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.landId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableFilterComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LandsTableOrderingComposer extends Composer<_$AppDb, $LandsTable> {
  $$LandsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get addressText => $composableBuilder(
    column: $table.addressText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get gpsAccuracy => $composableBuilder(
    column: $table.gpsAccuracy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get extentPerches => $composableBuilder(
    column: $table.extentPerches,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get extentSource => $composableBuilder(
    column: $table.extentSource,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownershipType => $composableBuilder(
    column: $table.ownershipType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deedNo => $composableBuilder(
    column: $table.deedNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get planNo => $composableBuilder(
    column: $table.planNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lotNo => $composableBuilder(
    column: $table.lotNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get schemeName => $composableBuilder(
    column: $table.schemeName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get boundaryNorth => $composableBuilder(
    column: $table.boundaryNorth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get boundaryEast => $composableBuilder(
    column: $table.boundaryEast,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get boundarySouth => $composableBuilder(
    column: $table.boundarySouth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get boundaryWest => $composableBuilder(
    column: $table.boundaryWest,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get landUse => $composableBuilder(
    column: $table.landUse,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subdivisionAllowed => $composableBuilder(
    column: $table.subdivisionAllowed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasDispute => $composableBuilder(
    column: $table.hasDispute,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get disputeNote => $composableBuilder(
    column: $table.disputeNote,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get noBuildings => $composableBuilder(
    column: $table.noBuildings,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get noTrees => $composableBuilder(
    column: $table.noTrees,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get noAnimals => $composableBuilder(
    column: $table.noAnimals,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get infoSource => $composableBuilder(
    column: $table.infoSource,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get verifiedAt => $composableBuilder(
    column: $table.verifiedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$HouseGroupsTableOrderingComposer get houseGroupId {
    final $$HouseGroupsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.houseGroupId,
      referencedTable: $db.houseGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HouseGroupsTableOrderingComposer(
            $db: $db,
            $table: $db.houseGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LandsTableAnnotationComposer extends Composer<_$AppDb, $LandsTable> {
  $$LandsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get addressText => $composableBuilder(
    column: $table.addressText,
    builder: (column) => column,
  );

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lng =>
      $composableBuilder(column: $table.lng, builder: (column) => column);

  GeneratedColumn<double> get gpsAccuracy => $composableBuilder(
    column: $table.gpsAccuracy,
    builder: (column) => column,
  );

  GeneratedColumn<double> get extentPerches => $composableBuilder(
    column: $table.extentPerches,
    builder: (column) => column,
  );

  GeneratedColumn<String> get extentSource => $composableBuilder(
    column: $table.extentSource,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ownershipType => $composableBuilder(
    column: $table.ownershipType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deedNo =>
      $composableBuilder(column: $table.deedNo, builder: (column) => column);

  GeneratedColumn<String> get planNo =>
      $composableBuilder(column: $table.planNo, builder: (column) => column);

  GeneratedColumn<String> get lotNo =>
      $composableBuilder(column: $table.lotNo, builder: (column) => column);

  GeneratedColumn<String> get schemeName => $composableBuilder(
    column: $table.schemeName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get boundaryNorth => $composableBuilder(
    column: $table.boundaryNorth,
    builder: (column) => column,
  );

  GeneratedColumn<String> get boundaryEast => $composableBuilder(
    column: $table.boundaryEast,
    builder: (column) => column,
  );

  GeneratedColumn<String> get boundarySouth => $composableBuilder(
    column: $table.boundarySouth,
    builder: (column) => column,
  );

  GeneratedColumn<String> get boundaryWest => $composableBuilder(
    column: $table.boundaryWest,
    builder: (column) => column,
  );

  GeneratedColumn<String> get landUse =>
      $composableBuilder(column: $table.landUse, builder: (column) => column);

  GeneratedColumn<String> get subdivisionAllowed => $composableBuilder(
    column: $table.subdivisionAllowed,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get hasDispute => $composableBuilder(
    column: $table.hasDispute,
    builder: (column) => column,
  );

  GeneratedColumn<String> get disputeNote => $composableBuilder(
    column: $table.disputeNote,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get noBuildings => $composableBuilder(
    column: $table.noBuildings,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get noTrees =>
      $composableBuilder(column: $table.noTrees, builder: (column) => column);

  GeneratedColumn<bool> get noAnimals =>
      $composableBuilder(column: $table.noAnimals, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get infoSource => $composableBuilder(
    column: $table.infoSource,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get verifiedAt => $composableBuilder(
    column: $table.verifiedAt,
    builder: (column) => column,
  );

  $$HouseGroupsTableAnnotationComposer get houseGroupId {
    final $$HouseGroupsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.houseGroupId,
      referencedTable: $db.houseGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HouseGroupsTableAnnotationComposer(
            $db: $db,
            $table: $db.houseGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> buildingsRefs<T extends Object>(
    Expression<T> Function($$BuildingsTableAnnotationComposer a) f,
  ) {
    final $$BuildingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.buildings,
      getReferencedColumn: (t) => t.landId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BuildingsTableAnnotationComposer(
            $db: $db,
            $table: $db.buildings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> landPartiesRefs<T extends Object>(
    Expression<T> Function($$LandPartiesTableAnnotationComposer a) f,
  ) {
    final $$LandPartiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.landParties,
      getReferencedColumn: (t) => t.landId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandPartiesTableAnnotationComposer(
            $db: $db,
            $table: $db.landParties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> treeCountsRefs<T extends Object>(
    Expression<T> Function($$TreeCountsTableAnnotationComposer a) f,
  ) {
    final $$TreeCountsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.treeCounts,
      getReferencedColumn: (t) => t.landId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TreeCountsTableAnnotationComposer(
            $db: $db,
            $table: $db.treeCounts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> treesRefs<T extends Object>(
    Expression<T> Function($$TreesTableAnnotationComposer a) f,
  ) {
    final $$TreesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.trees,
      getReferencedColumn: (t) => t.landId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TreesTableAnnotationComposer(
            $db: $db,
            $table: $db.trees,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> cropsRefs<T extends Object>(
    Expression<T> Function($$CropsTableAnnotationComposer a) f,
  ) {
    final $$CropsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.crops,
      getReferencedColumn: (t) => t.landId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CropsTableAnnotationComposer(
            $db: $db,
            $table: $db.crops,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> animalsRefs<T extends Object>(
    Expression<T> Function($$AnimalsTableAnnotationComposer a) f,
  ) {
    final $$AnimalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.animals,
      getReferencedColumn: (t) => t.landId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnimalsTableAnnotationComposer(
            $db: $db,
            $table: $db.animals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LandsTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $LandsTable,
          Land,
          $$LandsTableFilterComposer,
          $$LandsTableOrderingComposer,
          $$LandsTableAnnotationComposer,
          $$LandsTableCreateCompanionBuilder,
          $$LandsTableUpdateCompanionBuilder,
          (Land, $$LandsTableReferences),
          Land,
          PrefetchHooks Function({
            bool houseGroupId,
            bool buildingsRefs,
            bool landPartiesRefs,
            bool treeCountsRefs,
            bool treesRefs,
            bool cropsRefs,
            bool animalsRefs,
          })
        > {
  $$LandsTableTableManager(_$AppDb db, $LandsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LandsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LandsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LandsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> houseGroupId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> addressText = const Value.absent(),
                Value<double?> lat = const Value.absent(),
                Value<double?> lng = const Value.absent(),
                Value<double?> gpsAccuracy = const Value.absent(),
                Value<double?> extentPerches = const Value.absent(),
                Value<String?> extentSource = const Value.absent(),
                Value<String?> ownershipType = const Value.absent(),
                Value<String?> deedNo = const Value.absent(),
                Value<String?> planNo = const Value.absent(),
                Value<String?> lotNo = const Value.absent(),
                Value<String?> schemeName = const Value.absent(),
                Value<String?> boundaryNorth = const Value.absent(),
                Value<String?> boundaryEast = const Value.absent(),
                Value<String?> boundarySouth = const Value.absent(),
                Value<String?> boundaryWest = const Value.absent(),
                Value<String?> landUse = const Value.absent(),
                Value<String?> subdivisionAllowed = const Value.absent(),
                Value<bool> hasDispute = const Value.absent(),
                Value<String?> disputeNote = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> noBuildings = const Value.absent(),
                Value<bool> noTrees = const Value.absent(),
                Value<bool> noAnimals = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> infoSource = const Value.absent(),
                Value<DateTime?> verifiedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LandsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                houseGroupId: houseGroupId,
                name: name,
                addressText: addressText,
                lat: lat,
                lng: lng,
                gpsAccuracy: gpsAccuracy,
                extentPerches: extentPerches,
                extentSource: extentSource,
                ownershipType: ownershipType,
                deedNo: deedNo,
                planNo: planNo,
                lotNo: lotNo,
                schemeName: schemeName,
                boundaryNorth: boundaryNorth,
                boundaryEast: boundaryEast,
                boundarySouth: boundarySouth,
                boundaryWest: boundaryWest,
                landUse: landUse,
                subdivisionAllowed: subdivisionAllowed,
                hasDispute: hasDispute,
                disputeNote: disputeNote,
                notes: notes,
                noBuildings: noBuildings,
                noTrees: noTrees,
                noAnimals: noAnimals,
                status: status,
                infoSource: infoSource,
                verifiedAt: verifiedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String houseGroupId,
                required String name,
                Value<String?> addressText = const Value.absent(),
                Value<double?> lat = const Value.absent(),
                Value<double?> lng = const Value.absent(),
                Value<double?> gpsAccuracy = const Value.absent(),
                Value<double?> extentPerches = const Value.absent(),
                Value<String?> extentSource = const Value.absent(),
                Value<String?> ownershipType = const Value.absent(),
                Value<String?> deedNo = const Value.absent(),
                Value<String?> planNo = const Value.absent(),
                Value<String?> lotNo = const Value.absent(),
                Value<String?> schemeName = const Value.absent(),
                Value<String?> boundaryNorth = const Value.absent(),
                Value<String?> boundaryEast = const Value.absent(),
                Value<String?> boundarySouth = const Value.absent(),
                Value<String?> boundaryWest = const Value.absent(),
                Value<String?> landUse = const Value.absent(),
                Value<String?> subdivisionAllowed = const Value.absent(),
                Value<bool> hasDispute = const Value.absent(),
                Value<String?> disputeNote = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> noBuildings = const Value.absent(),
                Value<bool> noTrees = const Value.absent(),
                Value<bool> noAnimals = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> infoSource = const Value.absent(),
                Value<DateTime?> verifiedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LandsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                houseGroupId: houseGroupId,
                name: name,
                addressText: addressText,
                lat: lat,
                lng: lng,
                gpsAccuracy: gpsAccuracy,
                extentPerches: extentPerches,
                extentSource: extentSource,
                ownershipType: ownershipType,
                deedNo: deedNo,
                planNo: planNo,
                lotNo: lotNo,
                schemeName: schemeName,
                boundaryNorth: boundaryNorth,
                boundaryEast: boundaryEast,
                boundarySouth: boundarySouth,
                boundaryWest: boundaryWest,
                landUse: landUse,
                subdivisionAllowed: subdivisionAllowed,
                hasDispute: hasDispute,
                disputeNote: disputeNote,
                notes: notes,
                noBuildings: noBuildings,
                noTrees: noTrees,
                noAnimals: noAnimals,
                status: status,
                infoSource: infoSource,
                verifiedAt: verifiedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$LandsTable, Land>(table),
                  $$LandsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                houseGroupId = false,
                buildingsRefs = false,
                landPartiesRefs = false,
                treeCountsRefs = false,
                treesRefs = false,
                cropsRefs = false,
                animalsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (buildingsRefs) db.buildings,
                    if (landPartiesRefs) db.landParties,
                    if (treeCountsRefs) db.treeCounts,
                    if (treesRefs) db.trees,
                    if (cropsRefs) db.crops,
                    if (animalsRefs) db.animals,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (houseGroupId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.houseGroupId,
                                    referencedTable: $$LandsTableReferences
                                        ._houseGroupIdTable(db),
                                    referencedColumn: $$LandsTableReferences
                                        ._houseGroupIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (buildingsRefs)
                        await $_getPrefetchedDataByColumns<
                          Land,
                          $LandsTable,
                          Building,
                          $BuildingsTable
                        >(
                          currentTable: table,
                          referencedTable: $$LandsTableReferences
                              ._buildingsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LandsTableReferences(
                                db,
                                table,
                                p0,
                              ).buildingsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'land_id',
                          typedResults: items,
                        ),
                      if (landPartiesRefs)
                        await $_getPrefetchedDataByColumns<
                          Land,
                          $LandsTable,
                          LandParty,
                          $LandPartiesTable
                        >(
                          currentTable: table,
                          referencedTable: $$LandsTableReferences
                              ._landPartiesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LandsTableReferences(
                                db,
                                table,
                                p0,
                              ).landPartiesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'land_id',
                          typedResults: items,
                        ),
                      if (treeCountsRefs)
                        await $_getPrefetchedDataByColumns<
                          Land,
                          $LandsTable,
                          TreeCount,
                          $TreeCountsTable
                        >(
                          currentTable: table,
                          referencedTable: $$LandsTableReferences
                              ._treeCountsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LandsTableReferences(
                                db,
                                table,
                                p0,
                              ).treeCountsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'land_id',
                          typedResults: items,
                        ),
                      if (treesRefs)
                        await $_getPrefetchedDataByColumns<
                          Land,
                          $LandsTable,
                          Tree,
                          $TreesTable
                        >(
                          currentTable: table,
                          referencedTable: $$LandsTableReferences
                              ._treesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LandsTableReferences(db, table, p0).treesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'land_id',
                          typedResults: items,
                        ),
                      if (cropsRefs)
                        await $_getPrefetchedDataByColumns<
                          Land,
                          $LandsTable,
                          Crop,
                          $CropsTable
                        >(
                          currentTable: table,
                          referencedTable: $$LandsTableReferences
                              ._cropsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LandsTableReferences(db, table, p0).cropsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'land_id',
                          typedResults: items,
                        ),
                      if (animalsRefs)
                        await $_getPrefetchedDataByColumns<
                          Land,
                          $LandsTable,
                          Animal,
                          $AnimalsTable
                        >(
                          currentTable: table,
                          referencedTable: $$LandsTableReferences
                              ._animalsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LandsTableReferences(db, table, p0).animalsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'land_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$LandsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $LandsTable,
      Land,
      $$LandsTableFilterComposer,
      $$LandsTableOrderingComposer,
      $$LandsTableAnnotationComposer,
      $$LandsTableCreateCompanionBuilder,
      $$LandsTableUpdateCompanionBuilder,
      (Land, $$LandsTableReferences),
      Land,
      PrefetchHooks Function({
        bool houseGroupId,
        bool buildingsRefs,
        bool landPartiesRefs,
        bool treeCountsRefs,
        bool treesRefs,
        bool cropsRefs,
        bool animalsRefs,
      })
    >;
typedef $$BuildingsTableCreateCompanionBuilder =
    BuildingsCompanion Function({
      required String id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      required String landId,
      required String type,
      Value<String?> buildingNo,
      Value<int?> floors,
      Value<double?> floorAreaSqft,
      Value<int?> rooms,
      Value<String?> wall,
      Value<String?> roof,
      Value<String?> floor,
      Value<String?> permanence,
      Value<String?> condition,
      Value<int?> yearBuilt,
      Value<String?> usage,
      Value<String?> electricity,
      Value<String?> waterSource,
      Value<String?> toilet,
      Value<String?> approval,
      Value<double?> lat,
      Value<double?> lng,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$BuildingsTableUpdateCompanionBuilder =
    BuildingsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> landId,
      Value<String> type,
      Value<String?> buildingNo,
      Value<int?> floors,
      Value<double?> floorAreaSqft,
      Value<int?> rooms,
      Value<String?> wall,
      Value<String?> roof,
      Value<String?> floor,
      Value<String?> permanence,
      Value<String?> condition,
      Value<int?> yearBuilt,
      Value<String?> usage,
      Value<String?> electricity,
      Value<String?> waterSource,
      Value<String?> toilet,
      Value<String?> approval,
      Value<double?> lat,
      Value<double?> lng,
      Value<String?> notes,
      Value<int> rowid,
    });

final class $$BuildingsTableReferences
    extends BaseReferences<_$AppDb, $BuildingsTable, Building> {
  $$BuildingsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LandsTable _landIdTable(_$AppDb db) =>
      db.lands.createAlias('buildings__land_id__lands__id');

  $$LandsTableProcessedTableManager get landId {
    final $_column = $_itemColumn<String>('land_id')!;

    final manager = $$LandsTableTableManager(
      $_db,
      $_db.lands,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_landIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$FamiliesTable, List<Family>> _familiesRefsTable(
    _$AppDb db,
  ) => MultiTypedResultKey.fromTable(
    db.families,
    aliasName: 'buildings__id__families__building_id',
  );

  $$FamiliesTableProcessedTableManager get familiesRefs {
    final manager = $$FamiliesTableTableManager(
      $_db,
      $_db.families,
    ).filter((f) => f.buildingId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_familiesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BuildingsTableFilterComposer
    extends Composer<_$AppDb, $BuildingsTable> {
  $$BuildingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get buildingNo => $composableBuilder(
    column: $table.buildingNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get floors => $composableBuilder(
    column: $table.floors,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get floorAreaSqft => $composableBuilder(
    column: $table.floorAreaSqft,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rooms => $composableBuilder(
    column: $table.rooms,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get wall => $composableBuilder(
    column: $table.wall,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get roof => $composableBuilder(
    column: $table.roof,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get floor => $composableBuilder(
    column: $table.floor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get permanence => $composableBuilder(
    column: $table.permanence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get yearBuilt => $composableBuilder(
    column: $table.yearBuilt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get usage => $composableBuilder(
    column: $table.usage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get electricity => $composableBuilder(
    column: $table.electricity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get waterSource => $composableBuilder(
    column: $table.waterSource,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get toilet => $composableBuilder(
    column: $table.toilet,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get approval => $composableBuilder(
    column: $table.approval,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$LandsTableFilterComposer get landId {
    final $$LandsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landId,
      referencedTable: $db.lands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandsTableFilterComposer(
            $db: $db,
            $table: $db.lands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> familiesRefs(
    Expression<bool> Function($$FamiliesTableFilterComposer f) f,
  ) {
    final $$FamiliesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.families,
      getReferencedColumn: (t) => t.buildingId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FamiliesTableFilterComposer(
            $db: $db,
            $table: $db.families,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BuildingsTableOrderingComposer
    extends Composer<_$AppDb, $BuildingsTable> {
  $$BuildingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get buildingNo => $composableBuilder(
    column: $table.buildingNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get floors => $composableBuilder(
    column: $table.floors,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get floorAreaSqft => $composableBuilder(
    column: $table.floorAreaSqft,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rooms => $composableBuilder(
    column: $table.rooms,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wall => $composableBuilder(
    column: $table.wall,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get roof => $composableBuilder(
    column: $table.roof,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get floor => $composableBuilder(
    column: $table.floor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get permanence => $composableBuilder(
    column: $table.permanence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get yearBuilt => $composableBuilder(
    column: $table.yearBuilt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get usage => $composableBuilder(
    column: $table.usage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get electricity => $composableBuilder(
    column: $table.electricity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get waterSource => $composableBuilder(
    column: $table.waterSource,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get toilet => $composableBuilder(
    column: $table.toilet,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get approval => $composableBuilder(
    column: $table.approval,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$LandsTableOrderingComposer get landId {
    final $$LandsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landId,
      referencedTable: $db.lands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandsTableOrderingComposer(
            $db: $db,
            $table: $db.lands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BuildingsTableAnnotationComposer
    extends Composer<_$AppDb, $BuildingsTable> {
  $$BuildingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get buildingNo => $composableBuilder(
    column: $table.buildingNo,
    builder: (column) => column,
  );

  GeneratedColumn<int> get floors =>
      $composableBuilder(column: $table.floors, builder: (column) => column);

  GeneratedColumn<double> get floorAreaSqft => $composableBuilder(
    column: $table.floorAreaSqft,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rooms =>
      $composableBuilder(column: $table.rooms, builder: (column) => column);

  GeneratedColumn<String> get wall =>
      $composableBuilder(column: $table.wall, builder: (column) => column);

  GeneratedColumn<String> get roof =>
      $composableBuilder(column: $table.roof, builder: (column) => column);

  GeneratedColumn<String> get floor =>
      $composableBuilder(column: $table.floor, builder: (column) => column);

  GeneratedColumn<String> get permanence => $composableBuilder(
    column: $table.permanence,
    builder: (column) => column,
  );

  GeneratedColumn<String> get condition =>
      $composableBuilder(column: $table.condition, builder: (column) => column);

  GeneratedColumn<int> get yearBuilt =>
      $composableBuilder(column: $table.yearBuilt, builder: (column) => column);

  GeneratedColumn<String> get usage =>
      $composableBuilder(column: $table.usage, builder: (column) => column);

  GeneratedColumn<String> get electricity => $composableBuilder(
    column: $table.electricity,
    builder: (column) => column,
  );

  GeneratedColumn<String> get waterSource => $composableBuilder(
    column: $table.waterSource,
    builder: (column) => column,
  );

  GeneratedColumn<String> get toilet =>
      $composableBuilder(column: $table.toilet, builder: (column) => column);

  GeneratedColumn<String> get approval =>
      $composableBuilder(column: $table.approval, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lng =>
      $composableBuilder(column: $table.lng, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$LandsTableAnnotationComposer get landId {
    final $$LandsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landId,
      referencedTable: $db.lands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandsTableAnnotationComposer(
            $db: $db,
            $table: $db.lands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> familiesRefs<T extends Object>(
    Expression<T> Function($$FamiliesTableAnnotationComposer a) f,
  ) {
    final $$FamiliesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.families,
      getReferencedColumn: (t) => t.buildingId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FamiliesTableAnnotationComposer(
            $db: $db,
            $table: $db.families,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BuildingsTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $BuildingsTable,
          Building,
          $$BuildingsTableFilterComposer,
          $$BuildingsTableOrderingComposer,
          $$BuildingsTableAnnotationComposer,
          $$BuildingsTableCreateCompanionBuilder,
          $$BuildingsTableUpdateCompanionBuilder,
          (Building, $$BuildingsTableReferences),
          Building,
          PrefetchHooks Function({bool landId, bool familiesRefs})
        > {
  $$BuildingsTableTableManager(_$AppDb db, $BuildingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BuildingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BuildingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BuildingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> landId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String?> buildingNo = const Value.absent(),
                Value<int?> floors = const Value.absent(),
                Value<double?> floorAreaSqft = const Value.absent(),
                Value<int?> rooms = const Value.absent(),
                Value<String?> wall = const Value.absent(),
                Value<String?> roof = const Value.absent(),
                Value<String?> floor = const Value.absent(),
                Value<String?> permanence = const Value.absent(),
                Value<String?> condition = const Value.absent(),
                Value<int?> yearBuilt = const Value.absent(),
                Value<String?> usage = const Value.absent(),
                Value<String?> electricity = const Value.absent(),
                Value<String?> waterSource = const Value.absent(),
                Value<String?> toilet = const Value.absent(),
                Value<String?> approval = const Value.absent(),
                Value<double?> lat = const Value.absent(),
                Value<double?> lng = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BuildingsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                landId: landId,
                type: type,
                buildingNo: buildingNo,
                floors: floors,
                floorAreaSqft: floorAreaSqft,
                rooms: rooms,
                wall: wall,
                roof: roof,
                floor: floor,
                permanence: permanence,
                condition: condition,
                yearBuilt: yearBuilt,
                usage: usage,
                electricity: electricity,
                waterSource: waterSource,
                toilet: toilet,
                approval: approval,
                lat: lat,
                lng: lng,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String landId,
                required String type,
                Value<String?> buildingNo = const Value.absent(),
                Value<int?> floors = const Value.absent(),
                Value<double?> floorAreaSqft = const Value.absent(),
                Value<int?> rooms = const Value.absent(),
                Value<String?> wall = const Value.absent(),
                Value<String?> roof = const Value.absent(),
                Value<String?> floor = const Value.absent(),
                Value<String?> permanence = const Value.absent(),
                Value<String?> condition = const Value.absent(),
                Value<int?> yearBuilt = const Value.absent(),
                Value<String?> usage = const Value.absent(),
                Value<String?> electricity = const Value.absent(),
                Value<String?> waterSource = const Value.absent(),
                Value<String?> toilet = const Value.absent(),
                Value<String?> approval = const Value.absent(),
                Value<double?> lat = const Value.absent(),
                Value<double?> lng = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BuildingsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                landId: landId,
                type: type,
                buildingNo: buildingNo,
                floors: floors,
                floorAreaSqft: floorAreaSqft,
                rooms: rooms,
                wall: wall,
                roof: roof,
                floor: floor,
                permanence: permanence,
                condition: condition,
                yearBuilt: yearBuilt,
                usage: usage,
                electricity: electricity,
                waterSource: waterSource,
                toilet: toilet,
                approval: approval,
                lat: lat,
                lng: lng,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$BuildingsTable, Building>(table),
                  $$BuildingsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({landId = false, familiesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (familiesRefs) db.families],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (landId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.landId,
                                referencedTable: $$BuildingsTableReferences
                                    ._landIdTable(db),
                                referencedColumn: $$BuildingsTableReferences
                                    ._landIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (familiesRefs)
                    await $_getPrefetchedDataByColumns<
                      Building,
                      $BuildingsTable,
                      Family,
                      $FamiliesTable
                    >(
                      currentTable: table,
                      referencedTable: $$BuildingsTableReferences
                          ._familiesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$BuildingsTableReferences(
                            db,
                            table,
                            p0,
                          ).familiesRefs,
                      currentColumn: 'id',
                      referencedColumn: 'building_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$BuildingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $BuildingsTable,
      Building,
      $$BuildingsTableFilterComposer,
      $$BuildingsTableOrderingComposer,
      $$BuildingsTableAnnotationComposer,
      $$BuildingsTableCreateCompanionBuilder,
      $$BuildingsTableUpdateCompanionBuilder,
      (Building, $$BuildingsTableReferences),
      Building,
      PrefetchHooks Function({bool landId, bool familiesRefs})
    >;
typedef $$FamiliesTableCreateCompanionBuilder =
    FamiliesCompanion Function({
      required String id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      required String buildingId,
      Value<String?> headPersonId,
      Value<String?> tenure,
      Value<String?> incomeRange,
      Value<String?> mainIncomeSource,
      Value<String?> cookingFuel,
      Value<String?> welfare,
      Value<int?> sinceYear,
      Value<String?> phone,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$FamiliesTableUpdateCompanionBuilder =
    FamiliesCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> buildingId,
      Value<String?> headPersonId,
      Value<String?> tenure,
      Value<String?> incomeRange,
      Value<String?> mainIncomeSource,
      Value<String?> cookingFuel,
      Value<String?> welfare,
      Value<int?> sinceYear,
      Value<String?> phone,
      Value<String?> notes,
      Value<int> rowid,
    });

final class $$FamiliesTableReferences
    extends BaseReferences<_$AppDb, $FamiliesTable, Family> {
  $$FamiliesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BuildingsTable _buildingIdTable(_$AppDb db) =>
      db.buildings.createAlias('families__building_id__buildings__id');

  $$BuildingsTableProcessedTableManager get buildingId {
    final $_column = $_itemColumn<String>('building_id')!;

    final manager = $$BuildingsTableTableManager(
      $_db,
      $_db.buildings,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_buildingIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PersonsTable, List<Person>> _personsRefsTable(
    _$AppDb db,
  ) => MultiTypedResultKey.fromTable(
    db.persons,
    aliasName: 'families__id__persons__family_id',
  );

  $$PersonsTableProcessedTableManager get personsRefs {
    final manager = $$PersonsTableTableManager(
      $_db,
      $_db.persons,
    ).filter((f) => f.familyId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_personsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FamiliesTableFilterComposer extends Composer<_$AppDb, $FamiliesTable> {
  $$FamiliesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get headPersonId => $composableBuilder(
    column: $table.headPersonId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tenure => $composableBuilder(
    column: $table.tenure,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get incomeRange => $composableBuilder(
    column: $table.incomeRange,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mainIncomeSource => $composableBuilder(
    column: $table.mainIncomeSource,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cookingFuel => $composableBuilder(
    column: $table.cookingFuel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get welfare => $composableBuilder(
    column: $table.welfare,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sinceYear => $composableBuilder(
    column: $table.sinceYear,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$BuildingsTableFilterComposer get buildingId {
    final $$BuildingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.buildingId,
      referencedTable: $db.buildings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BuildingsTableFilterComposer(
            $db: $db,
            $table: $db.buildings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> personsRefs(
    Expression<bool> Function($$PersonsTableFilterComposer f) f,
  ) {
    final $$PersonsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.persons,
      getReferencedColumn: (t) => t.familyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonsTableFilterComposer(
            $db: $db,
            $table: $db.persons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FamiliesTableOrderingComposer
    extends Composer<_$AppDb, $FamiliesTable> {
  $$FamiliesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get headPersonId => $composableBuilder(
    column: $table.headPersonId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenure => $composableBuilder(
    column: $table.tenure,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get incomeRange => $composableBuilder(
    column: $table.incomeRange,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mainIncomeSource => $composableBuilder(
    column: $table.mainIncomeSource,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cookingFuel => $composableBuilder(
    column: $table.cookingFuel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get welfare => $composableBuilder(
    column: $table.welfare,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sinceYear => $composableBuilder(
    column: $table.sinceYear,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$BuildingsTableOrderingComposer get buildingId {
    final $$BuildingsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.buildingId,
      referencedTable: $db.buildings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BuildingsTableOrderingComposer(
            $db: $db,
            $table: $db.buildings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FamiliesTableAnnotationComposer
    extends Composer<_$AppDb, $FamiliesTable> {
  $$FamiliesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get headPersonId => $composableBuilder(
    column: $table.headPersonId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tenure =>
      $composableBuilder(column: $table.tenure, builder: (column) => column);

  GeneratedColumn<String> get incomeRange => $composableBuilder(
    column: $table.incomeRange,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mainIncomeSource => $composableBuilder(
    column: $table.mainIncomeSource,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cookingFuel => $composableBuilder(
    column: $table.cookingFuel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get welfare =>
      $composableBuilder(column: $table.welfare, builder: (column) => column);

  GeneratedColumn<int> get sinceYear =>
      $composableBuilder(column: $table.sinceYear, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$BuildingsTableAnnotationComposer get buildingId {
    final $$BuildingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.buildingId,
      referencedTable: $db.buildings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BuildingsTableAnnotationComposer(
            $db: $db,
            $table: $db.buildings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> personsRefs<T extends Object>(
    Expression<T> Function($$PersonsTableAnnotationComposer a) f,
  ) {
    final $$PersonsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.persons,
      getReferencedColumn: (t) => t.familyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonsTableAnnotationComposer(
            $db: $db,
            $table: $db.persons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FamiliesTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $FamiliesTable,
          Family,
          $$FamiliesTableFilterComposer,
          $$FamiliesTableOrderingComposer,
          $$FamiliesTableAnnotationComposer,
          $$FamiliesTableCreateCompanionBuilder,
          $$FamiliesTableUpdateCompanionBuilder,
          (Family, $$FamiliesTableReferences),
          Family,
          PrefetchHooks Function({bool buildingId, bool personsRefs})
        > {
  $$FamiliesTableTableManager(_$AppDb db, $FamiliesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FamiliesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FamiliesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FamiliesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> buildingId = const Value.absent(),
                Value<String?> headPersonId = const Value.absent(),
                Value<String?> tenure = const Value.absent(),
                Value<String?> incomeRange = const Value.absent(),
                Value<String?> mainIncomeSource = const Value.absent(),
                Value<String?> cookingFuel = const Value.absent(),
                Value<String?> welfare = const Value.absent(),
                Value<int?> sinceYear = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FamiliesCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                buildingId: buildingId,
                headPersonId: headPersonId,
                tenure: tenure,
                incomeRange: incomeRange,
                mainIncomeSource: mainIncomeSource,
                cookingFuel: cookingFuel,
                welfare: welfare,
                sinceYear: sinceYear,
                phone: phone,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String buildingId,
                Value<String?> headPersonId = const Value.absent(),
                Value<String?> tenure = const Value.absent(),
                Value<String?> incomeRange = const Value.absent(),
                Value<String?> mainIncomeSource = const Value.absent(),
                Value<String?> cookingFuel = const Value.absent(),
                Value<String?> welfare = const Value.absent(),
                Value<int?> sinceYear = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FamiliesCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                buildingId: buildingId,
                headPersonId: headPersonId,
                tenure: tenure,
                incomeRange: incomeRange,
                mainIncomeSource: mainIncomeSource,
                cookingFuel: cookingFuel,
                welfare: welfare,
                sinceYear: sinceYear,
                phone: phone,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$FamiliesTable, Family>(table),
                  $$FamiliesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({buildingId = false, personsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (personsRefs) db.persons],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (buildingId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.buildingId,
                                referencedTable: $$FamiliesTableReferences
                                    ._buildingIdTable(db),
                                referencedColumn: $$FamiliesTableReferences
                                    ._buildingIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (personsRefs)
                    await $_getPrefetchedDataByColumns<
                      Family,
                      $FamiliesTable,
                      Person,
                      $PersonsTable
                    >(
                      currentTable: table,
                      referencedTable: $$FamiliesTableReferences
                          ._personsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$FamiliesTableReferences(db, table, p0).personsRefs,
                      currentColumn: 'id',
                      referencedColumn: 'family_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$FamiliesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $FamiliesTable,
      Family,
      $$FamiliesTableFilterComposer,
      $$FamiliesTableOrderingComposer,
      $$FamiliesTableAnnotationComposer,
      $$FamiliesTableCreateCompanionBuilder,
      $$FamiliesTableUpdateCompanionBuilder,
      (Family, $$FamiliesTableReferences),
      Family,
      PrefetchHooks Function({bool buildingId, bool personsRefs})
    >;
typedef $$PersonsTableCreateCompanionBuilder =
    PersonsCompanion Function({
      required String id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      required String familyId,
      required String fullName,
      Value<String?> initialsName,
      Value<String?> nic,
      Value<DateTime?> dob,
      Value<String?> gender,
      Value<String?> relation,
      Value<String?> ethnicity,
      Value<String?> religion,
      Value<String?> civilStatus,
      Value<String?> education,
      Value<String?> schoolGrade,
      Value<String?> occupation,
      Value<String?> workplace,
      Value<String?> disability,
      Value<String?> chronicIllness,
      Value<String?> isVoter,
      Value<String> status,
      Value<String?> phone,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$PersonsTableUpdateCompanionBuilder =
    PersonsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> familyId,
      Value<String> fullName,
      Value<String?> initialsName,
      Value<String?> nic,
      Value<DateTime?> dob,
      Value<String?> gender,
      Value<String?> relation,
      Value<String?> ethnicity,
      Value<String?> religion,
      Value<String?> civilStatus,
      Value<String?> education,
      Value<String?> schoolGrade,
      Value<String?> occupation,
      Value<String?> workplace,
      Value<String?> disability,
      Value<String?> chronicIllness,
      Value<String?> isVoter,
      Value<String> status,
      Value<String?> phone,
      Value<String?> notes,
      Value<int> rowid,
    });

final class $$PersonsTableReferences
    extends BaseReferences<_$AppDb, $PersonsTable, Person> {
  $$PersonsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $FamiliesTable _familyIdTable(_$AppDb db) =>
      db.families.createAlias('persons__family_id__families__id');

  $$FamiliesTableProcessedTableManager get familyId {
    final $_column = $_itemColumn<String>('family_id')!;

    final manager = $$FamiliesTableTableManager(
      $_db,
      $_db.families,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_familyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$LandPartiesTable, List<LandParty>>
  _landPartiesRefsTable(_$AppDb db) => MultiTypedResultKey.fromTable(
    db.landParties,
    aliasName: 'persons__id__land_parties__person_id',
  );

  $$LandPartiesTableProcessedTableManager get landPartiesRefs {
    final manager = $$LandPartiesTableTableManager(
      $_db,
      $_db.landParties,
    ).filter((f) => f.personId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_landPartiesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ResidenceEventsTable, List<ResidenceEvent>>
  _residenceEventsRefsTable(_$AppDb db) => MultiTypedResultKey.fromTable(
    db.residenceEvents,
    aliasName: 'persons__id__residence_events__person_id',
  );

  $$ResidenceEventsTableProcessedTableManager get residenceEventsRefs {
    final manager = $$ResidenceEventsTableTableManager(
      $_db,
      $_db.residenceEvents,
    ).filter((f) => f.personId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _residenceEventsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PersonsTableFilterComposer extends Composer<_$AppDb, $PersonsTable> {
  $$PersonsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get initialsName => $composableBuilder(
    column: $table.initialsName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nic => $composableBuilder(
    column: $table.nic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dob => $composableBuilder(
    column: $table.dob,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relation => $composableBuilder(
    column: $table.relation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ethnicity => $composableBuilder(
    column: $table.ethnicity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get religion => $composableBuilder(
    column: $table.religion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get civilStatus => $composableBuilder(
    column: $table.civilStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get education => $composableBuilder(
    column: $table.education,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get schoolGrade => $composableBuilder(
    column: $table.schoolGrade,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get occupation => $composableBuilder(
    column: $table.occupation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get workplace => $composableBuilder(
    column: $table.workplace,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get disability => $composableBuilder(
    column: $table.disability,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get chronicIllness => $composableBuilder(
    column: $table.chronicIllness,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get isVoter => $composableBuilder(
    column: $table.isVoter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$FamiliesTableFilterComposer get familyId {
    final $$FamiliesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.familyId,
      referencedTable: $db.families,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FamiliesTableFilterComposer(
            $db: $db,
            $table: $db.families,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> landPartiesRefs(
    Expression<bool> Function($$LandPartiesTableFilterComposer f) f,
  ) {
    final $$LandPartiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.landParties,
      getReferencedColumn: (t) => t.personId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandPartiesTableFilterComposer(
            $db: $db,
            $table: $db.landParties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> residenceEventsRefs(
    Expression<bool> Function($$ResidenceEventsTableFilterComposer f) f,
  ) {
    final $$ResidenceEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.residenceEvents,
      getReferencedColumn: (t) => t.personId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResidenceEventsTableFilterComposer(
            $db: $db,
            $table: $db.residenceEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PersonsTableOrderingComposer extends Composer<_$AppDb, $PersonsTable> {
  $$PersonsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get initialsName => $composableBuilder(
    column: $table.initialsName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nic => $composableBuilder(
    column: $table.nic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dob => $composableBuilder(
    column: $table.dob,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relation => $composableBuilder(
    column: $table.relation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ethnicity => $composableBuilder(
    column: $table.ethnicity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get religion => $composableBuilder(
    column: $table.religion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get civilStatus => $composableBuilder(
    column: $table.civilStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get education => $composableBuilder(
    column: $table.education,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get schoolGrade => $composableBuilder(
    column: $table.schoolGrade,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get occupation => $composableBuilder(
    column: $table.occupation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get workplace => $composableBuilder(
    column: $table.workplace,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get disability => $composableBuilder(
    column: $table.disability,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get chronicIllness => $composableBuilder(
    column: $table.chronicIllness,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get isVoter => $composableBuilder(
    column: $table.isVoter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$FamiliesTableOrderingComposer get familyId {
    final $$FamiliesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.familyId,
      referencedTable: $db.families,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FamiliesTableOrderingComposer(
            $db: $db,
            $table: $db.families,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PersonsTableAnnotationComposer
    extends Composer<_$AppDb, $PersonsTable> {
  $$PersonsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get initialsName => $composableBuilder(
    column: $table.initialsName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nic =>
      $composableBuilder(column: $table.nic, builder: (column) => column);

  GeneratedColumn<DateTime> get dob =>
      $composableBuilder(column: $table.dob, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get relation =>
      $composableBuilder(column: $table.relation, builder: (column) => column);

  GeneratedColumn<String> get ethnicity =>
      $composableBuilder(column: $table.ethnicity, builder: (column) => column);

  GeneratedColumn<String> get religion =>
      $composableBuilder(column: $table.religion, builder: (column) => column);

  GeneratedColumn<String> get civilStatus => $composableBuilder(
    column: $table.civilStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get education =>
      $composableBuilder(column: $table.education, builder: (column) => column);

  GeneratedColumn<String> get schoolGrade => $composableBuilder(
    column: $table.schoolGrade,
    builder: (column) => column,
  );

  GeneratedColumn<String> get occupation => $composableBuilder(
    column: $table.occupation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get workplace =>
      $composableBuilder(column: $table.workplace, builder: (column) => column);

  GeneratedColumn<String> get disability => $composableBuilder(
    column: $table.disability,
    builder: (column) => column,
  );

  GeneratedColumn<String> get chronicIllness => $composableBuilder(
    column: $table.chronicIllness,
    builder: (column) => column,
  );

  GeneratedColumn<String> get isVoter =>
      $composableBuilder(column: $table.isVoter, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$FamiliesTableAnnotationComposer get familyId {
    final $$FamiliesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.familyId,
      referencedTable: $db.families,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FamiliesTableAnnotationComposer(
            $db: $db,
            $table: $db.families,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> landPartiesRefs<T extends Object>(
    Expression<T> Function($$LandPartiesTableAnnotationComposer a) f,
  ) {
    final $$LandPartiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.landParties,
      getReferencedColumn: (t) => t.personId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandPartiesTableAnnotationComposer(
            $db: $db,
            $table: $db.landParties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> residenceEventsRefs<T extends Object>(
    Expression<T> Function($$ResidenceEventsTableAnnotationComposer a) f,
  ) {
    final $$ResidenceEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.residenceEvents,
      getReferencedColumn: (t) => t.personId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResidenceEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.residenceEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PersonsTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $PersonsTable,
          Person,
          $$PersonsTableFilterComposer,
          $$PersonsTableOrderingComposer,
          $$PersonsTableAnnotationComposer,
          $$PersonsTableCreateCompanionBuilder,
          $$PersonsTableUpdateCompanionBuilder,
          (Person, $$PersonsTableReferences),
          Person,
          PrefetchHooks Function({
            bool familyId,
            bool landPartiesRefs,
            bool residenceEventsRefs,
          })
        > {
  $$PersonsTableTableManager(_$AppDb db, $PersonsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PersonsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PersonsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PersonsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> familyId = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<String?> initialsName = const Value.absent(),
                Value<String?> nic = const Value.absent(),
                Value<DateTime?> dob = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<String?> relation = const Value.absent(),
                Value<String?> ethnicity = const Value.absent(),
                Value<String?> religion = const Value.absent(),
                Value<String?> civilStatus = const Value.absent(),
                Value<String?> education = const Value.absent(),
                Value<String?> schoolGrade = const Value.absent(),
                Value<String?> occupation = const Value.absent(),
                Value<String?> workplace = const Value.absent(),
                Value<String?> disability = const Value.absent(),
                Value<String?> chronicIllness = const Value.absent(),
                Value<String?> isVoter = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PersonsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                familyId: familyId,
                fullName: fullName,
                initialsName: initialsName,
                nic: nic,
                dob: dob,
                gender: gender,
                relation: relation,
                ethnicity: ethnicity,
                religion: religion,
                civilStatus: civilStatus,
                education: education,
                schoolGrade: schoolGrade,
                occupation: occupation,
                workplace: workplace,
                disability: disability,
                chronicIllness: chronicIllness,
                isVoter: isVoter,
                status: status,
                phone: phone,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String familyId,
                required String fullName,
                Value<String?> initialsName = const Value.absent(),
                Value<String?> nic = const Value.absent(),
                Value<DateTime?> dob = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<String?> relation = const Value.absent(),
                Value<String?> ethnicity = const Value.absent(),
                Value<String?> religion = const Value.absent(),
                Value<String?> civilStatus = const Value.absent(),
                Value<String?> education = const Value.absent(),
                Value<String?> schoolGrade = const Value.absent(),
                Value<String?> occupation = const Value.absent(),
                Value<String?> workplace = const Value.absent(),
                Value<String?> disability = const Value.absent(),
                Value<String?> chronicIllness = const Value.absent(),
                Value<String?> isVoter = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PersonsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                familyId: familyId,
                fullName: fullName,
                initialsName: initialsName,
                nic: nic,
                dob: dob,
                gender: gender,
                relation: relation,
                ethnicity: ethnicity,
                religion: religion,
                civilStatus: civilStatus,
                education: education,
                schoolGrade: schoolGrade,
                occupation: occupation,
                workplace: workplace,
                disability: disability,
                chronicIllness: chronicIllness,
                isVoter: isVoter,
                status: status,
                phone: phone,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PersonsTable, Person>(table),
                  $$PersonsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                familyId = false,
                landPartiesRefs = false,
                residenceEventsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (landPartiesRefs) db.landParties,
                    if (residenceEventsRefs) db.residenceEvents,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (familyId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.familyId,
                                    referencedTable: $$PersonsTableReferences
                                        ._familyIdTable(db),
                                    referencedColumn: $$PersonsTableReferences
                                        ._familyIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (landPartiesRefs)
                        await $_getPrefetchedDataByColumns<
                          Person,
                          $PersonsTable,
                          LandParty,
                          $LandPartiesTable
                        >(
                          currentTable: table,
                          referencedTable: $$PersonsTableReferences
                              ._landPartiesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PersonsTableReferences(
                                db,
                                table,
                                p0,
                              ).landPartiesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'person_id',
                          typedResults: items,
                        ),
                      if (residenceEventsRefs)
                        await $_getPrefetchedDataByColumns<
                          Person,
                          $PersonsTable,
                          ResidenceEvent,
                          $ResidenceEventsTable
                        >(
                          currentTable: table,
                          referencedTable: $$PersonsTableReferences
                              ._residenceEventsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PersonsTableReferences(
                                db,
                                table,
                                p0,
                              ).residenceEventsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'person_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PersonsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $PersonsTable,
      Person,
      $$PersonsTableFilterComposer,
      $$PersonsTableOrderingComposer,
      $$PersonsTableAnnotationComposer,
      $$PersonsTableCreateCompanionBuilder,
      $$PersonsTableUpdateCompanionBuilder,
      (Person, $$PersonsTableReferences),
      Person,
      PrefetchHooks Function({
        bool familyId,
        bool landPartiesRefs,
        bool residenceEventsRefs,
      })
    >;
typedef $$LandPartiesTableCreateCompanionBuilder =
    LandPartiesCompanion Function({
      required String id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      required String landId,
      Value<String?> personId,
      Value<String?> outsideName,
      required String role,
      Value<String?> share,
      Value<int> rowid,
    });
typedef $$LandPartiesTableUpdateCompanionBuilder =
    LandPartiesCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> landId,
      Value<String?> personId,
      Value<String?> outsideName,
      Value<String> role,
      Value<String?> share,
      Value<int> rowid,
    });

final class $$LandPartiesTableReferences
    extends BaseReferences<_$AppDb, $LandPartiesTable, LandParty> {
  $$LandPartiesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LandsTable _landIdTable(_$AppDb db) =>
      db.lands.createAlias('land_parties__land_id__lands__id');

  $$LandsTableProcessedTableManager get landId {
    final $_column = $_itemColumn<String>('land_id')!;

    final manager = $$LandsTableTableManager(
      $_db,
      $_db.lands,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_landIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PersonsTable _personIdTable(_$AppDb db) =>
      db.persons.createAlias('land_parties__person_id__persons__id');

  $$PersonsTableProcessedTableManager? get personId {
    final $_column = $_itemColumn<String>('person_id');
    if ($_column == null) return null;
    final manager = $$PersonsTableTableManager(
      $_db,
      $_db.persons,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_personIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LandPartiesTableFilterComposer
    extends Composer<_$AppDb, $LandPartiesTable> {
  $$LandPartiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get outsideName => $composableBuilder(
    column: $table.outsideName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get share => $composableBuilder(
    column: $table.share,
    builder: (column) => ColumnFilters(column),
  );

  $$LandsTableFilterComposer get landId {
    final $$LandsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landId,
      referencedTable: $db.lands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandsTableFilterComposer(
            $db: $db,
            $table: $db.lands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PersonsTableFilterComposer get personId {
    final $$PersonsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.persons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonsTableFilterComposer(
            $db: $db,
            $table: $db.persons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LandPartiesTableOrderingComposer
    extends Composer<_$AppDb, $LandPartiesTable> {
  $$LandPartiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get outsideName => $composableBuilder(
    column: $table.outsideName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get share => $composableBuilder(
    column: $table.share,
    builder: (column) => ColumnOrderings(column),
  );

  $$LandsTableOrderingComposer get landId {
    final $$LandsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landId,
      referencedTable: $db.lands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandsTableOrderingComposer(
            $db: $db,
            $table: $db.lands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PersonsTableOrderingComposer get personId {
    final $$PersonsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.persons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonsTableOrderingComposer(
            $db: $db,
            $table: $db.persons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LandPartiesTableAnnotationComposer
    extends Composer<_$AppDb, $LandPartiesTable> {
  $$LandPartiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get outsideName => $composableBuilder(
    column: $table.outsideName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get share =>
      $composableBuilder(column: $table.share, builder: (column) => column);

  $$LandsTableAnnotationComposer get landId {
    final $$LandsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landId,
      referencedTable: $db.lands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandsTableAnnotationComposer(
            $db: $db,
            $table: $db.lands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PersonsTableAnnotationComposer get personId {
    final $$PersonsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.persons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonsTableAnnotationComposer(
            $db: $db,
            $table: $db.persons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LandPartiesTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $LandPartiesTable,
          LandParty,
          $$LandPartiesTableFilterComposer,
          $$LandPartiesTableOrderingComposer,
          $$LandPartiesTableAnnotationComposer,
          $$LandPartiesTableCreateCompanionBuilder,
          $$LandPartiesTableUpdateCompanionBuilder,
          (LandParty, $$LandPartiesTableReferences),
          LandParty,
          PrefetchHooks Function({bool landId, bool personId})
        > {
  $$LandPartiesTableTableManager(_$AppDb db, $LandPartiesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LandPartiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LandPartiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LandPartiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> landId = const Value.absent(),
                Value<String?> personId = const Value.absent(),
                Value<String?> outsideName = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<String?> share = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LandPartiesCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                landId: landId,
                personId: personId,
                outsideName: outsideName,
                role: role,
                share: share,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String landId,
                Value<String?> personId = const Value.absent(),
                Value<String?> outsideName = const Value.absent(),
                required String role,
                Value<String?> share = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LandPartiesCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                landId: landId,
                personId: personId,
                outsideName: outsideName,
                role: role,
                share: share,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$LandPartiesTable, LandParty>(table),
                  $$LandPartiesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({landId = false, personId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (landId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.landId,
                                referencedTable: $$LandPartiesTableReferences
                                    ._landIdTable(db),
                                referencedColumn: $$LandPartiesTableReferences
                                    ._landIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (personId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.personId,
                                referencedTable: $$LandPartiesTableReferences
                                    ._personIdTable(db),
                                referencedColumn: $$LandPartiesTableReferences
                                    ._personIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LandPartiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $LandPartiesTable,
      LandParty,
      $$LandPartiesTableFilterComposer,
      $$LandPartiesTableOrderingComposer,
      $$LandPartiesTableAnnotationComposer,
      $$LandPartiesTableCreateCompanionBuilder,
      $$LandPartiesTableUpdateCompanionBuilder,
      (LandParty, $$LandPartiesTableReferences),
      LandParty,
      PrefetchHooks Function({bool landId, bool personId})
    >;
typedef $$ResidenceEventsTableCreateCompanionBuilder =
    ResidenceEventsCompanion Function({
      required String id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      required String personId,
      required String type,
      required DateTime date,
      Value<String?> note,
      Value<int> rowid,
    });
typedef $$ResidenceEventsTableUpdateCompanionBuilder =
    ResidenceEventsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> personId,
      Value<String> type,
      Value<DateTime> date,
      Value<String?> note,
      Value<int> rowid,
    });

final class $$ResidenceEventsTableReferences
    extends BaseReferences<_$AppDb, $ResidenceEventsTable, ResidenceEvent> {
  $$ResidenceEventsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PersonsTable _personIdTable(_$AppDb db) =>
      db.persons.createAlias('residence_events__person_id__persons__id');

  $$PersonsTableProcessedTableManager get personId {
    final $_column = $_itemColumn<String>('person_id')!;

    final manager = $$PersonsTableTableManager(
      $_db,
      $_db.persons,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_personIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ResidenceEventsTableFilterComposer
    extends Composer<_$AppDb, $ResidenceEventsTable> {
  $$ResidenceEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$PersonsTableFilterComposer get personId {
    final $$PersonsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.persons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonsTableFilterComposer(
            $db: $db,
            $table: $db.persons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ResidenceEventsTableOrderingComposer
    extends Composer<_$AppDb, $ResidenceEventsTable> {
  $$ResidenceEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$PersonsTableOrderingComposer get personId {
    final $$PersonsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.persons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonsTableOrderingComposer(
            $db: $db,
            $table: $db.persons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ResidenceEventsTableAnnotationComposer
    extends Composer<_$AppDb, $ResidenceEventsTable> {
  $$ResidenceEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$PersonsTableAnnotationComposer get personId {
    final $$PersonsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.persons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonsTableAnnotationComposer(
            $db: $db,
            $table: $db.persons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ResidenceEventsTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $ResidenceEventsTable,
          ResidenceEvent,
          $$ResidenceEventsTableFilterComposer,
          $$ResidenceEventsTableOrderingComposer,
          $$ResidenceEventsTableAnnotationComposer,
          $$ResidenceEventsTableCreateCompanionBuilder,
          $$ResidenceEventsTableUpdateCompanionBuilder,
          (ResidenceEvent, $$ResidenceEventsTableReferences),
          ResidenceEvent,
          PrefetchHooks Function({bool personId})
        > {
  $$ResidenceEventsTableTableManager(_$AppDb db, $ResidenceEventsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ResidenceEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ResidenceEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ResidenceEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> personId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ResidenceEventsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                personId: personId,
                type: type,
                date: date,
                note: note,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String personId,
                required String type,
                required DateTime date,
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ResidenceEventsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                personId: personId,
                type: type,
                date: date,
                note: note,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ResidenceEventsTable, ResidenceEvent>(table),
                  $$ResidenceEventsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({personId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (personId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.personId,
                                referencedTable:
                                    $$ResidenceEventsTableReferences
                                        ._personIdTable(db),
                                referencedColumn:
                                    $$ResidenceEventsTableReferences
                                        ._personIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ResidenceEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $ResidenceEventsTable,
      ResidenceEvent,
      $$ResidenceEventsTableFilterComposer,
      $$ResidenceEventsTableOrderingComposer,
      $$ResidenceEventsTableAnnotationComposer,
      $$ResidenceEventsTableCreateCompanionBuilder,
      $$ResidenceEventsTableUpdateCompanionBuilder,
      (ResidenceEvent, $$ResidenceEventsTableReferences),
      ResidenceEvent,
      PrefetchHooks Function({bool personId})
    >;
typedef $$TreeCountsTableCreateCompanionBuilder =
    TreeCountsCompanion Function({
      required String id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      required String landId,
      required String species,
      Value<int> bearing,
      Value<int> young,
      Value<String?> note,
      Value<int> rowid,
    });
typedef $$TreeCountsTableUpdateCompanionBuilder =
    TreeCountsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> landId,
      Value<String> species,
      Value<int> bearing,
      Value<int> young,
      Value<String?> note,
      Value<int> rowid,
    });

final class $$TreeCountsTableReferences
    extends BaseReferences<_$AppDb, $TreeCountsTable, TreeCount> {
  $$TreeCountsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LandsTable _landIdTable(_$AppDb db) =>
      db.lands.createAlias('tree_counts__land_id__lands__id');

  $$LandsTableProcessedTableManager get landId {
    final $_column = $_itemColumn<String>('land_id')!;

    final manager = $$LandsTableTableManager(
      $_db,
      $_db.lands,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_landIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TreeCountsTableFilterComposer
    extends Composer<_$AppDb, $TreeCountsTable> {
  $$TreeCountsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bearing => $composableBuilder(
    column: $table.bearing,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get young => $composableBuilder(
    column: $table.young,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$LandsTableFilterComposer get landId {
    final $$LandsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landId,
      referencedTable: $db.lands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandsTableFilterComposer(
            $db: $db,
            $table: $db.lands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TreeCountsTableOrderingComposer
    extends Composer<_$AppDb, $TreeCountsTable> {
  $$TreeCountsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bearing => $composableBuilder(
    column: $table.bearing,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get young => $composableBuilder(
    column: $table.young,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$LandsTableOrderingComposer get landId {
    final $$LandsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landId,
      referencedTable: $db.lands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandsTableOrderingComposer(
            $db: $db,
            $table: $db.lands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TreeCountsTableAnnotationComposer
    extends Composer<_$AppDb, $TreeCountsTable> {
  $$TreeCountsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get species =>
      $composableBuilder(column: $table.species, builder: (column) => column);

  GeneratedColumn<int> get bearing =>
      $composableBuilder(column: $table.bearing, builder: (column) => column);

  GeneratedColumn<int> get young =>
      $composableBuilder(column: $table.young, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$LandsTableAnnotationComposer get landId {
    final $$LandsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landId,
      referencedTable: $db.lands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandsTableAnnotationComposer(
            $db: $db,
            $table: $db.lands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TreeCountsTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $TreeCountsTable,
          TreeCount,
          $$TreeCountsTableFilterComposer,
          $$TreeCountsTableOrderingComposer,
          $$TreeCountsTableAnnotationComposer,
          $$TreeCountsTableCreateCompanionBuilder,
          $$TreeCountsTableUpdateCompanionBuilder,
          (TreeCount, $$TreeCountsTableReferences),
          TreeCount,
          PrefetchHooks Function({bool landId})
        > {
  $$TreeCountsTableTableManager(_$AppDb db, $TreeCountsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TreeCountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TreeCountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TreeCountsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> landId = const Value.absent(),
                Value<String> species = const Value.absent(),
                Value<int> bearing = const Value.absent(),
                Value<int> young = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TreeCountsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                landId: landId,
                species: species,
                bearing: bearing,
                young: young,
                note: note,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String landId,
                required String species,
                Value<int> bearing = const Value.absent(),
                Value<int> young = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TreeCountsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                landId: landId,
                species: species,
                bearing: bearing,
                young: young,
                note: note,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TreeCountsTable, TreeCount>(table),
                  $$TreeCountsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({landId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (landId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.landId,
                                referencedTable: $$TreeCountsTableReferences
                                    ._landIdTable(db),
                                referencedColumn: $$TreeCountsTableReferences
                                    ._landIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TreeCountsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $TreeCountsTable,
      TreeCount,
      $$TreeCountsTableFilterComposer,
      $$TreeCountsTableOrderingComposer,
      $$TreeCountsTableAnnotationComposer,
      $$TreeCountsTableCreateCompanionBuilder,
      $$TreeCountsTableUpdateCompanionBuilder,
      (TreeCount, $$TreeCountsTableReferences),
      TreeCount,
      PrefetchHooks Function({bool landId})
    >;
typedef $$TreesTableCreateCompanionBuilder =
    TreesCompanion Function({
      required String id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      required String landId,
      required String species,
      Value<double?> girthIn,
      Value<double?> heightFt,
      Value<int?> ageYears,
      Value<String?> condition,
      Value<bool> isHazard,
      Value<double?> lat,
      Value<double?> lng,
      Value<String?> note,
      Value<int> rowid,
    });
typedef $$TreesTableUpdateCompanionBuilder =
    TreesCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> landId,
      Value<String> species,
      Value<double?> girthIn,
      Value<double?> heightFt,
      Value<int?> ageYears,
      Value<String?> condition,
      Value<bool> isHazard,
      Value<double?> lat,
      Value<double?> lng,
      Value<String?> note,
      Value<int> rowid,
    });

final class $$TreesTableReferences
    extends BaseReferences<_$AppDb, $TreesTable, Tree> {
  $$TreesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LandsTable _landIdTable(_$AppDb db) =>
      db.lands.createAlias('trees__land_id__lands__id');

  $$LandsTableProcessedTableManager get landId {
    final $_column = $_itemColumn<String>('land_id')!;

    final manager = $$LandsTableTableManager(
      $_db,
      $_db.lands,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_landIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TreesTableFilterComposer extends Composer<_$AppDb, $TreesTable> {
  $$TreesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get girthIn => $composableBuilder(
    column: $table.girthIn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get heightFt => $composableBuilder(
    column: $table.heightFt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ageYears => $composableBuilder(
    column: $table.ageYears,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isHazard => $composableBuilder(
    column: $table.isHazard,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$LandsTableFilterComposer get landId {
    final $$LandsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landId,
      referencedTable: $db.lands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandsTableFilterComposer(
            $db: $db,
            $table: $db.lands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TreesTableOrderingComposer extends Composer<_$AppDb, $TreesTable> {
  $$TreesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get girthIn => $composableBuilder(
    column: $table.girthIn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get heightFt => $composableBuilder(
    column: $table.heightFt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ageYears => $composableBuilder(
    column: $table.ageYears,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isHazard => $composableBuilder(
    column: $table.isHazard,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$LandsTableOrderingComposer get landId {
    final $$LandsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landId,
      referencedTable: $db.lands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandsTableOrderingComposer(
            $db: $db,
            $table: $db.lands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TreesTableAnnotationComposer extends Composer<_$AppDb, $TreesTable> {
  $$TreesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get species =>
      $composableBuilder(column: $table.species, builder: (column) => column);

  GeneratedColumn<double> get girthIn =>
      $composableBuilder(column: $table.girthIn, builder: (column) => column);

  GeneratedColumn<double> get heightFt =>
      $composableBuilder(column: $table.heightFt, builder: (column) => column);

  GeneratedColumn<int> get ageYears =>
      $composableBuilder(column: $table.ageYears, builder: (column) => column);

  GeneratedColumn<String> get condition =>
      $composableBuilder(column: $table.condition, builder: (column) => column);

  GeneratedColumn<bool> get isHazard =>
      $composableBuilder(column: $table.isHazard, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lng =>
      $composableBuilder(column: $table.lng, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$LandsTableAnnotationComposer get landId {
    final $$LandsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landId,
      referencedTable: $db.lands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandsTableAnnotationComposer(
            $db: $db,
            $table: $db.lands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TreesTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $TreesTable,
          Tree,
          $$TreesTableFilterComposer,
          $$TreesTableOrderingComposer,
          $$TreesTableAnnotationComposer,
          $$TreesTableCreateCompanionBuilder,
          $$TreesTableUpdateCompanionBuilder,
          (Tree, $$TreesTableReferences),
          Tree,
          PrefetchHooks Function({bool landId})
        > {
  $$TreesTableTableManager(_$AppDb db, $TreesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TreesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TreesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TreesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> landId = const Value.absent(),
                Value<String> species = const Value.absent(),
                Value<double?> girthIn = const Value.absent(),
                Value<double?> heightFt = const Value.absent(),
                Value<int?> ageYears = const Value.absent(),
                Value<String?> condition = const Value.absent(),
                Value<bool> isHazard = const Value.absent(),
                Value<double?> lat = const Value.absent(),
                Value<double?> lng = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TreesCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                landId: landId,
                species: species,
                girthIn: girthIn,
                heightFt: heightFt,
                ageYears: ageYears,
                condition: condition,
                isHazard: isHazard,
                lat: lat,
                lng: lng,
                note: note,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String landId,
                required String species,
                Value<double?> girthIn = const Value.absent(),
                Value<double?> heightFt = const Value.absent(),
                Value<int?> ageYears = const Value.absent(),
                Value<String?> condition = const Value.absent(),
                Value<bool> isHazard = const Value.absent(),
                Value<double?> lat = const Value.absent(),
                Value<double?> lng = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TreesCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                landId: landId,
                species: species,
                girthIn: girthIn,
                heightFt: heightFt,
                ageYears: ageYears,
                condition: condition,
                isHazard: isHazard,
                lat: lat,
                lng: lng,
                note: note,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TreesTable, Tree>(table),
                  $$TreesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({landId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (landId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.landId,
                                referencedTable: $$TreesTableReferences
                                    ._landIdTable(db),
                                referencedColumn: $$TreesTableReferences
                                    ._landIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TreesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $TreesTable,
      Tree,
      $$TreesTableFilterComposer,
      $$TreesTableOrderingComposer,
      $$TreesTableAnnotationComposer,
      $$TreesTableCreateCompanionBuilder,
      $$TreesTableUpdateCompanionBuilder,
      (Tree, $$TreesTableReferences),
      Tree,
      PrefetchHooks Function({bool landId})
    >;
typedef $$CropsTableCreateCompanionBuilder =
    CropsCompanion Function({
      required String id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      required String landId,
      required String crop,
      Value<double?> extentValue,
      Value<String?> extentUnit,
      Value<String?> season,
      Value<String?> cultivator,
      Value<String?> irrigation,
      Value<String?> note,
      Value<int> rowid,
    });
typedef $$CropsTableUpdateCompanionBuilder =
    CropsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> landId,
      Value<String> crop,
      Value<double?> extentValue,
      Value<String?> extentUnit,
      Value<String?> season,
      Value<String?> cultivator,
      Value<String?> irrigation,
      Value<String?> note,
      Value<int> rowid,
    });

final class $$CropsTableReferences
    extends BaseReferences<_$AppDb, $CropsTable, Crop> {
  $$CropsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LandsTable _landIdTable(_$AppDb db) =>
      db.lands.createAlias('crops__land_id__lands__id');

  $$LandsTableProcessedTableManager get landId {
    final $_column = $_itemColumn<String>('land_id')!;

    final manager = $$LandsTableTableManager(
      $_db,
      $_db.lands,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_landIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CropsTableFilterComposer extends Composer<_$AppDb, $CropsTable> {
  $$CropsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get crop => $composableBuilder(
    column: $table.crop,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get extentValue => $composableBuilder(
    column: $table.extentValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get extentUnit => $composableBuilder(
    column: $table.extentUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get season => $composableBuilder(
    column: $table.season,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cultivator => $composableBuilder(
    column: $table.cultivator,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get irrigation => $composableBuilder(
    column: $table.irrigation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$LandsTableFilterComposer get landId {
    final $$LandsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landId,
      referencedTable: $db.lands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandsTableFilterComposer(
            $db: $db,
            $table: $db.lands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CropsTableOrderingComposer extends Composer<_$AppDb, $CropsTable> {
  $$CropsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get crop => $composableBuilder(
    column: $table.crop,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get extentValue => $composableBuilder(
    column: $table.extentValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get extentUnit => $composableBuilder(
    column: $table.extentUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get season => $composableBuilder(
    column: $table.season,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cultivator => $composableBuilder(
    column: $table.cultivator,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get irrigation => $composableBuilder(
    column: $table.irrigation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$LandsTableOrderingComposer get landId {
    final $$LandsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landId,
      referencedTable: $db.lands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandsTableOrderingComposer(
            $db: $db,
            $table: $db.lands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CropsTableAnnotationComposer extends Composer<_$AppDb, $CropsTable> {
  $$CropsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get crop =>
      $composableBuilder(column: $table.crop, builder: (column) => column);

  GeneratedColumn<double> get extentValue => $composableBuilder(
    column: $table.extentValue,
    builder: (column) => column,
  );

  GeneratedColumn<String> get extentUnit => $composableBuilder(
    column: $table.extentUnit,
    builder: (column) => column,
  );

  GeneratedColumn<String> get season =>
      $composableBuilder(column: $table.season, builder: (column) => column);

  GeneratedColumn<String> get cultivator => $composableBuilder(
    column: $table.cultivator,
    builder: (column) => column,
  );

  GeneratedColumn<String> get irrigation => $composableBuilder(
    column: $table.irrigation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$LandsTableAnnotationComposer get landId {
    final $$LandsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landId,
      referencedTable: $db.lands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandsTableAnnotationComposer(
            $db: $db,
            $table: $db.lands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CropsTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $CropsTable,
          Crop,
          $$CropsTableFilterComposer,
          $$CropsTableOrderingComposer,
          $$CropsTableAnnotationComposer,
          $$CropsTableCreateCompanionBuilder,
          $$CropsTableUpdateCompanionBuilder,
          (Crop, $$CropsTableReferences),
          Crop,
          PrefetchHooks Function({bool landId})
        > {
  $$CropsTableTableManager(_$AppDb db, $CropsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CropsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CropsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CropsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> landId = const Value.absent(),
                Value<String> crop = const Value.absent(),
                Value<double?> extentValue = const Value.absent(),
                Value<String?> extentUnit = const Value.absent(),
                Value<String?> season = const Value.absent(),
                Value<String?> cultivator = const Value.absent(),
                Value<String?> irrigation = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CropsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                landId: landId,
                crop: crop,
                extentValue: extentValue,
                extentUnit: extentUnit,
                season: season,
                cultivator: cultivator,
                irrigation: irrigation,
                note: note,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String landId,
                required String crop,
                Value<double?> extentValue = const Value.absent(),
                Value<String?> extentUnit = const Value.absent(),
                Value<String?> season = const Value.absent(),
                Value<String?> cultivator = const Value.absent(),
                Value<String?> irrigation = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CropsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                landId: landId,
                crop: crop,
                extentValue: extentValue,
                extentUnit: extentUnit,
                season: season,
                cultivator: cultivator,
                irrigation: irrigation,
                note: note,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CropsTable, Crop>(table),
                  $$CropsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({landId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (landId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.landId,
                                referencedTable: $$CropsTableReferences
                                    ._landIdTable(db),
                                referencedColumn: $$CropsTableReferences
                                    ._landIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CropsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $CropsTable,
      Crop,
      $$CropsTableFilterComposer,
      $$CropsTableOrderingComposer,
      $$CropsTableAnnotationComposer,
      $$CropsTableCreateCompanionBuilder,
      $$CropsTableUpdateCompanionBuilder,
      (Crop, $$CropsTableReferences),
      Crop,
      PrefetchHooks Function({bool landId})
    >;
typedef $$AnimalsTableCreateCompanionBuilder =
    AnimalsCompanion Function({
      required String id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      required String landId,
      Value<String?> familyId,
      required String species,
      Value<int> male,
      Value<int> female,
      Value<int> young,
      Value<String?> purpose,
      Value<double?> dailyMilkL,
      Value<String?> housing,
      Value<String?> vaccinated,
      Value<DateTime?> lastVaccination,
      Value<String?> note,
      Value<int> rowid,
    });
typedef $$AnimalsTableUpdateCompanionBuilder =
    AnimalsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> landId,
      Value<String?> familyId,
      Value<String> species,
      Value<int> male,
      Value<int> female,
      Value<int> young,
      Value<String?> purpose,
      Value<double?> dailyMilkL,
      Value<String?> housing,
      Value<String?> vaccinated,
      Value<DateTime?> lastVaccination,
      Value<String?> note,
      Value<int> rowid,
    });

final class $$AnimalsTableReferences
    extends BaseReferences<_$AppDb, $AnimalsTable, Animal> {
  $$AnimalsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LandsTable _landIdTable(_$AppDb db) =>
      db.lands.createAlias('animals__land_id__lands__id');

  $$LandsTableProcessedTableManager get landId {
    final $_column = $_itemColumn<String>('land_id')!;

    final manager = $$LandsTableTableManager(
      $_db,
      $_db.lands,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_landIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AnimalsTableFilterComposer extends Composer<_$AppDb, $AnimalsTable> {
  $$AnimalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get familyId => $composableBuilder(
    column: $table.familyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get male => $composableBuilder(
    column: $table.male,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get female => $composableBuilder(
    column: $table.female,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get young => $composableBuilder(
    column: $table.young,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get purpose => $composableBuilder(
    column: $table.purpose,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get dailyMilkL => $composableBuilder(
    column: $table.dailyMilkL,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get housing => $composableBuilder(
    column: $table.housing,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vaccinated => $composableBuilder(
    column: $table.vaccinated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastVaccination => $composableBuilder(
    column: $table.lastVaccination,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$LandsTableFilterComposer get landId {
    final $$LandsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landId,
      referencedTable: $db.lands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandsTableFilterComposer(
            $db: $db,
            $table: $db.lands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AnimalsTableOrderingComposer extends Composer<_$AppDb, $AnimalsTable> {
  $$AnimalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get familyId => $composableBuilder(
    column: $table.familyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get male => $composableBuilder(
    column: $table.male,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get female => $composableBuilder(
    column: $table.female,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get young => $composableBuilder(
    column: $table.young,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get purpose => $composableBuilder(
    column: $table.purpose,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get dailyMilkL => $composableBuilder(
    column: $table.dailyMilkL,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get housing => $composableBuilder(
    column: $table.housing,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vaccinated => $composableBuilder(
    column: $table.vaccinated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastVaccination => $composableBuilder(
    column: $table.lastVaccination,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$LandsTableOrderingComposer get landId {
    final $$LandsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landId,
      referencedTable: $db.lands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandsTableOrderingComposer(
            $db: $db,
            $table: $db.lands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AnimalsTableAnnotationComposer
    extends Composer<_$AppDb, $AnimalsTable> {
  $$AnimalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get familyId =>
      $composableBuilder(column: $table.familyId, builder: (column) => column);

  GeneratedColumn<String> get species =>
      $composableBuilder(column: $table.species, builder: (column) => column);

  GeneratedColumn<int> get male =>
      $composableBuilder(column: $table.male, builder: (column) => column);

  GeneratedColumn<int> get female =>
      $composableBuilder(column: $table.female, builder: (column) => column);

  GeneratedColumn<int> get young =>
      $composableBuilder(column: $table.young, builder: (column) => column);

  GeneratedColumn<String> get purpose =>
      $composableBuilder(column: $table.purpose, builder: (column) => column);

  GeneratedColumn<double> get dailyMilkL => $composableBuilder(
    column: $table.dailyMilkL,
    builder: (column) => column,
  );

  GeneratedColumn<String> get housing =>
      $composableBuilder(column: $table.housing, builder: (column) => column);

  GeneratedColumn<String> get vaccinated => $composableBuilder(
    column: $table.vaccinated,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastVaccination => $composableBuilder(
    column: $table.lastVaccination,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$LandsTableAnnotationComposer get landId {
    final $$LandsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landId,
      referencedTable: $db.lands,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandsTableAnnotationComposer(
            $db: $db,
            $table: $db.lands,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AnimalsTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $AnimalsTable,
          Animal,
          $$AnimalsTableFilterComposer,
          $$AnimalsTableOrderingComposer,
          $$AnimalsTableAnnotationComposer,
          $$AnimalsTableCreateCompanionBuilder,
          $$AnimalsTableUpdateCompanionBuilder,
          (Animal, $$AnimalsTableReferences),
          Animal,
          PrefetchHooks Function({bool landId})
        > {
  $$AnimalsTableTableManager(_$AppDb db, $AnimalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnimalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AnimalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AnimalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> landId = const Value.absent(),
                Value<String?> familyId = const Value.absent(),
                Value<String> species = const Value.absent(),
                Value<int> male = const Value.absent(),
                Value<int> female = const Value.absent(),
                Value<int> young = const Value.absent(),
                Value<String?> purpose = const Value.absent(),
                Value<double?> dailyMilkL = const Value.absent(),
                Value<String?> housing = const Value.absent(),
                Value<String?> vaccinated = const Value.absent(),
                Value<DateTime?> lastVaccination = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnimalsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                landId: landId,
                familyId: familyId,
                species: species,
                male: male,
                female: female,
                young: young,
                purpose: purpose,
                dailyMilkL: dailyMilkL,
                housing: housing,
                vaccinated: vaccinated,
                lastVaccination: lastVaccination,
                note: note,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String landId,
                Value<String?> familyId = const Value.absent(),
                required String species,
                Value<int> male = const Value.absent(),
                Value<int> female = const Value.absent(),
                Value<int> young = const Value.absent(),
                Value<String?> purpose = const Value.absent(),
                Value<double?> dailyMilkL = const Value.absent(),
                Value<String?> housing = const Value.absent(),
                Value<String?> vaccinated = const Value.absent(),
                Value<DateTime?> lastVaccination = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnimalsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                landId: landId,
                familyId: familyId,
                species: species,
                male: male,
                female: female,
                young: young,
                purpose: purpose,
                dailyMilkL: dailyMilkL,
                housing: housing,
                vaccinated: vaccinated,
                lastVaccination: lastVaccination,
                note: note,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AnimalsTable, Animal>(table),
                  $$AnimalsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({landId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (landId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.landId,
                                referencedTable: $$AnimalsTableReferences
                                    ._landIdTable(db),
                                referencedColumn: $$AnimalsTableReferences
                                    ._landIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AnimalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $AnimalsTable,
      Animal,
      $$AnimalsTableFilterComposer,
      $$AnimalsTableOrderingComposer,
      $$AnimalsTableAnnotationComposer,
      $$AnimalsTableCreateCompanionBuilder,
      $$AnimalsTableUpdateCompanionBuilder,
      (Animal, $$AnimalsTableReferences),
      Animal,
      PrefetchHooks Function({bool landId})
    >;
typedef $$PhotosTableCreateCompanionBuilder =
    PhotosCompanion Function({
      required String id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      required String ownerType,
      required String ownerId,
      Value<String?> landId,
      required String fileName,
      required DateTime takenAt,
      Value<double?> lat,
      Value<double?> lng,
      Value<int> rowid,
    });
typedef $$PhotosTableUpdateCompanionBuilder =
    PhotosCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> ownerType,
      Value<String> ownerId,
      Value<String?> landId,
      Value<String> fileName,
      Value<DateTime> takenAt,
      Value<double?> lat,
      Value<double?> lng,
      Value<int> rowid,
    });

class $$PhotosTableFilterComposer extends Composer<_$AppDb, $PhotosTable> {
  $$PhotosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerType => $composableBuilder(
    column: $table.ownerType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get landId => $composableBuilder(
    column: $table.landId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get takenAt => $composableBuilder(
    column: $table.takenAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PhotosTableOrderingComposer extends Composer<_$AppDb, $PhotosTable> {
  $$PhotosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerType => $composableBuilder(
    column: $table.ownerType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get landId => $composableBuilder(
    column: $table.landId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get takenAt => $composableBuilder(
    column: $table.takenAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PhotosTableAnnotationComposer extends Composer<_$AppDb, $PhotosTable> {
  $$PhotosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get ownerType =>
      $composableBuilder(column: $table.ownerType, builder: (column) => column);

  GeneratedColumn<String> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumn<String> get landId =>
      $composableBuilder(column: $table.landId, builder: (column) => column);

  GeneratedColumn<String> get fileName =>
      $composableBuilder(column: $table.fileName, builder: (column) => column);

  GeneratedColumn<DateTime> get takenAt =>
      $composableBuilder(column: $table.takenAt, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lng =>
      $composableBuilder(column: $table.lng, builder: (column) => column);
}

class $$PhotosTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $PhotosTable,
          Photo,
          $$PhotosTableFilterComposer,
          $$PhotosTableOrderingComposer,
          $$PhotosTableAnnotationComposer,
          $$PhotosTableCreateCompanionBuilder,
          $$PhotosTableUpdateCompanionBuilder,
          (Photo, BaseReferences<_$AppDb, $PhotosTable, Photo>),
          Photo,
          PrefetchHooks Function()
        > {
  $$PhotosTableTableManager(_$AppDb db, $PhotosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PhotosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PhotosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PhotosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> ownerType = const Value.absent(),
                Value<String> ownerId = const Value.absent(),
                Value<String?> landId = const Value.absent(),
                Value<String> fileName = const Value.absent(),
                Value<DateTime> takenAt = const Value.absent(),
                Value<double?> lat = const Value.absent(),
                Value<double?> lng = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PhotosCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                ownerType: ownerType,
                ownerId: ownerId,
                landId: landId,
                fileName: fileName,
                takenAt: takenAt,
                lat: lat,
                lng: lng,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String ownerType,
                required String ownerId,
                Value<String?> landId = const Value.absent(),
                required String fileName,
                required DateTime takenAt,
                Value<double?> lat = const Value.absent(),
                Value<double?> lng = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PhotosCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                ownerType: ownerType,
                ownerId: ownerId,
                landId: landId,
                fileName: fileName,
                takenAt: takenAt,
                lat: lat,
                lng: lng,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PhotosTable, Photo>(table),
                  BaseReferences<_$AppDb, $PhotosTable, Photo>(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PhotosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $PhotosTable,
      Photo,
      $$PhotosTableFilterComposer,
      $$PhotosTableOrderingComposer,
      $$PhotosTableAnnotationComposer,
      $$PhotosTableCreateCompanionBuilder,
      $$PhotosTableUpdateCompanionBuilder,
      (Photo, BaseReferences<_$AppDb, $PhotosTable, Photo>),
      Photo,
      PrefetchHooks Function()
    >;
typedef $$PickItemsTableCreateCompanionBuilder =
    PickItemsCompanion Function({
      required String id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      required String listName,
      required String code,
      required String label,
      Value<bool> active,
      Value<int> rowid,
    });
typedef $$PickItemsTableUpdateCompanionBuilder =
    PickItemsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> listName,
      Value<String> code,
      Value<String> label,
      Value<bool> active,
      Value<int> rowid,
    });

class $$PickItemsTableFilterComposer
    extends Composer<_$AppDb, $PickItemsTable> {
  $$PickItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get listName => $composableBuilder(
    column: $table.listName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PickItemsTableOrderingComposer
    extends Composer<_$AppDb, $PickItemsTable> {
  $$PickItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get listName => $composableBuilder(
    column: $table.listName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PickItemsTableAnnotationComposer
    extends Composer<_$AppDb, $PickItemsTable> {
  $$PickItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get listName =>
      $composableBuilder(column: $table.listName, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);
}

class $$PickItemsTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $PickItemsTable,
          PickItem,
          $$PickItemsTableFilterComposer,
          $$PickItemsTableOrderingComposer,
          $$PickItemsTableAnnotationComposer,
          $$PickItemsTableCreateCompanionBuilder,
          $$PickItemsTableUpdateCompanionBuilder,
          (PickItem, BaseReferences<_$AppDb, $PickItemsTable, PickItem>),
          PickItem,
          PrefetchHooks Function()
        > {
  $$PickItemsTableTableManager(_$AppDb db, $PickItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PickItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PickItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PickItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> listName = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PickItemsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                listName: listName,
                code: code,
                label: label,
                active: active,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String listName,
                required String code,
                required String label,
                Value<bool> active = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PickItemsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                listName: listName,
                code: code,
                label: label,
                active: active,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PickItemsTable, PickItem>(table),
                  BaseReferences<_$AppDb, $PickItemsTable, PickItem>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PickItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $PickItemsTable,
      PickItem,
      $$PickItemsTableFilterComposer,
      $$PickItemsTableOrderingComposer,
      $$PickItemsTableAnnotationComposer,
      $$PickItemsTableCreateCompanionBuilder,
      $$PickItemsTableUpdateCompanionBuilder,
      (PickItem, BaseReferences<_$AppDb, $PickItemsTable, PickItem>),
      PickItem,
      PrefetchHooks Function()
    >;
typedef $$ChangeLogsTableCreateCompanionBuilder =
    ChangeLogsCompanion Function({
      Value<int> seq,
      required String entity,
      required String recordId,
      Value<String?> landId,
      required String action,
      required String changes,
      required DateTime at,
    });
typedef $$ChangeLogsTableUpdateCompanionBuilder =
    ChangeLogsCompanion Function({
      Value<int> seq,
      Value<String> entity,
      Value<String> recordId,
      Value<String?> landId,
      Value<String> action,
      Value<String> changes,
      Value<DateTime> at,
    });

class $$ChangeLogsTableFilterComposer
    extends Composer<_$AppDb, $ChangeLogsTable> {
  $$ChangeLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get seq => $composableBuilder(
    column: $table.seq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entity => $composableBuilder(
    column: $table.entity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordId => $composableBuilder(
    column: $table.recordId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get landId => $composableBuilder(
    column: $table.landId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get changes => $composableBuilder(
    column: $table.changes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get at => $composableBuilder(
    column: $table.at,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ChangeLogsTableOrderingComposer
    extends Composer<_$AppDb, $ChangeLogsTable> {
  $$ChangeLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get seq => $composableBuilder(
    column: $table.seq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entity => $composableBuilder(
    column: $table.entity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordId => $composableBuilder(
    column: $table.recordId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get landId => $composableBuilder(
    column: $table.landId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get changes => $composableBuilder(
    column: $table.changes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get at => $composableBuilder(
    column: $table.at,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ChangeLogsTableAnnotationComposer
    extends Composer<_$AppDb, $ChangeLogsTable> {
  $$ChangeLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get seq =>
      $composableBuilder(column: $table.seq, builder: (column) => column);

  GeneratedColumn<String> get entity =>
      $composableBuilder(column: $table.entity, builder: (column) => column);

  GeneratedColumn<String> get recordId =>
      $composableBuilder(column: $table.recordId, builder: (column) => column);

  GeneratedColumn<String> get landId =>
      $composableBuilder(column: $table.landId, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get changes =>
      $composableBuilder(column: $table.changes, builder: (column) => column);

  GeneratedColumn<DateTime> get at =>
      $composableBuilder(column: $table.at, builder: (column) => column);
}

class $$ChangeLogsTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $ChangeLogsTable,
          ChangeLog,
          $$ChangeLogsTableFilterComposer,
          $$ChangeLogsTableOrderingComposer,
          $$ChangeLogsTableAnnotationComposer,
          $$ChangeLogsTableCreateCompanionBuilder,
          $$ChangeLogsTableUpdateCompanionBuilder,
          (ChangeLog, BaseReferences<_$AppDb, $ChangeLogsTable, ChangeLog>),
          ChangeLog,
          PrefetchHooks Function()
        > {
  $$ChangeLogsTableTableManager(_$AppDb db, $ChangeLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChangeLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChangeLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChangeLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> seq = const Value.absent(),
                Value<String> entity = const Value.absent(),
                Value<String> recordId = const Value.absent(),
                Value<String?> landId = const Value.absent(),
                Value<String> action = const Value.absent(),
                Value<String> changes = const Value.absent(),
                Value<DateTime> at = const Value.absent(),
              }) => ChangeLogsCompanion(
                seq: seq,
                entity: entity,
                recordId: recordId,
                landId: landId,
                action: action,
                changes: changes,
                at: at,
              ),
          createCompanionCallback:
              ({
                Value<int> seq = const Value.absent(),
                required String entity,
                required String recordId,
                Value<String?> landId = const Value.absent(),
                required String action,
                required String changes,
                required DateTime at,
              }) => ChangeLogsCompanion.insert(
                seq: seq,
                entity: entity,
                recordId: recordId,
                landId: landId,
                action: action,
                changes: changes,
                at: at,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ChangeLogsTable, ChangeLog>(table),
                  BaseReferences<_$AppDb, $ChangeLogsTable, ChangeLog>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ChangeLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $ChangeLogsTable,
      ChangeLog,
      $$ChangeLogsTableFilterComposer,
      $$ChangeLogsTableOrderingComposer,
      $$ChangeLogsTableAnnotationComposer,
      $$ChangeLogsTableCreateCompanionBuilder,
      $$ChangeLogsTableUpdateCompanionBuilder,
      (ChangeLog, BaseReferences<_$AppDb, $ChangeLogsTable, ChangeLog>),
      ChangeLog,
      PrefetchHooks Function()
    >;
typedef $$SettingsTableCreateCompanionBuilder =
    SettingsCompanion Function({
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$SettingsTableUpdateCompanionBuilder =
    SettingsCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$SettingsTableFilterComposer extends Composer<_$AppDb, $SettingsTable> {
  $$SettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDb, $SettingsTable> {
  $$SettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDb, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$SettingsTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $SettingsTable,
          Setting,
          $$SettingsTableFilterComposer,
          $$SettingsTableOrderingComposer,
          $$SettingsTableAnnotationComposer,
          $$SettingsTableCreateCompanionBuilder,
          $$SettingsTableUpdateCompanionBuilder,
          (Setting, BaseReferences<_$AppDb, $SettingsTable, Setting>),
          Setting,
          PrefetchHooks Function()
        > {
  $$SettingsTableTableManager(_$AppDb db, $SettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SettingsCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => SettingsCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SettingsTable, Setting>(table),
                  BaseReferences<_$AppDb, $SettingsTable, Setting>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $SettingsTable,
      Setting,
      $$SettingsTableFilterComposer,
      $$SettingsTableOrderingComposer,
      $$SettingsTableAnnotationComposer,
      $$SettingsTableCreateCompanionBuilder,
      $$SettingsTableUpdateCompanionBuilder,
      (Setting, BaseReferences<_$AppDb, $SettingsTable, Setting>),
      Setting,
      PrefetchHooks Function()
    >;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$DivisionsTableTableManager get divisions =>
      $$DivisionsTableTableManager(_db, _db.divisions);
  $$VillagesTableTableManager get villages =>
      $$VillagesTableTableManager(_db, _db.villages);
  $$HouseGroupsTableTableManager get houseGroups =>
      $$HouseGroupsTableTableManager(_db, _db.houseGroups);
  $$LandsTableTableManager get lands =>
      $$LandsTableTableManager(_db, _db.lands);
  $$BuildingsTableTableManager get buildings =>
      $$BuildingsTableTableManager(_db, _db.buildings);
  $$FamiliesTableTableManager get families =>
      $$FamiliesTableTableManager(_db, _db.families);
  $$PersonsTableTableManager get persons =>
      $$PersonsTableTableManager(_db, _db.persons);
  $$LandPartiesTableTableManager get landParties =>
      $$LandPartiesTableTableManager(_db, _db.landParties);
  $$ResidenceEventsTableTableManager get residenceEvents =>
      $$ResidenceEventsTableTableManager(_db, _db.residenceEvents);
  $$TreeCountsTableTableManager get treeCounts =>
      $$TreeCountsTableTableManager(_db, _db.treeCounts);
  $$TreesTableTableManager get trees =>
      $$TreesTableTableManager(_db, _db.trees);
  $$CropsTableTableManager get crops =>
      $$CropsTableTableManager(_db, _db.crops);
  $$AnimalsTableTableManager get animals =>
      $$AnimalsTableTableManager(_db, _db.animals);
  $$PhotosTableTableManager get photos =>
      $$PhotosTableTableManager(_db, _db.photos);
  $$PickItemsTableTableManager get pickItems =>
      $$PickItemsTableTableManager(_db, _db.pickItems);
  $$ChangeLogsTableTableManager get changeLogs =>
      $$ChangeLogsTableTableManager(_db, _db.changeLogs);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
}
