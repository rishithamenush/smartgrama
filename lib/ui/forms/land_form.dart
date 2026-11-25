import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';

import '../../app_state.dart';
import '../../data/bundle.dart';
import '../../data/database.dart';
import '../../data/picklists.dart';
import '../../data/units.dart';
import '../widgets/common.dart';
import '../widgets/fields.dart';
import '../widgets/brand.dart';
import '../../l10n/l10n.dart';

enum ExtentMode { arp, perches, hectares }

/// Create / edit a land. Pops with the land id when saved.
class LandForm extends StatefulWidget {
  const LandForm({super.key, this.land});
  final Land? land;

  @override
  State<LandForm> createState() => _LandFormState();
}

class _LandFormState extends State<LandForm> {
  final db = AppState.db;
  Snapshot? _s;
  String? _groupId;

  late final Land? l = widget.land;
  late final _name = TextEditingController(text: l?.name);
  late final _address = TextEditingController(text: l?.addressText);
  double? _lat, _lng, _acc;

  ExtentMode _mode = ExtentMode.arp;
  final _acres = TextEditingController();
  final _roods = TextEditingController();
  final _perches = TextEditingController();
  final _single = TextEditingController();
  String? _extentSource;

  String? _ownership, _landUse, _subdivision;
  late final _deed = TextEditingController(text: l?.deedNo);
  late final _plan = TextEditingController(text: l?.planNo);
  late final _lot = TextEditingController(text: l?.lotNo);
  late final _scheme = TextEditingController(text: l?.schemeName);
  late final _n = TextEditingController(text: l?.boundaryNorth);
  late final _e = TextEditingController(text: l?.boundaryEast);
  late final _so = TextEditingController(text: l?.boundarySouth);
  late final _w = TextEditingController(text: l?.boundaryWest);
  late bool _dispute = l?.hasDispute ?? false;
  late final _disputeNote = TextEditingController(text: l?.disputeNote);
  late final _notes = TextEditingController(text: l?.notes);
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _lat = l?.lat;
    _lng = l?.lng;
    _acc = l?.gpsAccuracy;
    _extentSource = l?.extentSource;
    _ownership = l?.ownershipType;
    _landUse = l?.landUse;
    _subdivision = l?.subdivisionAllowed;
    if (l?.extentPerches != null) {
      final a = perchesToArp(l!.extentPerches!);
      _acres.text = a.acres == 0 ? '' : '${a.acres}';
      _roods.text = a.roods == 0 ? '' : '${a.roods}';
      _perches.text = numText(a.perches);
    }
    _load();
  }

  Future<void> _load() async {
    final s = await db.loadSnapshot();
    final last = await db.getSetting('last_group');
    setState(() {
      _s = s;
      _groupId = l?.houseGroupId ??
          (s.groups.any((g) => g.id == last) ? last : s.groups.firstOrNull?.id);
    });
  }

  double? get _extent {
    switch (_mode) {
      case ExtentMode.arp:
        if (txt(_acres) == null && txt(_roods) == null && txt(_perches) == null) return null;
        return arpToPerches(
            acres: dblOf(_acres) ?? 0, roods: dblOf(_roods) ?? 0, perches: dblOf(_perches) ?? 0);
      case ExtentMode.perches:
        return dblOf(_single);
      case ExtentMode.hectares:
        final h = dblOf(_single);
        return h == null ? null : hectaresToPerches(h);
    }
  }

  Future<void> _pickGroup() async {
    final s = _s!;
    final r = await showModalBottomSheet<String>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (c) => ListView(
        shrinkWrap: true,
        children: [
          for (final v in s.villages) ...[
            ListTile(title: Text(v.name, style: Theme.of(c).textTheme.titleMedium)),
            for (final g in s.groups.where((g) => g.villageId == v.id))
              ListTile(
                contentPadding: const EdgeInsets.only(left: 32, right: 16),
                leading: Icon(g.id == _groupId ? Icons.radio_button_checked : Icons.radio_button_off),
                title: Text(g.code),
                subtitle: g.leaderName == null ? null : Text(g.leaderName!),
                onTap: () => Navigator.pop(c, g.id),
              ),
          ],
        ],
      ),
    );
    if (r != null) setState(() => _groupId = r);
  }

  Future<void> _save() async {
    final t = context.l10n;
    if (txt(_name) == null) {
      snack(context, t.landNameRequired);
      return;
    }
    if (_groupId == null) {
      snack(context, t.selectHouseGroup);
      return;
    }
    final extent = _extent;
    if (extent != null && extent <= 0) {
      snack(context, t.extentInvalid);
      return;
    }
    final oddArp = _mode == ExtentMode.arp &&
        ((dblOf(_roods) ?? 0) >= 4 ||
            ((dblOf(_perches) ?? 0) >= 40 && (txt(_acres) != null || txt(_roods) != null)));
    if (oddArp) {
      final ok = await confirm(context, t.arpOddConfirm(formatExtent(extent)));
      if (!ok) return;
    }
    if (extent != null && _extentSource == null) {
      _extentSource = 'estimate';
    }
    setState(() => _busy = true);
    final id = l?.id ?? newId();
    final dup = txt(_deed) == null
        ? <Land>[]
        : await (db.select(db.lands)
              ..where((x) => x.deedNo.equals(txt(_deed)!) & x.deletedAt.isNull() & x.id.equals(id).not()))
            .get();
    if (dup.isNotEmpty && mounted) {
      final ok = await confirm(context, t.deedDupConfirm(txt(_deed)!, dup.first.name));
      if (!ok) {
        setState(() => _busy = false);
        return;
      }
    }
    await db.saveRow(
      db.lands,
      id,
      LandsCompanion(
        id: Value(id),
        houseGroupId: Value(_groupId!),
        name: Value(txt(_name)!),
        addressText: Value(txt(_address)),
        lat: Value(_lat),
        lng: Value(_lng),
        gpsAccuracy: Value(_acc),
        extentPerches: Value(extent),
        extentSource: Value(extent == null ? null : _extentSource),
        ownershipType: Value(_ownership),
        deedNo: Value(txt(_deed)),
        planNo: Value(txt(_plan)),
        lotNo: Value(txt(_lot)),
        schemeName: Value(txt(_scheme)),
        boundaryNorth: Value(txt(_n)),
        boundaryEast: Value(txt(_e)),
        boundarySouth: Value(txt(_so)),
        boundaryWest: Value(txt(_w)),
        landUse: Value(_landUse),
        subdivisionAllowed: Value(_subdivision),
        hasDispute: Value(_dispute),
        disputeNote: Value(_dispute ? txt(_disputeNote) : null),
        notes: Value(txt(_notes)),
      ),
      landId: id,
    );
    await db.setSetting('last_group', _groupId!);
    if (mounted) Navigator.pop(context, id);
  }

  @override
  Widget build(BuildContext context) {
    final s = _s;
    final group = s?.groupById[_groupId];
    final village = s?.villageById[group?.villageId];
    final extent = _extent;
    final t = context.l10n;
    return Scaffold(
      appBar: BrandAppBar(title: Text(l == null ? t.landNew : t.landEdit)),
      bottomNavigationBar: SaveBar(onSave: _save, busy: _busy || s == null),
      body: s == null
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
              children: [
                InkWell(
                  onTap: _pickGroup,
                  child: InputDecorator(
                    decoration: InputDecoration(
                        labelText: t.villageGroupField, suffixIcon: const Icon(Icons.arrow_drop_down)),
                    child: Text(group == null ? '' : '${village?.name ?? ''} — ${group.code}'),
                  ),
                ),
                const SizedBox(height: 6),
                TF(_name, t.landNameField, hint: t.landNameHint),
                TF(_address, t.addressField, maxLines: 2),
                GpsField(
                  lat: _lat,
                  lng: _lng,
                  accuracy: _acc,
                  onChanged: (a, b, c) => setState(() {
                    _lat = a;
                    _lng = b;
                    _acc = c;
                  }),
                ),
                SectionTitle(t.fExtent),
                SegmentedButton<ExtentMode>(
                  segments: [
                    ButtonSegment(value: ExtentMode.arp, label: Text(t.unitArp)),
                    ButtonSegment(value: ExtentMode.perches, label: Text(t.unitPerches)),
                    ButtonSegment(value: ExtentMode.hectares, label: Text(t.unitHectares)),
                  ],
                  selected: {_mode},
                  onSelectionChanged: (v) => setState(() {
                    final current = _extent;
                    _mode = v.first;
                    if (current != null) {
                      _single.text = _mode == ExtentMode.hectares
                          ? perchesToHectares(current).toStringAsFixed(4)
                          : numText(double.parse(current.toStringAsFixed(2)));
                    }
                  }),
                ),
                const SizedBox(height: 8),
                if (_mode == ExtentMode.arp)
                  Row(children: [
                    Expanded(child: TF(_acres, t.unitAcres, decimal: true, onChanged: (_) => setState(() {}))),
                    const SizedBox(width: 8),
                    Expanded(child: TF(_roods, t.unitRoods, decimal: true, onChanged: (_) => setState(() {}))),
                    const SizedBox(width: 8),
                    Expanded(child: TF(_perches, t.unitPerches, decimal: true, onChanged: (_) => setState(() {}))),
                  ])
                else
                  TF(_single, _mode == ExtentMode.perches ? t.unitPerches : t.unitHectares,
                      decimal: true, onChanged: (_) => setState(() {})),
                if (extent != null)
                  Text('= ${formatExtent(extent)} = ${formatHectares(extent)}',
                      style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                PickField(
                    list: PL.extentSource,
                    value: _extentSource,
                    onChanged: (v) => setState(() => _extentSource = v)),
                SectionTitle(t.fOwnership),
                PickField(
                    list: PL.ownership,
                    value: _ownership,
                    onChanged: (v) => setState(() => _ownership = v)),
                Row(children: [
                  Expanded(child: TF(_deed, t.fDeedPermitNo)),
                  const SizedBox(width: 8),
                  Expanded(child: TF(_plan, t.fPlanNo)),
                ]),
                Row(children: [
                  Expanded(child: TF(_lot, t.fLotNo)),
                  const SizedBox(width: 8),
                  Expanded(child: TF(_scheme, t.fScheme)),
                ]),
                PickField(
                    list: PL.yesNoUnknown,
                    label: t.subdivisionAllowed,
                    value: _subdivision,
                    onChanged: (v) => setState(() => _subdivision = v)),
                Text(t.ownersAddLater(t.people), style: const TextStyle(fontSize: 12)),
                SectionTitle(t.boundaries),
                TF(_n, t.fNorth),
                TF(_e, t.fEast),
                TF(_so, t.fSouth),
                TF(_w, t.fWest),
                SectionTitle(t.fUse),
                PickField(list: PL.landUse, value: _landUse, onChanged: (v) => setState(() => _landUse = v)),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(t.hasDispute),
                  value: _dispute,
                  onChanged: (v) => setState(() => _dispute = v),
                ),
                if (_dispute) TF(_disputeNote, t.disputeNote, maxLines: 2),
                TF(_notes, t.otherNotes, maxLines: 3),
              ],
            ),
    );
  }
}
