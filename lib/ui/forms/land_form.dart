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
    if (txt(_name) == null) {
      snack(context, 'ඉඩමේ නම අනිවාර්යයි');
      return;
    }
    if (_groupId == null) {
      snack(context, 'ගෘහ කණ්ඩායම තෝරන්න');
      return;
    }
    final extent = _extent;
    if (extent != null && extent <= 0) {
      snack(context, 'ඉඩමේ ප්‍රමාණය වලංගු නැත');
      return;
    }
    final oddArp = _mode == ExtentMode.arp &&
        ((dblOf(_roods) ?? 0) >= 4 ||
            ((dblOf(_perches) ?? 0) >= 40 && (txt(_acres) != null || txt(_roods) != null)));
    if (oddArp) {
      final ok = await confirm(context,
          'රූඩ් 4 කට හෝ පර්චස් 40 කට වැඩි අගයක් ඇත. මුළු ප්‍රමාණය ${formatExtent(extent)} ලෙස සුරකින්නද?');
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
      final ok = await confirm(context,
          'ඔප්පු අංකය "${txt(_deed)}" දැනටමත් "${dup.first.name}" ඉඩමට ඇත. තවමත් සුරකින්නද?');
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
    return Scaffold(
      appBar: BrandAppBar(title: Text(l == null ? 'නව ඉඩමක්' : 'ඉඩම සංස්කරණය')),
      bottomNavigationBar: SaveBar(onSave: _save, busy: _busy || s == null),
      body: s == null
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
              children: [
                InkWell(
                  onTap: _pickGroup,
                  child: InputDecorator(
                    decoration: const InputDecoration(
                        labelText: 'ගම්මානය / ගෘහ කණ්ඩායම *', suffixIcon: Icon(Icons.arrow_drop_down)),
                    child: Text(group == null ? '' : '${village?.name ?? ''} — ${group.code}'),
                  ),
                ),
                const SizedBox(height: 6),
                TF(_name, 'ඉඩමේ නම *', hint: 'උදා: කොස්වත්ත'),
                TF(_address, 'ලිපිනය / ස්ථාන විස්තරය', maxLines: 2),
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
                const SectionTitle('ප්‍රමාණය'),
                SegmentedButton<ExtentMode>(
                  segments: const [
                    ButtonSegment(value: ExtentMode.arp, label: Text('අක්-රූ-පර්')),
                    ButtonSegment(value: ExtentMode.perches, label: Text('පර්චස්')),
                    ButtonSegment(value: ExtentMode.hectares, label: Text('හෙක්ටයාර')),
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
                    Expanded(child: TF(_acres, 'අක්කර', decimal: true, onChanged: (_) => setState(() {}))),
                    const SizedBox(width: 8),
                    Expanded(child: TF(_roods, 'රූඩ්', decimal: true, onChanged: (_) => setState(() {}))),
                    const SizedBox(width: 8),
                    Expanded(child: TF(_perches, 'පර්චස්', decimal: true, onChanged: (_) => setState(() {}))),
                  ])
                else
                  TF(_single, _mode == ExtentMode.perches ? 'පර්චස්' : 'හෙක්ටයාර',
                      decimal: true, onChanged: (_) => setState(() {})),
                if (extent != null)
                  Text('= ${formatExtent(extent)} = ${formatHectares(extent)}',
                      style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                PickField(
                    list: PL.extentSource,
                    value: _extentSource,
                    onChanged: (v) => setState(() => _extentSource = v)),
                const SectionTitle('අයිතිය'),
                PickField(
                    list: PL.ownership,
                    value: _ownership,
                    onChanged: (v) => setState(() => _ownership = v)),
                Row(children: [
                  Expanded(child: TF(_deed, 'ඔප්පු / බලපත්‍ර අංකය')),
                  const SizedBox(width: 8),
                  Expanded(child: TF(_plan, 'පිඹුරු අංකය')),
                ]),
                Row(children: [
                  Expanded(child: TF(_lot, 'කට්ටි අංකය')),
                  const SizedBox(width: 8),
                  Expanded(child: TF(_scheme, 'ජනපදය')),
                ]),
                PickField(
                    list: PL.yesNoUnknown,
                    label: 'අතුරු බෙදීම්වලට අවසර',
                    value: _subdivision,
                    onChanged: (v) => setState(() => _subdivision = v)),
                const Text('අයිතිකරුවන් හා පදිංචිකරුවන් ඉඩම සුරැකීමෙන් පසු "මිනිසුන්" කොටසින් එකතු කරන්න.',
                    style: TextStyle(fontSize: 12)),
                const SectionTitle('මායිම්'),
                TF(_n, 'උතුර'),
                TF(_e, 'නැගෙනහිර'),
                TF(_so, 'දකුණ'),
                TF(_w, 'බටහිර'),
                const SectionTitle('භාවිතය'),
                PickField(list: PL.landUse, value: _landUse, onChanged: (v) => setState(() => _landUse = v)),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('ආරවුලක් ඇත'),
                  value: _dispute,
                  onChanged: (v) => setState(() => _dispute = v),
                ),
                if (_dispute) TF(_disputeNote, 'ආරවුල පිළිබඳ සටහන', maxLines: 2),
                TF(_notes, 'වෙනත් සටහන්', maxLines: 3),
              ],
            ),
    );
  }
}
