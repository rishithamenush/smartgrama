import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';

import '../../app_state.dart';
import '../../data/bundle.dart';
import '../../data/database.dart';
import '../../data/nic.dart';
import '../../data/picklists.dart';
import '../widgets/common.dart';
import '../widgets/fields.dart';

const _eventForStatus = {
  'moved': 'left',
  'dead': 'death',
  'away': 'away',
  'resident': 'returned',
};

const residenceEventLabels = {
  'arrived': 'පදිංචියට පැමිණියා',
  'left': 'පදිංචිය හැර ගියා',
  'birth': 'උපත',
  'death': 'මරණය',
  'away': 'තාවකාලිකව බැහැරට ගියා',
  'returned': 'නැවත පැමිණියා',
};

class PersonForm extends StatefulWidget {
  const PersonForm({super.key, required this.familyId, required this.landId, this.person});
  final String familyId;
  final String landId;
  final Person? person;

  @override
  State<PersonForm> createState() => _PersonFormState();
}

class _PersonFormState extends State<PersonForm> {
  final db = AppState.db;
  late final Person? p = widget.person;
  late final _name = TextEditingController(text: p?.fullName);
  late final _initials = TextEditingController(text: p?.initialsName);
  late final _nic = TextEditingController(text: p?.nic);
  late final _grade = TextEditingController(text: p?.schoolGrade);
  late final _workplace = TextEditingController(text: p?.workplace);
  late final _illness = TextEditingController(text: p?.chronicIllness);
  late final _phone = TextEditingController(text: p?.phone);
  late final _notes = TextEditingController(text: p?.notes);
  late DateTime? _dob = p?.dob;
  late String? _gender = p?.gender,
      _relation = p?.relation,
      _ethnicity = p?.ethnicity,
      _religion = p?.religion,
      _civil = p?.civilStatus,
      _education = p?.education,
      _occupation = p?.occupation,
      _disability = p?.disability,
      _voter = p?.isVoter;
  late String _status = p?.status ?? 'resident';
  DateTime? _statusDate;
  String? _nicError;
  String? _nicNote;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    if (p == null) _prefillFromFamily();
  }

  /// New members usually share ethnicity/religion with the family.
  Future<void> _prefillFromFamily() async {
    final others = await (db.select(db.persons)
          ..where((x) => x.familyId.equals(widget.familyId) & x.deletedAt.isNull()))
        .get();
    if (!mounted) return;
    setState(() {
      if (others.isEmpty) _relation = 'head';
      final head = others.where((o) => o.relation == 'head').firstOrNull ?? others.firstOrNull;
      _ethnicity ??= head?.ethnicity;
      _religion ??= head?.religion;
    });
  }

  void _onNic(String v) {
    final n = normalizeNic(v);
    if (n.isEmpty) {
      setState(() {
        _nicError = null;
        _nicNote = null;
      });
      return;
    }
    final r = parseNic(n);
    setState(() {
      if (r.isValid) {
        _nicError = null;
        _dob = r.info!.dob;
        _gender = r.info!.gender;
        _nicNote = 'උපන් දිනය ${dateFmt.format(_dob!)} • ${pl(PL.gender, _gender)} — හැඳුනුම්පතින්';
      } else {
        _nicNote = null;
        _nicError = n.length >= 10 ? r.error : null;
      }
    });
  }

  Future<void> _pickDob() async {
    final d = await showDatePicker(
      context: context,
      initialDate: _dob ?? DateTime(1990),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
    );
    if (d != null) setState(() => _dob = d);
  }

  Future<void> _pickStatusDate() async {
    final d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (d != null) setState(() => _statusDate = d);
  }

  Future<void> _save() async {
    if (txt(_name) == null) {
      snack(context, 'නම අනිවාර්යයි');
      return;
    }
    final nic = txt(_nic) == null ? null : normalizeNic(_nic.text);
    if (nic != null) {
      final r = parseNic(nic);
      if (!r.isValid &&
          !await confirm(context, 'හැඳුනුම්පත් අංකය වලංගු නැත (${r.error}). තවමත් සුරකින්නද?')) {
        return;
      }
      if (r.isValid && _dob != null && r.info!.dob != _dob) {
        if (!mounted) return;
        if (!await confirm(context, 'ඇතුළත් කළ උපන් දිනය හැඳුනුම්පත සමඟ නොගැළපේ. තවමත් සුරකින්නද?')) {
          return;
        }
      }
      final dups = await db.personsWithNic(nic, exceptId: p?.id);
      if (dups.isNotEmpty && mounted) {
        final names = dups.map((d) => d.fullName).join(', ');
        if (!await confirm(context, 'මෙම හැඳුනුම්පත් අංකය දැනටමත් ලේඛනයේ ඇත: $names\n\nඑකම පුද්ගලයා දෙවරක් ඇතුළත් වී ඇත්දැයි පරීක්ෂා කරන්න. තවමත් සුරකින්නද?')) {
          return;
        }
      }
    }
    final age = _dob == null ? null : ageOn(_dob!, DateTime.now());
    if (age != null && age >= 16 && nic == null && mounted) {
      snack(context, 'සටහන: වයස $age — හැඳුනුම්පත් අංකය පසුව එකතු කරන්න');
    }

    final members = await (db.select(db.persons)
          ..where((x) => x.familyId.equals(widget.familyId) & x.deletedAt.isNull()))
        .get();
    final others = members.where((m) => m.id != p?.id).toList();
    if (_relation == 'head') {
      final otherHead = others.where((m) => m.relation == 'head' && m.status != 'dead').firstOrNull;
      if (otherHead != null && mounted &&
          !await confirm(context, '${otherHead.fullName} දැනටමත් ප්‍රධානියා ලෙස ඇත. පවුලේ ප්‍රධානියන් දෙදෙනෙක් වේ. තවමත් සුරකින්නද?')) {
        return;
      }
    } else if (const {'son', 'daughter', 'grandchild'}.contains(_relation) && _dob != null) {
      final head = others.where((m) => m.relation == 'head').firstOrNull;
      if (head?.dob != null && !_dob!.isAfter(head!.dob!) && mounted &&
          !await confirm(context, 'මෙම පුද්ගලයා ප්‍රධානියාට (${head.fullName}) වඩා වයසින් වැඩියි. සම්බන්ධතාව නිවැරදිද?')) {
        return;
      }
    }

    setState(() => _busy = true);
    final id = p?.id ?? newId();
    await db.transaction(() async {
      await db.saveRow(
        db.persons,
        id,
        PersonsCompanion(
          id: Value(id),
          familyId: Value(widget.familyId),
          fullName: Value(txt(_name)!),
          initialsName: Value(txt(_initials)),
          nic: Value(nic),
          dob: Value(_dob),
          gender: Value(_gender),
          relation: Value(_relation),
          ethnicity: Value(_ethnicity),
          religion: Value(_religion),
          civilStatus: Value(_civil),
          education: Value(_education),
          schoolGrade: Value(_education == 'schooling' ? txt(_grade) : null),
          occupation: Value(_occupation),
          workplace: Value(txt(_workplace)),
          disability: Value(_disability),
          chronicIllness: Value(txt(_illness)),
          isVoter: Value(_voter),
          status: Value(_status),
          phone: Value(txt(_phone)),
          notes: Value(txt(_notes)),
        ),
        landId: widget.landId,
      );
      if (p != null && p!.status != _status && _eventForStatus[_status] != null) {
        final eid = newId();
        await db.saveRow(
          db.residenceEvents,
          eid,
          ResidenceEventsCompanion.insert(
            id: eid,
            personId: id,
            type: _eventForStatus[_status]!,
            date: _statusDate ?? DateTime.now(),
          ),
          landId: widget.landId,
        );
      }
      await syncFamilyHead(widget.familyId, widget.landId);
    });
    if (mounted) Navigator.pop(context, id);
  }

  @override
  Widget build(BuildContext context) {
    final age = _dob == null ? null : ageOn(_dob!, DateTime.now());
    final statusChanged = p != null && p!.status != _status;
    return Scaffold(
      appBar: AppBar(
        title: Text(p == null ? 'නව සාමාජිකයෙක්' : p!.fullName),
        actions: [
          if (p != null)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              tooltip: 'වැරදීමකින් ඇතුළත් කළා නම් ඉවත් කරන්න',
              onPressed: () async {
                if (await confirm(context,
                    'වැරදීමකින් ඇතුළත් කළා නම් පමණක් ඉවත් කරන්න.\nපදිංචිය හැර ගියා / මියගියා නම් "පදිංචි තත්ත්වය" වෙනස් කරන්න.\n\nඉවත් කරන්නද?',
                    danger: true)) {
                  await db.softDelete(db.persons, p!.id, landId: widget.landId);
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
          TF(_name, 'සම්පූර්ණ නම *'),
          TF(_initials, 'මුලකුරු සහිත නම'),
          TF(_nic, 'ජාතික හැඳුනුම්පත් අංකය', onChanged: _onNic, errorText: _nicError),
          if (_nicNote != null)
            Text(_nicNote!, style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 12)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: InkWell(
              onTap: _pickDob,
              child: InputDecorator(
                decoration: const InputDecoration(labelText: 'උපන් දිනය', suffixIcon: Icon(Icons.calendar_month)),
                isEmpty: _dob == null,
                child: Text(_dob == null ? '' : '${dateFmt.format(_dob!)}   (වයස $age)'),
              ),
            ),
          ),
          PickField(list: PL.gender, value: _gender, onChanged: (v) => setState(() => _gender = v)),
          PickField(list: PL.relation, value: _relation, onChanged: (v) => setState(() => _relation = v)),
          PickField(list: PL.ethnicity, value: _ethnicity, onChanged: (v) => setState(() => _ethnicity = v)),
          PickField(list: PL.religion, value: _religion, onChanged: (v) => setState(() => _religion = v)),
          PickField(list: PL.civilStatus, value: _civil, onChanged: (v) => setState(() => _civil = v)),
          const SectionTitle('අධ්‍යාපනය හා රැකියාව'),
          PickField(list: PL.education, value: _education, onChanged: (v) => setState(() => _education = v)),
          if (_education == 'schooling') TF(_grade, 'ශ්‍රේණිය / පාසල'),
          PickField(list: PL.occupation, value: _occupation, onChanged: (v) => setState(() => _occupation = v)),
          TF(_workplace, 'රැකියා ස්ථානය'),
          const SectionTitle('සෞඛ්‍යය හා වෙනත්'),
          PickField(list: PL.disability, value: _disability, onChanged: (v) => setState(() => _disability = v)),
          TF(_illness, 'දීර්ඝකාලීන රෝග (විකල්ප)'),
          PickField(
              list: PL.yesNoUnknown,
              label: 'ඡන්ද හිමිද',
              value: _voter,
              onChanged: (v) => setState(() => _voter = v)),
          TF(_phone, 'දුරකථන අංකය', phone: true),
          const SectionTitle('පදිංචි තත්ත්වය'),
          PickField(
              list: PL.personStatus,
              value: _status,
              onChanged: (v) => setState(() => _status = v ?? 'resident')),
          if (statusChanged)
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.event),
              title: Text('වෙනස් වූ දිනය: ${dateFmt.format(_statusDate ?? DateTime.now())}'),
              trailing: const Icon(Icons.edit_calendar),
              onTap: _pickStatusDate,
            ),
          TF(_notes, 'සටහන්', maxLines: 2),
        ],
      ),
    );
  }
}

/// Searchable list of everyone in the register. Returns a person id.
Future<Person?> pickPerson(BuildContext context) => showModalBottomSheet<Person>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (c) => const _PersonPicker(),
    );

class _PersonPicker extends StatefulWidget {
  const _PersonPicker();
  @override
  State<_PersonPicker> createState() => _PersonPickerState();
}

class _PersonPickerState extends State<_PersonPicker> {
  final db = AppState.db;
  List<Person> _results = [];

  Future<void> _search(String q) async {
    q = q.trim();
    if (q.isEmpty) {
      setState(() => _results = []);
      return;
    }
    final like = '%$q%';
    final r = await (db.select(db.persons)
          ..where((p) =>
              p.deletedAt.isNull() &
              (p.fullName.like(like) | p.initialsName.like(like) | p.nic.like('%${q.toUpperCase()}%')))
          ..limit(50))
        .get();
    if (mounted) setState(() => _results = r);
  }

  @override
  Widget build(BuildContext context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.8,
        builder: (context, scroll) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                autofocus: true,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search), hintText: 'නම හෝ හැඳුනුම්පත් අංකය'),
                onChanged: _search,
              ),
            ),
            Expanded(
              child: ListView(
                controller: scroll,
                children: [
                  for (final p in _results)
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(p.fullName),
                      subtitle: Text([
                        if (p.nic != null) maskNic(p.nic),
                        if (p.dob != null) 'වයස ${ageOn(p.dob!, DateTime.now())}',
                      ].join(' • ')),
                      onTap: () => Navigator.pop(context, p),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
}

/// Add / edit a person's link to a land (owner, occupant, heir ...).
Future<void> editLandParty(BuildContext context, String landId, {LandParty? party, Person? partyPerson}) async {
  final db = AppState.db;
  String? role = party?.role ?? 'owner';
  Person? person = partyPerson;
  final outside = TextEditingController(text: party?.outsideName);
  final share = TextEditingController(text: party?.share);
  final r = await showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (c) => StatefulBuilder(
      builder: (c, setS) => Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, MediaQuery.of(c).viewInsets.bottom + 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('ඉඩමට සම්බන්ධ පුද්ගලයා', style: Theme.of(c).textTheme.titleLarge),
            PickField(list: PL.partyRole, value: role, onChanged: (v) => setS(() => role = v)),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.person_search),
              title: Text(person?.fullName ?? 'ලේඛනයෙන් තෝරන්න'),
              subtitle: const Text('වසමේ පදිංචි අයෙක් නම්'),
              trailing: person == null
                  ? null
                  : IconButton(icon: const Icon(Icons.close), onPressed: () => setS(() => person = null)),
              onTap: () async {
                final p = await pickPerson(c);
                if (p != null) setS(() => person = p);
              },
            ),
            if (person == null) TF(outside, 'හෝ නම (වසමෙන් පිටත ජීවත් වන අයෙක් නම්)'),
            TF(share, 'කොටස (විකල්ප)', hint: 'උදා: 1/2'),
            const SizedBox(height: 8),
            Row(
              children: [
                if (party != null)
                  TextButton(onPressed: () => Navigator.pop(c, 'delete'), child: const Text('ඉවත් කරන්න')),
                const Spacer(),
                FilledButton(onPressed: () => Navigator.pop(c, 'save'), child: const Text('සුරකින්න')),
              ],
            ),
          ],
        ),
      ),
    ),
  );
  if (r == 'delete' && party != null) {
    await db.softDelete(db.landParties, party.id, landId: landId);
    return;
  }
  if (r != 'save' || role == null) return;
  if (person == null && txt(outside) == null) {
    if (context.mounted) snack(context, 'පුද්ගලයෙක් තෝරන්න හෝ නම ඇතුළත් කරන්න');
    return;
  }
  final id = party?.id ?? newId();
  await db.saveRow(
    db.landParties,
    id,
    LandPartiesCompanion(
      id: Value(id),
      landId: Value(landId),
      personId: Value(person?.id),
      outsideName: Value(person == null ? txt(outside) : null),
      role: Value(role!),
      share: Value(txt(share)),
    ),
    landId: landId,
  );
}

/// Keeps `families.head_person_id` pointing at the member marked "head".
Future<void> syncFamilyHead(String familyId, String landId) async {
  final db = AppState.db;
  final members = await (db.select(db.persons)
        ..where((x) => x.familyId.equals(familyId) & x.deletedAt.isNull())
        ..orderBy([(x) => OrderingTerm(expression: x.createdAt)]))
      .get();
  final head = members.where((m) => m.relation == 'head' && m.status != 'dead').firstOrNull;
  final fam = await db.byId(db.families, familyId);
  if (fam != null && fam.headPersonId != head?.id) {
    await db.saveRow(db.families, familyId, FamiliesCompanion(headPersonId: Value(head?.id)),
        landId: landId);
  }
}
