import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';

import '../../app_state.dart';
import '../../data/database.dart';
import '../../data/picklists.dart';
import '../widgets/common.dart';
import '../widgets/fields.dart';
import '../widgets/brand.dart';
import '../../l10n/l10n.dart';

// ===================================================================
// Counted trees: one screen with ➕➖ for every species
// ===================================================================

const _quickSpecies = ['coconut', 'jak', 'breadfruit', 'mango', 'arecanut', 'banana', 'pepper', 'kitul'];

class _Row {
  _Row(this.species, this.bearing, this.young, this.existing);
  final String species;
  int bearing;
  int young;
  final TreeCount? existing;
}

class TreeCountsScreen extends StatefulWidget {
  const TreeCountsScreen({super.key, required this.landId, required this.existing});
  final String landId;
  final List<TreeCount> existing;

  @override
  State<TreeCountsScreen> createState() => _TreeCountsScreenState();
}

class _TreeCountsScreenState extends State<TreeCountsScreen> {
  final db = AppState.db;
  late final List<_Row> _rows = [
    for (final t in widget.existing) _Row(t.species, t.bearing, t.young, t),
  ];
  bool _busy = false;

  void _addSpecies(String code) {
    if (_rows.any((r) => r.species == code)) return;
    setState(() => _rows.add(_Row(code, 0, 0, null)));
  }

  Future<void> _save() async {
    setState(() => _busy = true);
    await db.transaction(() async {
      for (final r in _rows) {
        final empty = r.bearing == 0 && r.young == 0;
        if (r.existing == null) {
          if (empty) continue;
          final id = newId();
          await db.saveRow(
            db.treeCounts,
            id,
            TreeCountsCompanion.insert(
                id: id, landId: widget.landId, species: r.species, bearing: Value(r.bearing), young: Value(r.young)),
            landId: widget.landId,
          );
        } else if (empty) {
          await db.softDelete(db.treeCounts, r.existing!.id, landId: widget.landId);
        } else if (r.bearing != r.existing!.bearing || r.young != r.existing!.young) {
          await db.saveRow(
            db.treeCounts,
            r.existing!.id,
            TreeCountsCompanion(bearing: Value(r.bearing), young: Value(r.young)),
            landId: widget.landId,
          );
        }
      }
    });
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final missingQuick = _quickSpecies.where((c) => !_rows.any((r) => r.species == c));
    final total = _rows.fold<int>(0, (s, r) => s + r.bearing + r.young);
    final t = context.l10n;
    return Scaffold(
      appBar: BrandAppBar(title: Text(t.treeCountTitle(total))),
      bottomNavigationBar: SaveBar(onSave: _save, busy: _busy),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 32),
        children: [
          for (final r in _rows)
            Card(
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(pl(PL.treeCountSpecies, r.species), style: Theme.of(context).textTheme.titleMedium),
                    CountStepper(
                        label: t.fBearing, value: r.bearing, onChanged: (v) => setState(() => r.bearing = v)),
                    CountStepper(
                        label: t.youngNotBearing, value: r.young, onChanged: (v) => setState(() => r.young = v)),
                  ],
                ),
              ),
            ),
          SectionTitle(t.addSpecies),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              for (final c in missingQuick)
                ActionChip(
                  avatar: const Icon(Icons.add, size: 18),
                  label: Text(pl(PL.treeCountSpecies, c)),
                  onPressed: () => _addSpecies(c),
                ),
              ActionChip(
                avatar: const Icon(Icons.list, size: 18),
                label: Text(t.otherSpecies),
                onPressed: () async {
                  final c = await showPickSheet(context, PL.treeCountSpecies, null);
                  if (c != null && c.isNotEmpty) _addSpecies(c);
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(t.timberHint(t.singleTree), style: const TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}

// ===================================================================
// Single valuable tree
// ===================================================================

class SingleTreeForm extends StatefulWidget {
  const SingleTreeForm({super.key, required this.landId, this.tree});
  final String landId;
  final Tree? tree;

  @override
  State<SingleTreeForm> createState() => _SingleTreeFormState();
}

class _SingleTreeFormState extends State<SingleTreeForm> {
  final db = AppState.db;
  late final Tree? t = widget.tree;
  late final String _id = t?.id ?? newId();
  late String? _species = t?.species, _condition = t?.condition ?? 'healthy';
  late final _girth = TextEditingController(text: numText(t?.girthIn));
  late final _height = TextEditingController(text: numText(t?.heightFt));
  late final _age = TextEditingController(text: numText(t?.ageYears));
  late final _note = TextEditingController(text: t?.note);
  late bool _hazard = t?.isHazard ?? false;
  late double? _lat = t?.lat, _lng = t?.lng;
  bool _busy = false;

  Future<void> _save() async {
    if (_species == null) {
      snack(context, context.l10n.selectTreeSpecies);
      return;
    }
    final girth = dblOf(_girth);
    if (girth != null && (girth <= 0 || girth > 600)) {
      snack(context, context.l10n.girthInvalid);
      return;
    }
    setState(() => _busy = true);
    await db.saveRow(
      db.trees,
      _id,
      TreesCompanion(
        id: Value(_id),
        landId: Value(widget.landId),
        species: Value(_species!),
        girthIn: Value(girth),
        heightFt: Value(dblOf(_height)),
        ageYears: Value(intOf(_age)),
        condition: Value(_condition),
        isHazard: Value(_hazard),
        lat: Value(_lat),
        lng: Value(_lng),
        note: Value(txt(_note)),
      ),
      landId: widget.landId,
    );
    if (mounted) Navigator.pop(context, _id);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: BrandAppBar(
        title: Text(t == null ? l10n.singleTree : pl(PL.treeSingleSpecies, t!.species)),
        actions: [
          if (t != null)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () async {
                if (await confirm(context, l10n.treeDeleteConfirm, danger: true)) {
                  await db.softDelete(db.trees, t!.id, landId: widget.landId);
                  if (context.mounted) Navigator.pop(context);
                }
              },
            ),
        ],
      ),
      bottomNavigationBar: SaveBar(onSave: _save, busy: _busy),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        children: [
          PickField(
              list: PL.treeSingleSpecies,
              value: _species,
              required: true,
              onChanged: (v) => setState(() => _species = v)),
          TF(_girth, l10n.girthField, decimal: true, hint: l10n.girthHint),
          Row(children: [
            Expanded(child: TF(_height, l10n.heightField, decimal: true)),
            const SizedBox(width: 8),
            Expanded(child: TF(_age, l10n.treeAgeField, number: true)),
          ]),
          PickField(list: PL.treeCondition, value: _condition, onChanged: (v) => setState(() => _condition = v)),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l10n.hazardousField),
            subtitle: Text(l10n.hazardousHint),
            value: _hazard,
            onChanged: (v) => setState(() => _hazard = v),
          ),
          GpsField(
            lat: _lat,
            lng: _lng,
            onChanged: (a, b, _) => setState(() {
              _lat = a;
              _lng = b;
            }),
          ),
          SectionTitle(l10n.photos),
          StreamBuilder<List<Photo>>(
            stream: (db.select(db.photos)..where((p) => p.ownerId.equals(_id) & p.deletedAt.isNull())).watch(),
            builder: (c, s) =>
                PhotoStrip(ownerType: 'tree', ownerId: _id, landId: widget.landId, photos: s.data ?? const []),
          ),
          TF(_note, l10n.note, maxLines: 2),
        ],
      ),
    );
  }
}

// ===================================================================
// Crop
// ===================================================================

class CropForm extends StatefulWidget {
  const CropForm({super.key, required this.landId, this.crop});
  final String landId;
  final Crop? crop;

  @override
  State<CropForm> createState() => _CropFormState();
}

class _CropFormState extends State<CropForm> {
  final db = AppState.db;
  late final Crop? c = widget.crop;
  late String? _crop = c?.crop,
      _unit = c?.extentUnit ?? 'perch',
      _season = c?.season,
      _cultivator = c?.cultivator,
      _irrigation = c?.irrigation;
  late final _value = TextEditingController(text: numText(c?.extentValue));
  late final _note = TextEditingController(text: c?.note);
  bool _busy = false;

  Future<void> _save() async {
    if (_crop == null) {
      snack(context, context.l10n.selectCrop);
      return;
    }
    setState(() => _busy = true);
    final id = c?.id ?? newId();
    await db.saveRow(
      db.crops,
      id,
      CropsCompanion(
        id: Value(id),
        landId: Value(widget.landId),
        crop: Value(_crop!),
        extentValue: Value(dblOf(_value)),
        extentUnit: Value(_unit),
        season: Value(_season),
        cultivator: Value(_cultivator),
        irrigation: Value(_irrigation),
        note: Value(txt(_note)),
      ),
      landId: widget.landId,
    );
    if (mounted) Navigator.pop(context, id);
  }

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return Scaffold(
      appBar: BrandAppBar(
        title: Text(c == null ? t.newCrop : pl(PL.crop, c!.crop)),
        actions: [
          if (c != null)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () async {
                if (await confirm(context, t.cropDeleteConfirm, danger: true)) {
                  await db.softDelete(db.crops, c!.id, landId: widget.landId);
                  if (context.mounted) Navigator.pop(context);
                }
              },
            ),
        ],
      ),
      bottomNavigationBar: SaveBar(onSave: _save, busy: _busy),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        children: [
          PickField(list: PL.crop, value: _crop, required: true, onChanged: (v) => setState(() => _crop = v)),
          TF(_value, t.fAmount, decimal: true),
          PickField(list: PL.cropUnit, value: _unit, onChanged: (v) => setState(() => _unit = v)),
          PickField(list: PL.season, value: _season, onChanged: (v) => setState(() => _season = v)),
          PickField(list: PL.cultivator, value: _cultivator, onChanged: (v) => setState(() => _cultivator = v)),
          PickField(list: PL.irrigation, value: _irrigation, onChanged: (v) => setState(() => _irrigation = v)),
          TF(_note, t.note, maxLines: 2),
        ],
      ),
    );
  }
}

// ===================================================================
// Animals
// ===================================================================

const _milkAnimals = {'cattle', 'buffalo', 'goat'};

class AnimalForm extends StatefulWidget {
  const AnimalForm({super.key, required this.landId, required this.families, this.animal, this.familyLabel});
  final String landId;
  final List<Family> families;
  final Animal? animal;

  /// Display name per family (e.g. "සිරිසේන ගේ පවුල" / "Sirisena's family").
  final String Function(Family f)? familyLabel;

  @override
  State<AnimalForm> createState() => _AnimalFormState();
}

class _AnimalFormState extends State<AnimalForm> {
  final db = AppState.db;
  late final Animal? a = widget.animal;
  late String? _species = a?.species,
      _purpose = a?.purpose,
      _housing = a?.housing,
      _vaccinated = a?.vaccinated,
      _familyId = a?.familyId ?? widget.families.firstOrNull?.id;
  late int _male = a?.male ?? 0, _female = a?.female ?? 0, _young = a?.young ?? 0;
  late final _milk = TextEditingController(text: numText(a?.dailyMilkL));
  late final _note = TextEditingController(text: a?.note);
  late DateTime? _lastVac = a?.lastVaccination;
  bool _busy = false;

  Future<void> _save() async {
    if (_species == null) {
      snack(context, context.l10n.selectAnimal);
      return;
    }
    if (_male + _female + _young == 0) {
      snack(context, context.l10n.enterCount);
      return;
    }
    final milk = dblOf(_milk);
    if (milk != null && _female > 0 && milk / _female > 40) {
      if (!await confirm(context, context.l10n.milkPerAnimalConfirm((milk / _female).toStringAsFixed(0)))) {
        return;
      }
    }
    setState(() => _busy = true);
    final id = a?.id ?? newId();
    await db.saveRow(
      db.animals,
      id,
      AnimalsCompanion(
        id: Value(id),
        landId: Value(widget.landId),
        familyId: Value(_familyId),
        species: Value(_species!),
        male: Value(_male),
        female: Value(_female),
        young: Value(_young),
        purpose: Value(_purpose),
        dailyMilkL: Value(_milkAnimals.contains(_species) ? milk : null),
        housing: Value(_housing),
        vaccinated: Value(_vaccinated),
        lastVaccination: Value(_vaccinated == 'yes' ? _lastVac : null),
        note: Value(txt(_note)),
      ),
      landId: widget.landId,
    );
    if (mounted) Navigator.pop(context, id);
  }

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return Scaffold(
      appBar: BrandAppBar(
        title: Text(a == null ? t.addAnimals : pl(PL.animal, a!.species)),
        actions: [
          if (a != null)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () async {
                if (await confirm(context, t.recordDeleteConfirm, danger: true)) {
                  await db.softDelete(db.animals, a!.id, landId: widget.landId);
                  if (context.mounted) Navigator.pop(context);
                }
              },
            ),
        ],
      ),
      bottomNavigationBar: SaveBar(onSave: _save, busy: _busy),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        children: [
          PickField(list: PL.animal, value: _species, required: true, onChanged: (v) => setState(() => _species = v)),
          const SizedBox(height: 8),
          CountStepper(label: t.fMaleAnimals, value: _male, onChanged: (v) => setState(() => _male = v)),
          CountStepper(label: t.fFemaleAnimals, value: _female, onChanged: (v) => setState(() => _female = v)),
          CountStepper(label: t.fYoungAnimals, value: _young, onChanged: (v) => setState(() => _young = v)),
          const Divider(),
          PickField(list: PL.animalPurpose, value: _purpose, onChanged: (v) => setState(() => _purpose = v)),
          if (_milkAnimals.contains(_species)) TF(_milk, t.dailyMilkField, decimal: true),
          PickField(list: PL.animalHousing, value: _housing, onChanged: (v) => setState(() => _housing = v)),
          PickField(
              list: PL.yesNoUnknown,
              label: _species == 'dog' ? t.rabiesVaccinated : t.vaccinatedQuestion,
              value: _vaccinated,
              onChanged: (v) => setState(() => _vaccinated = v)),
          if (_vaccinated == 'yes')
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.vaccines),
              title: Text(_lastVac == null ? t.lastVaccinationDate : t.lastVaccinationOn(dateFmt.format(_lastVac!))),
              trailing: const Icon(Icons.edit_calendar),
              onTap: () async {
                final d = await showDatePicker(
                    context: context,
                    initialDate: _lastVac ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now());
                if (d != null) setState(() => _lastVac = d);
              },
            ),
          if (widget.families.isNotEmpty) ...[
            SectionTitle(t.ownerFamily),
            for (final f in widget.families)
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(_familyId == f.id ? Icons.radio_button_checked : Icons.radio_button_off,
                    color: Theme.of(context).colorScheme.primary),
                title: Text(widget.familyLabel?.call(f) ?? t.family),
                onTap: () => setState(() => _familyId = f.id),
              ),
          ],
          TF(_note, t.note, maxLines: 2),
        ],
      ),
    );
  }
}
