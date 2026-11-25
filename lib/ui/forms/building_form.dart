import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';

import '../../app_state.dart';
import '../../data/bundle.dart';
import '../../data/database.dart';
import '../../data/picklists.dart';
import '../widgets/common.dart';
import '../widgets/fields.dart';
import '../widgets/brand.dart';

/// Suggests permanence from materials (officer can override).
String? suggestPermanence(String? wall, String? roof, String? floor) {
  if (wall == null || roof == null) return null;
  const strongWall = {'brick', 'cement_block', 'cabook'};
  const strongRoof = {'tile', 'asbestos', 'metal_sheet', 'concrete'};
  const weakWall = {'mud', 'wood', 'metal_sheet'};
  if (roof == 'cadjan' && weakWall.contains(wall)) return 'temporary';
  if (strongWall.contains(wall) && strongRoof.contains(roof) && floor != 'mud') return 'permanent';
  return 'semi';
}

class BuildingForm extends StatefulWidget {
  const BuildingForm({super.key, required this.landId, this.building, this.initialType});
  final String landId;
  final Building? building;
  final String? initialType;

  @override
  State<BuildingForm> createState() => _BuildingFormState();
}

class _BuildingFormState extends State<BuildingForm> {
  final db = AppState.db;
  late final Building? b = widget.building;
  late final String _id = b?.id ?? newId();
  late String? _type = b?.type ?? widget.initialType ?? 'house';
  late final _no = TextEditingController(text: b?.buildingNo);
  late final _floors = TextEditingController(text: numText(b?.floors));
  late final _area = TextEditingController(text: numText(b?.floorAreaSqft));
  late final _rooms = TextEditingController(text: numText(b?.rooms));
  late final _year = TextEditingController(text: numText(b?.yearBuilt));
  late final _notes = TextEditingController(text: b?.notes);
  late String? _wall = b?.wall,
      _roof = b?.roof,
      _floor = b?.floor,
      _perm = b?.permanence,
      _cond = b?.condition,
      _usage = b?.usage,
      _elec = b?.electricity,
      _water = b?.waterSource,
      _toilet = b?.toilet,
      _approval = b?.approval;
  late double? _lat = b?.lat, _lng = b?.lng;
  bool _permTouched = false;
  bool _busy = false;
  bool _saved = false;

  @override
  void dispose() {
    // Photos taken for a new building that was never saved.
    if (b == null && !_saved) {
      (db.select(db.photos)..where((p) => p.ownerId.equals(_id))).get().then((ps) async {
        for (final p in ps) {
          await db.softDelete(db.photos, p.id, landId: widget.landId);
        }
      });
    }
    super.dispose();
  }

  bool get _isHouse => _type == 'house';
  bool get _isStructure => !const {'well', 'toilet'}.contains(_type);

  void _materials() {
    if (_permTouched) return;
    final s = suggestPermanence(_wall, _roof, _floor);
    if (s != null) _perm = s;
  }

  Future<void> _save() async {
    if (_type == null) {
      snack(context, 'ගොඩනැගිලි වර්ගය තෝරන්න');
      return;
    }
    final year = intOf(_year);
    if (year != null && (year < 1800 || year > DateTime.now().year)) {
      snack(context, 'ඉදිකළ වර්ෂය වලංගු නැත');
      return;
    }
    setState(() => _busy = true);
    await db.saveRow(
      db.buildings,
      _id,
      BuildingsCompanion(
        id: Value(_id),
        landId: Value(widget.landId),
        type: Value(_type!),
        buildingNo: Value(txt(_no)),
        floors: Value(_isStructure ? intOf(_floors) : null),
        floorAreaSqft: Value(_isStructure ? dblOf(_area) : null),
        rooms: Value(_isHouse ? intOf(_rooms) : null),
        wall: Value(_isStructure ? _wall : null),
        roof: Value(_isStructure ? _roof : null),
        floor: Value(_isStructure ? _floor : null),
        permanence: Value(_isStructure ? _perm : null),
        condition: Value(_cond),
        yearBuilt: Value(year),
        usage: Value(_isStructure ? _usage : null),
        electricity: Value(_isStructure ? _elec : null),
        waterSource: Value(_isHouse ? _water : null),
        toilet: Value(_isHouse ? _toilet : null),
        approval: Value(_isStructure ? _approval : null),
        lat: Value(_lat),
        lng: Value(_lng),
        notes: Value(txt(_notes)),
      ),
      landId: widget.landId,
    );
    _saved = true;
    if (mounted) Navigator.pop(context, _id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BrandAppBar(
        title: Text(b == null ? 'නව ගොඩනැගිල්ලක්' : pl(PL.buildingType, b!.type)),
        actions: [
          if (b != null)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () async {
                if (await confirm(context,
                    'මෙම ගොඩනැගිල්ල සහ එහි ජීවත් වන පවුල් ඉවත් කරන්නද? (ඉතිහාසයේ රැඳේ)',
                    danger: true)) {
                  await db.deleteBuildingCascade(b!.id, widget.landId);
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
              list: PL.buildingType,
              value: _type,
              required: true,
              onChanged: (v) => setState(() => _type = v)),
          TF(_no, 'ගෘහ / ගොඩනැගිලි අංකය', hint: 'ප්‍රාදේශීය සභා අංකය ඇත්නම්'),
          if (_isStructure) ...[
            Row(children: [
              Expanded(child: TF(_floors, 'මහල් ගණන', number: true)),
              const SizedBox(width: 8),
              Expanded(child: TF(_area, 'බිම් ප්‍රමාණය (වර්ග අඩි)', decimal: true)),
            ]),
            if (_isHouse) TF(_rooms, 'කාමර ගණන', number: true),
            const SectionTitle('ඉදිකිරීම් ද්‍රව්‍ය'),
            PickField(list: PL.wall, value: _wall, onChanged: (v) => setState(() { _wall = v; _materials(); })),
            PickField(list: PL.roof, value: _roof, onChanged: (v) => setState(() { _roof = v; _materials(); })),
            PickField(list: PL.floor, value: _floor, onChanged: (v) => setState(() { _floor = v; _materials(); })),
            PickField(
                list: PL.permanence,
                value: _perm,
                onChanged: (v) => setState(() {
                      _perm = v;
                      _permTouched = true;
                    })),
          ],
          PickField(list: PL.condition, value: _cond, onChanged: (v) => setState(() => _cond = v)),
          TF(_year, 'ඉදිකළ වර්ෂය (දළ වශයෙන්)', number: true),
          if (_isStructure) ...[
            PickField(list: PL.buildingUsage, value: _usage, onChanged: (v) => setState(() => _usage = v)),
            const SectionTitle('පහසුකම්'),
            PickField(list: PL.electricity, value: _elec, onChanged: (v) => setState(() => _elec = v)),
          ],
          if (_isHouse) ...[
            PickField(list: PL.water, value: _water, onChanged: (v) => setState(() => _water = v)),
            PickField(list: PL.toilet, value: _toilet, onChanged: (v) => setState(() => _toilet = v)),
          ],
          if (_isStructure)
            PickField(
                list: PL.yesNoUnknown,
                label: 'ඉදිකිරීම් අනුමැතිය',
                value: _approval,
                onChanged: (v) => setState(() => _approval = v)),
          GpsField(
            lat: _lat,
            lng: _lng,
            onChanged: (a, b, _) => setState(() {
              _lat = a;
              _lng = b;
            }),
          ),
          const SectionTitle('ඡායාරූප'),
          StreamBuilder<List<Photo>>(
            stream: (db.select(db.photos)
                  ..where((p) => p.ownerId.equals(_id) & p.deletedAt.isNull()))
                .watch(),
            builder: (c, s) => PhotoStrip(
              ownerType: 'building',
              ownerId: _id,
              landId: widget.landId,
              photos: s.data ?? const [],
            ),
          ),
          if (_isHouse)
            const Padding(
              padding: EdgeInsets.only(top: 4),
              child: Text('නිවසේ ඉදිරිපස ඡායාරූපයක් අනිවාර්යයි.', style: TextStyle(fontSize: 12)),
            ),
          TF(_notes, 'සටහන්', maxLines: 2),
        ],
      ),
    );
  }
}
