import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';

import '../../app_state.dart';
import '../../data/bundle.dart';
import '../../data/database.dart';
import '../../data/nic.dart';
import '../../data/picklists.dart';
import '../../theme.dart';
import '../forms/person_form.dart';
import '../land/land_card.dart';
import '../widgets/brand.dart';
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

  void _open(Widget page) => Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<_PersonView?>(
      stream: db.watchLoad([db.persons, db.families, db.landParties, db.residenceEvents], _load),
      builder: (context, snap) {
        final v = snap.data;
        if (v == null) {
          return BrandPage(
            title: 'පුද්ගලයා',
            body: snap.connectionState == ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : const EmptyHint('හමු නොවීය'),
          );
        }
        final p = v.p;
        final now = DateTime.now();
        final age = p.dob == null ? null : ageOn(p.dob!, now);
        final female = p.gender == 'f';
        return BrandPage(
          title: p.fullName,
          subtitle: [
            if (p.relation != null) pl(PL.relation, p.relation),
            if (v.land != null) v.land!.name,
          ].join('  •  '),
          actions: [
            if (v.land != null)
              HeaderAction(Icons.edit_rounded,
                  () => _open(PersonForm(familyId: p.familyId, landId: v.land!.id, person: p))),
          ],
          headerChild: Row(
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: female ? Brand.terracotta : Brand.gold,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Icon(female ? Icons.woman_rounded : Icons.man_rounded, color: Colors.white, size: 36),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Wrap(spacing: 6, runSpacing: 6, children: [
                  if (age != null) _whitePill('වයස $age'),
                  if (p.gender != null) _whitePill(pl(PL.gender, p.gender)),
                  _whitePill(pl(PL.personStatus, p.status)),
                ]),
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.only(bottom: 40),
            children: [
              if (p.nic != null)
                ListCard(
                  margin: const EdgeInsets.fromLTRB(16, 14, 16, 0),
                  icon: Icons.badge_rounded,
                  color: Brand.slate,
                  title: _showNic ? p.nic! : maskNic(p.nic),
                  subtitle: parseNic(p.nic!).isValid ? 'ජාතික හැඳුනුම්පත' : '⚠ වලංගු නැති අංකයකි',
                  trailing: IconButton(
                    icon: Icon(_showNic ? Icons.visibility_off_rounded : Icons.visibility_rounded, color: Brand.muted),
                    onPressed: () => setState(() => _showNic = !_showNic),
                  ),
                ),
              SectionCard(
                title: 'පුද්ගලික තොරතුරු',
                icon: Icons.person_rounded,
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 6),
                children: [
                  InfoRow('සම්පූර්ණ නම', p.fullName),
                  InfoRow('මුලකුරු සහිත නම', p.initialsName),
                  InfoRow('උපන් දිනය', p.dob == null ? null : dateFmt.format(p.dob!)),
                  InfoRow('ජාතිය', p.ethnicity == null ? null : pl(PL.ethnicity, p.ethnicity)),
                  InfoRow('ආගම', p.religion == null ? null : pl(PL.religion, p.religion)),
                  InfoRow('විවාහක තත්ත්වය', p.civilStatus == null ? null : pl(PL.civilStatus, p.civilStatus)),
                  InfoRow('ඡන්ද හිමි', p.isVoter == null ? null : pl(PL.yesNoUnknown, p.isVoter)),
                  InfoRow('දුරකථනය', p.phone),
                ],
              ),
              SectionCard(
                title: 'අධ්‍යාපනය හා රැකියාව',
                icon: Icons.school_rounded,
                color: Brand.slate,
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 6),
                children: [
                  InfoRow('අධ්‍යාපනය', p.education == null ? null : pl(PL.education, p.education)),
                  InfoRow('ශ්‍රේණිය', p.schoolGrade),
                  InfoRow('රැකියාව', p.occupation == null ? null : pl(PL.occupation, p.occupation)),
                  InfoRow('රැකියා ස්ථානය', p.workplace),
                  InfoRow('ආබාධ', p.disability == null ? null : pl(PL.disability, p.disability)),
                  InfoRow('රෝග', p.chronicIllness),
                  InfoRow('සටහන්', p.notes),
                ],
              ),
              if (v.land != null) ...[
                const SectionTitle('ජීවත් වන ස්ථානය'),
                ListCard(
                  icon: Icons.home_rounded,
                  color: Brand.gold,
                  title: v.land!.name,
                  subtitle: v.building == null ? null : pl(PL.buildingType, v.building!.type),
                  onTap: () => _open(LandCard(landId: v.land!.id, initialTab: 2)),
                ),
              ],
              if (v.members.isNotEmpty) ...[
                const SectionTitle('පවුලේ අනෙක් අය'),
                for (final m in v.members)
                  ListCard(
                    icon: m.gender == 'f' ? Icons.woman_rounded : Icons.man_rounded,
                    color: m.gender == 'f' ? Brand.terracotta : Brand.brownMid,
                    title: m.fullName,
                    subtitle: [
                      pl(PL.relation, m.relation),
                      if (m.dob != null) 'වයස ${ageOn(m.dob!, now)}',
                    ].join(' • '),
                    onTap: () => Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (_) => PersonCard(personId: m.id))),
                  ),
              ],
              if (v.linkedLands.isNotEmpty) ...[
                const SectionTitle('සම්බන්ධ ඉඩම්'),
                for (final (party, land) in v.linkedLands)
                  ListCard(
                    icon: Icons.landscape_rounded,
                    color: Brand.olive,
                    title: land.name,
                    subtitle: [pl(PL.partyRole, party.role), if (party.share != null) 'කොටස ${party.share}'].join(' • '),
                    onTap: () => _open(LandCard(landId: land.id)),
                  ),
              ],
              if (v.events.isNotEmpty) ...[
                const SectionTitle('පදිංචි ඉතිහාසය'),
                for (final e in v.events)
                  ListCard(
                    icon: Icons.history_rounded,
                    color: Brand.clay,
                    title: residenceEventLabels[e.type] ?? e.type,
                    subtitle: [dateFmt.format(e.date), if (e.note != null) e.note!].join(' • '),
                  ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _whitePill(String t) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.16), borderRadius: BorderRadius.circular(14)),
        child: Text(t, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13)),
      );
}
