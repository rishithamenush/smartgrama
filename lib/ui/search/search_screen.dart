import 'dart:async';

import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';

import '../../app_state.dart';
import '../../data/database.dart';
import '../../data/nic.dart';
import '../../data/picklists.dart';
import '../../theme.dart';
import '../land/land_card.dart';
import '../land/land_sections.dart';
import '../people/person_card.dart';
import '../widgets/brand.dart';
import '../widgets/common.dart';
import '../../l10n/l10n.dart';

class _Results {
  _Results(this.persons, this.lands, this.buildings);
  final List<Person> persons;
  final List<Land> lands;
  final List<Building> buildings;
  bool get isEmpty => persons.isEmpty && lands.isEmpty && buildings.isEmpty;
  int get total => persons.length + lands.length + buildings.length;
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
    final t = context.l10n;
    return BrandPage(
      title: t.navSearch,
      subtitle: r == null ? t.searchSubtitle : t.resultsN(r.total),
      icon: Icons.search_rounded,
      headerChild: TextField(
        controller: _ctrl,
        style: const TextStyle(fontSize: 17),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search_rounded, color: Brand.brownMid),
          hintText: t.searchFieldHint,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Brand.gold, width: 2),
          ),
          suffixIcon: _ctrl.text.isEmpty
              ? null
              : IconButton(
                  icon: const Icon(Icons.close_rounded),
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
      body: r == null
          ? ListView(children: [EmptyHint(t.searchEmptyHint, icon: Icons.manage_search_rounded)])
          : r.isEmpty
              ? ListView(children: [EmptyHint(t.searchNoResults, icon: Icons.search_off_rounded)])
              : ListView(
                  padding: const EdgeInsets.only(bottom: 32),
                  children: [
                    if (r.persons.isNotEmpty) SectionTitle('${t.persons} (${r.persons.length})'),
                    for (final p in r.persons)
                      ListCard(
                        icon: p.gender == 'f' ? Icons.woman_rounded : Icons.man_rounded,
                        color: p.gender == 'f' ? Brand.terracotta : Brand.brownMid,
                        title: p.fullName,
                        subtitle: [
                          if (p.nic != null) maskNic(p.nic),
                          if (p.dob != null) t.ageN(ageOn(p.dob!, now)),
                          if (p.status != 'resident') pl(PL.personStatus, p.status),
                        ].join(' • '),
                        onTap: () => push(context, PersonCard(personId: p.id)),
                      ),
                    if (r.lands.isNotEmpty) SectionTitle('${t.lands} (${r.lands.length})'),
                    for (final l in r.lands)
                      ListCard(
                        icon: Icons.landscape_rounded,
                        color: Brand.olive,
                        title: l.name,
                        subtitle: [l.deedNo, l.addressText].whereType<String>().join(' • '),
                        trailing: StatusBadge(l.status),
                        onTap: () => push(context, LandCard(landId: l.id)),
                      ),
                    if (r.buildings.isNotEmpty) SectionTitle('${t.buildings} (${r.buildings.length})'),
                    for (final b in r.buildings)
                      ListCard(
                        icon: Icons.home_work_rounded,
                        color: Brand.gold,
                        title: buildingLabel(b),
                        onTap: () => push(context, LandCard(landId: b.landId, initialTab: 1)),
                      ),
                  ],
                ),
    );
  }
}
