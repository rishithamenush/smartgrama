import 'dart:async';

import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';

import '../../app_state.dart';
import '../../data/database.dart';
import '../../data/nic.dart';
import '../../data/picklists.dart';
import '../land/land_card.dart';
import '../land/land_sections.dart';
import '../people/person_card.dart';
import '../widgets/common.dart';

class _Results {
  _Results(this.persons, this.lands, this.buildings);
  final List<Person> persons;
  final List<Land> lands;
  final List<Building> buildings;
  bool get isEmpty => persons.isEmpty && lands.isEmpty && buildings.isEmpty;
}

/// One box searches people (name, NIC, phone), lands (name, deed, address)
/// and buildings (number).
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final db = AppState.db;
  final _ctrl = TextEditingController();
  Timer? _debounce;
  _Results? _r;
  String _q = '';

  Future<void> _search(String q) async {
    q = q.trim();
    _q = q;
    if (q.isEmpty) {
      setState(() => _r = null);
      return;
    }
    final like = '%$q%';
    final nicLike = '%${normalizeNic(q)}%';
    final persons = await (db.select(db.persons)
          ..where((p) =>
              p.deletedAt.isNull() &
              (p.fullName.like(like) | p.initialsName.like(like) | p.nic.like(nicLike) | p.phone.like(like)))
          ..limit(60))
        .get();
    final lands = await (db.select(db.lands)
          ..where((l) =>
              l.deletedAt.isNull() &
              (l.name.like(like) | l.deedNo.like(like) | l.addressText.like(like) | l.planNo.like(like)))
          ..limit(40))
        .get();
    final buildings = await (db.select(db.buildings)
          ..where((b) => b.deletedAt.isNull() & b.buildingNo.like(like))
          ..limit(20))
        .get();
    if (mounted && q == _q) setState(() => _r = _Results(persons, lands, buildings));
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final r = _r;
    final now = DateTime.now();
    return Scaffold(
      appBar: AppBar(title: const Text('සෙවීම')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _ctrl,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'නම, හැඳුනුම්පත, ඉඩමේ නම, ඔප්පු අංකය, දුරකථනය',
                suffixIcon: _ctrl.text.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _ctrl.clear();
                          _search('');
                        },
                      ),
              ),
              onChanged: (v) {
                _debounce?.cancel();
                _debounce = Timer(const Duration(milliseconds: 250), () => _search(v));
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: r == null
                ? const EmptyHint('සෙවීමට ටයිප් කරන්න', icon: Icons.search)
                : r.isEmpty
                    ? const EmptyHint('කිසිවක් හමු නොවීය')
                    : ListView(
                        children: [
                          if (r.persons.isNotEmpty) SectionTitle('පුද්ගලයින් (${r.persons.length})'),
                          for (final p in r.persons)
                            ListTile(
                              leading: Icon(p.gender == 'f' ? Icons.woman : Icons.man),
                              title: Text(p.fullName),
                              subtitle: Text([
                                if (p.nic != null) maskNic(p.nic),
                                if (p.dob != null) 'වයස ${ageOn(p.dob!, now)}',
                                if (p.status != 'resident') pl(PL.personStatus, p.status),
                              ].join(' • ')),
                              onTap: () => push(context, PersonCard(personId: p.id)),
                            ),
                          if (r.lands.isNotEmpty) SectionTitle('ඉඩම් (${r.lands.length})'),
                          for (final l in r.lands)
                            ListTile(
                              leading: const Icon(Icons.landscape),
                              title: Text(l.name),
                              subtitle: Text([l.deedNo, l.addressText].whereType<String>().join(' • ')),
                              trailing: StatusBadge(l.status),
                              onTap: () => push(context, LandCard(landId: l.id)),
                            ),
                          if (r.buildings.isNotEmpty) SectionTitle('ගොඩනැගිලි (${r.buildings.length})'),
                          for (final b in r.buildings)
                            ListTile(
                              leading: const Icon(Icons.home_work),
                              title: Text(buildingLabel(b)),
                              onTap: () => push(context, LandCard(landId: b.landId, initialTab: 1)),
                            ),
                        ],
                      ),
          ),
        ],
      ),
    );
  }
}
