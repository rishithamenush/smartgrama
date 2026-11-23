import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';

import '../../app_state.dart';
import '../../data/bundle.dart';
import '../../data/database.dart';
import '../../data/nic.dart';
import '../../data/picklists.dart';
import '../forms/person_form.dart';
import '../land/land_card.dart';
import '../widgets/common.dart';

class _PersonView {
  _PersonView(this.p, this.family, this.building, this.land, this.events, this.linkedLands, this.members);
  final Person p;
  final Family? family;
  final Building? building;
  final Land? land;
  final List<ResidenceEvent> events;
  final List<(LandParty, Land)> linkedLands;
  final List<Person> members;
}

class PersonCard extends StatefulWidget {
  const PersonCard({super.key, required this.personId});
  final String personId;

  @override
  State<PersonCard> createState() => _PersonCardState();
}

class _PersonCardState extends State<PersonCard> {
  final db = AppState.db;
  bool _showNic = false;

  Future<_PersonView?> _load() async {
    final p = await db.byId(db.persons, widget.personId);
    if (p == null) return null;
    final f = await db.byId(db.families, p.familyId);
    final b = f == null ? null : await db.byId(db.buildings, f.buildingId);
    final l = b == null ? null : await db.byId(db.lands, b.landId);
    final events = await (db.select(db.residenceEvents)
          ..where((e) => e.personId.equals(p.id) & e.deletedAt.isNull()))
        .get();
    final parties = await (db.select(db.landParties)
          ..where((x) => x.personId.equals(p.id) & x.deletedAt.isNull()))
        .get();
    final linked = <(LandParty, Land)>[];
    for (final x in parties) {
      final land = await db.byId(db.lands, x.landId);
      if (land != null && land.deletedAt == null) linked.add((x, land));
    }
    final members = f == null
        ? <Person>[]
        : await (db.select(db.persons)
              ..where((x) => x.familyId.equals(f.id) & x.deletedAt.isNull() & x.id.equals(p.id).not()))
            .get();
    return _PersonView(p, f, b, l, events..sort((a, b) => b.date.compareTo(a.date)), linked, members);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<_PersonView?>(
      stream: db.watchLoad([db.persons, db.families, db.landParties, db.residenceEvents], _load),
      builder: (context, snap) {
        final v = snap.data;
        if (v == null) {
          return Scaffold(
            appBar: AppBar(),
            body: snap.connectionState == ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : const EmptyHint('හමු නොවීය'),
          );
        }
        final p = v.p;
        final now = DateTime.now();
        return Scaffold(
          appBar: AppBar(
            title: Text(p.fullName),
            actions: [
              if (v.land != null)
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => PersonForm(familyId: p.familyId, landId: v.land!.id, person: p))),
                ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.only(bottom: 32),
            children: [
              Card(
                child: ListTile(
                  leading: CircleAvatar(child: Icon(p.gender == 'f' ? Icons.woman : Icons.man)),
                  title: Text(p.fullName, style: Theme.of(context).textTheme.titleMedium),
                  subtitle: Text([
                    if (p.initialsName != null) p.initialsName!,
                    if (p.dob != null) 'වයස ${ageOn(p.dob!, now)}',
                    pl(PL.personStatus, p.status),
                  ].join(' • ')),
                ),
              ),
              if (p.nic != null)
                ListTile(
                  leading: const Icon(Icons.badge),
                  title: Text(_showNic ? p.nic! : maskNic(p.nic)),
                  subtitle: Text(parseNic(p.nic!).isValid ? 'ජාතික හැඳුනුම්පත' : '⚠ වලංගු නැති අංකයකි'),
                  trailing: IconButton(
                    icon: Icon(_showNic ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _showNic = !_showNic),
                  ),
                ),
              InfoRow('උපන් දිනය', p.dob == null ? null : dateFmt.format(p.dob!)),
              InfoRow('ස්ත්‍රී / පුරුෂ', p.gender == null ? null : pl(PL.gender, p.gender)),
              InfoRow('සම්බන්ධතාව', p.relation == null ? null : pl(PL.relation, p.relation)),
              InfoRow('ජාතිය', p.ethnicity == null ? null : pl(PL.ethnicity, p.ethnicity)),
              InfoRow('ආගම', p.religion == null ? null : pl(PL.religion, p.religion)),
              InfoRow('විවාහක තත්ත්වය', p.civilStatus == null ? null : pl(PL.civilStatus, p.civilStatus)),
              InfoRow('අධ්‍යාපනය', p.education == null ? null : pl(PL.education, p.education)),
              InfoRow('ශ්‍රේණිය', p.schoolGrade),
              InfoRow('රැකියාව', p.occupation == null ? null : pl(PL.occupation, p.occupation)),
              InfoRow('රැකියා ස්ථානය', p.workplace),
              InfoRow('ආබාධ', p.disability == null ? null : pl(PL.disability, p.disability)),
              InfoRow('රෝග', p.chronicIllness),
              InfoRow('ඡන්ද හිමි', p.isVoter == null ? null : pl(PL.yesNoUnknown, p.isVoter)),
              InfoRow('දුරකථනය', p.phone),
              InfoRow('සටහන්', p.notes),
              if (v.land != null) ...[
                const SectionTitle('ජීවත් වන ස්ථානය'),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: Text(v.land!.name),
                  subtitle: Text(v.building == null ? '' : pl(PL.buildingType, v.building!.type)),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => LandCard(landId: v.land!.id, initialTab: 2))),
                ),
              ],
              if (v.members.isNotEmpty) ...[
                const SectionTitle('පවුලේ අනෙක් අය'),
                for (final m in v.members)
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.person_outline),
                    title: Text(m.fullName),
                    subtitle: Text([
                      pl(PL.relation, m.relation),
                      if (m.dob != null) 'වයස ${ageOn(m.dob!, now)}',
                    ].join(' • ')),
                    onTap: () => Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (_) => PersonCard(personId: m.id))),
                  ),
              ],
              if (v.linkedLands.isNotEmpty) ...[
                const SectionTitle('සම්බන්ධ ඉඩම්'),
                for (final (party, land) in v.linkedLands)
                  ListTile(
                    leading: const Icon(Icons.landscape),
                    title: Text(land.name),
                    subtitle: Text([pl(PL.partyRole, party.role), if (party.share != null) 'කොටස ${party.share}'].join(' • ')),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => LandCard(landId: land.id))),
                  ),
              ],
              if (v.events.isNotEmpty) ...[
                const SectionTitle('පදිංචි ඉතිහාසය'),
                for (final e in v.events)
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.history),
                    title: Text(residenceEventLabels[e.type] ?? e.type),
                    subtitle: Text([dateFmt.format(e.date), if (e.note != null) e.note!].join(' • ')),
                  ),
              ],
            ],
          ),
        );
      },
    );
  }
}
