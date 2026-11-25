import 'dart:convert';

import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';

import '../../app_state.dart';
import '../../data/analytics.dart';
import '../../data/bundle.dart';
import '../../data/database.dart';
import '../../data/nic.dart';
import '../../data/picklists.dart';
import '../../data/units.dart';
import '../forms/building_form.dart';
import '../forms/family_form.dart';
import '../forms/land_form.dart';
import '../forms/nature_forms.dart';
import '../forms/person_form.dart';
import '../people/person_card.dart';
import '../../theme.dart';
import '../widgets/brand.dart';
import '../widgets/common.dart';
import '../widgets/fields.dart';

Future<T?> push<T>(BuildContext context, Widget page) =>
    Navigator.of(context).push<T>(MaterialPageRoute(builder: (_) => page));

String familyLabel(LandBundle b, Family f) {
  final head = b.persons.where((p) => p.id == f.headPersonId).firstOrNull;
  return head == null ? 'පවුල (ප්‍රධානියා නැත)' : '${head.fullName} ගේ පවුල';
}

String buildingLabel(Building x) =>
    '${pl(PL.buildingType, x.type)}${x.buildingNo == null ? '' : ' — ${x.buildingNo}'}';

Future<void> setLandFlag(String landId, {bool? noBuildings, bool? noTrees, bool? noAnimals}) =>
    AppState.db.saveRow(
      AppState.db.lands,
      landId,
      LandsCompanion(
        noBuildings: noBuildings == null ? const Value.absent() : Value(noBuildings),
        noTrees: noTrees == null ? const Value.absent() : Value(noTrees),
        noAnimals: noAnimals == null ? const Value.absent() : Value(noAnimals),
      ),
      landId: landId,
    );

Widget _noneTile(String text, bool value, ValueChanged<bool> onChanged) => CheckboxListTile(
      value: value,
      onChanged: (v) => onChanged(v ?? false),
      title: Text(text),
      subtitle: const Text('සම්පූර්ණත්වය සඳහා'),
      controlAffinity: ListTileControlAffinity.leading,
    );

Widget _thumb(Photo? p, IconData fallback) => ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: p == null
          ? SizedBox(width: 48, height: 48, child: Icon(fallback))
          : Image.file(AppState.photoFile(p.fileName),
              width: 48, height: 48, fit: BoxFit.cover, cacheWidth: 120,
              errorBuilder: (_, _, _) => const SizedBox(width: 48, child: Icon(Icons.broken_image))),
    );

// ===================================================================
// Summary
// ===================================================================

class SummarySection extends StatelessWidget {
  const SummarySection(this.b, {super.key, this.showActions = true});
  final LandBundle b;
  final bool showActions;

  Future<void> _setStatus(BuildContext context, String status) async {
    String? source = b.land.infoSource;
    if (status == 'verified') {
      source = await showPickSheet(context, PL.infoSource, source);
      if (source == null || source.isEmpty) return;
    }
    await AppState.db.saveRow(
      AppState.db.lands,
      b.land.id,
      LandsCompanion(
        status: Value(status),
        infoSource: Value(source),
        verifiedAt: Value(status == 'verified' ? DateTime.now() : b.land.verifiedAt),
      ),
      landId: b.land.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = b.land;
    final check = checkLand(b);
    final nics = b.persons.map((p) => p.nic).whereType<String>().toSet();
    final done = check.items.where((i) => i.ok).length;
    return ListView(
      padding: const EdgeInsets.only(bottom: 40),
      children: [
        // ---- counts
        SectionCard(
          title: 'මෙම ඉඩමේ',
          icon: Icons.dashboard_rounded,
          children: [
            const SizedBox(height: 4),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              MiniStat(Icons.home_work_rounded, '${b.buildings.length}', 'ගොඩනැගිලි', Brand.gold),
              MiniStat(Icons.family_restroom_rounded, '${b.families.length}', 'පවුල්', Brand.terracotta),
              MiniStat(Icons.people_alt_rounded, '${b.persons.where(isActive).length}', 'පුද්ගලයින්', Brand.brown),
            ]),
            const SizedBox(height: 12),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              MiniStat(Icons.park_rounded, '${b.treeTotal}', 'ගස්', Brand.ok),
              MiniStat(Icons.pets_rounded, '${b.animalTotal}', 'සතුන්', Brand.slate),
              MiniStat(Icons.photo_library_rounded, '${b.photos.length}', 'ඡායාරූප', Brand.olive),
            ]),
          ],
        ),

        // ---- completeness
        SectionCard(
          title: 'තොරතුරු සම්පූර්ණත්වය',
          icon: Icons.task_alt_rounded,
          color: Brand.olive,
          trailing: StatusBadge(l.status),
          children: [
            Row(children: [
              SizedBox(
                width: 76,
                height: 76,
                child: Stack(fit: StackFit.expand, children: [
                  CircularProgressIndicator(
                    value: check.percent / 100,
                    strokeWidth: 8,
                    strokeCap: StrokeCap.round,
                    color: check.percent == 100 ? Brand.ok : Brand.gold,
                    backgroundColor: Brand.sand,
                  ),
                  Center(
                    child: Text('${check.percent}%',
                        style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w800, color: Brand.brownDark)),
                  ),
                ]),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  check.missing.isEmpty
                      ? 'සියලු කොටස් සම්පූර්ණයි 🎉'
                      : 'කොටස් $done / ${check.items.length} සම්පූර්ණයි.\nඉතිරි: ${check.missing.map((m) => m.label).join(', ')}',
                  style: const TextStyle(color: Brand.brownMid, height: 1.35),
                ),
              ),
            ]),
            const SizedBox(height: 10),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                for (final i in check.items)
                  Tooltip(
                    message: i.hint ?? i.label,
                    child: Pill(i.label,
                        color: i.ok ? Brand.ok : Brand.muted,
                        icon: i.ok ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded),
                  ),
              ],
            ),
            for (final i in check.missing.where((m) => m.hint != null))
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text('• ${i.hint}', style: const TextStyle(fontSize: 13, color: Brand.muted)),
              ),
          ],
        ),

        // ---- warnings (incl. NIC duplicates elsewhere in the division)
        FutureBuilder<List<Person>>(
          future: nics.isEmpty
              ? Future.value(const [])
              : (AppState.db.select(AppState.db.persons)
                    ..where((p) =>
                        p.nic.isIn(nics) &
                        p.deletedAt.isNull() &
                        p.id.isNotIn(b.persons.map((x) => x.id))))
                  .get(),
          builder: (context, snap) {
            final dups = snap.data ?? const [];
            final warnings = [
              ...check.warnings,
              for (final d in dups) '${d.nic} — වෙනත් ස්ථානයක ${d.fullName} ලෙසද ඇත (අනුපිටපතක්ද?)',
            ];
            if (warnings.isEmpty) return const SizedBox.shrink();
            return Container(
              margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Brand.warnBg,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Brand.warn.withValues(alpha: 0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    const Icon(Icons.warning_amber_rounded, color: Brand.warn),
                    const SizedBox(width: 6),
                    Text('පරීක්ෂා කරන්න (${warnings.length})',
                        style: const TextStyle(color: Brand.warn, fontWeight: FontWeight.w800, fontSize: 16)),
                  ]),
                  const SizedBox(height: 6),
                  for (final w in warnings)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Text('• $w', style: const TextStyle(color: Brand.brownDark)),
                    ),
                ],
              ),
            );
          },
        ),

        // ---- status actions
        if (showActions)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
            child: Row(
              children: [
                if (l.status == 'draft')
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: () async {
                        if (check.missing.isNotEmpty &&
                            !await confirm(context,
                                'තවම සම්පූර්ණ නැති කොටස් ${check.missing.length} ක් ඇත. "සම්පූර්ණයි" ලෙස සලකුණු කරන්නද?')) {
                          return;
                        }
                        if (context.mounted) await _setStatus(context, 'complete');
                      },
                      icon: const Icon(Icons.task_alt_rounded),
                      label: const Text('සම්පූර්ණයි'),
                    ),
                  ),
                if (l.status == 'draft') const SizedBox(width: 10),
                if (l.status != 'verified')
                  Expanded(
                    child: FilledButton.icon(
                      style: FilledButton.styleFrom(backgroundColor: Brand.ok),
                      onPressed: () => _setStatus(context, 'verified'),
                      icon: const Icon(Icons.verified_rounded),
                      label: const Text('තහවුරු කරන්න'),
                    ),
                  ),
                if (l.status != 'draft')
                  TextButton(
                    onPressed: () => _setStatus(context, 'draft'),
                    child: const Text('නැවත කෙටුම්පතට'),
                  ),
              ],
            ),
          ),

        // ---- details
        SectionCard(
          title: 'ඉඩමේ තොරතුරු',
          icon: Icons.description_rounded,
          color: Brand.brownMid,
          padding: const EdgeInsets.fromLTRB(0, 12, 0, 6),
          trailing: showActions
              ? Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: TextButton.icon(
                    onPressed: () => push(context, LandForm(land: l)),
                    icon: const Icon(Icons.edit_rounded, size: 18),
                    label: const Text('සංස්කරණය'),
                  ),
                )
              : null,
          children: [
            InfoRow('ප්‍රමාණය',
                l.extentPerches == null ? null : '${formatExtent(l.extentPerches)} (${formatHectares(l.extentPerches)})'),
            InfoRow('ප්‍රමාණයේ මූලාශ්‍රය', l.extentSource == null ? null : pl(PL.extentSource, l.extentSource)),
            InfoRow('අයිතිය', l.ownershipType == null ? null : pl(PL.ownership, l.ownershipType)),
            InfoRow('අයිතිකරුවන්', b.ownerNames.join(', ')),
            InfoRow('ඔප්පු / බලපත්‍ර අංකය', l.deedNo),
            InfoRow('පිඹුරු / කට්ටි අංකය', [l.planNo, l.lotNo].whereType<String>().join(' / ')),
            InfoRow('ජනපදය', l.schemeName),
            InfoRow('භාවිතය', l.landUse == null ? null : pl(PL.landUse, l.landUse)),
            InfoRow('අතුරු බෙදීම්', l.subdivisionAllowed == null ? null : pl(PL.yesNoUnknown, l.subdivisionAllowed)),
            InfoRow('ලිපිනය', l.addressText),
            InfoRow('උතුර', l.boundaryNorth),
            InfoRow('නැගෙනහිර', l.boundaryEast),
            InfoRow('දකුණ', l.boundarySouth),
            InfoRow('බටහිර', l.boundaryWest),
            InfoRow('GPS', l.lat == null ? null : '${l.lat!.toStringAsFixed(6)}, ${l.lng!.toStringAsFixed(6)}'),
            if (l.hasDispute) InfoRow('ආරවුල', l.disputeNote ?? 'ඇත'),
            InfoRow('සටහන්', l.notes),
            if (l.verifiedAt != null)
              InfoRow('තහවුරු කළේ', '${dateFmt.format(l.verifiedAt!)} — ${pl(PL.infoSource, l.infoSource)}'),
          ],
        ),
      ],
    );
  }
}

// ===================================================================
// Buildings
// ===================================================================

class BuildingsSection extends StatelessWidget {
  const BuildingsSection(this.b, {super.key});
  final LandBundle b;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 32),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final t in const ['house', 'cattle_shed', 'well', 'toilet', 'shop'])
                ActionChip(
                  avatar: const Icon(Icons.add, size: 18),
                  label: Text(pl(PL.buildingType, t)),
                  onPressed: () => push(context, BuildingForm(landId: b.land.id, initialType: t)),
                ),
              ActionChip(
                avatar: const Icon(Icons.add, size: 18),
                label: const Text('වෙනත්'),
                onPressed: () => push(context, BuildingForm(landId: b.land.id, initialType: null)),
              ),
            ],
          ),
        ),
        if (b.buildings.isEmpty)
          _noneTile('මෙම ඉඩමේ ගොඩනැගිලි නැත', b.land.noBuildings,
              (v) => setLandFlag(b.land.id, noBuildings: v)),
        for (final x in b.buildings)
          Card(
            child: ListTile(
              leading: _thumb(b.photosOf(x.id).firstOrNull, Icons.home_work),
              title: Text(buildingLabel(x)),
              subtitle: Text([
                if (x.permanence != null) pl(PL.permanence, x.permanence),
                if (x.condition != null) pl(PL.condition, x.condition),
                if (x.wall != null) '${pl(PL.wall, x.wall)} / ${pl(PL.roof, x.roof)}',
                if (x.rooms != null) 'කාමර ${x.rooms}',
                if (x.type == 'house') 'පවුල් ${b.familiesIn(x.id).length}',
                if (x.type == 'house' && b.photosOf(x.id).isEmpty) '⚠ ඡායාරූප නැත',
              ].join(' • ')),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => push(context, BuildingForm(landId: b.land.id, building: x)),
            ),
          ),
      ],
    );
  }
}

// ===================================================================
// People: land parties + families
// ===================================================================

class PeopleSection extends StatelessWidget {
  const PeopleSection(this.b, {super.key});
  final LandBundle b;

  Future<void> _addFamily(BuildContext context) async {
    var buildings = b.buildings.where((x) => x.type != 'well' && x.type != 'toilet').toList();
    if (buildings.isEmpty) {
      if (!await confirm(context, 'පවුලක් එකතු කිරීමට මුලින්ම නිවස එකතු කළ යුතුය. දැන් නිවස එකතු කරන්නද?')) {
        return;
      }
      if (!context.mounted) return;
      final id = await push<String>(context, BuildingForm(landId: b.land.id, initialType: 'house'));
      if (id == null) return;
      final x = await AppState.db.byId(AppState.db.buildings, id);
      buildings = [x!];
    }
    if (!context.mounted) return;
    final fid = await push<String>(context, FamilyForm(landId: b.land.id, buildings: buildings));
    if (fid != null && context.mounted) {
      await push(context, PersonForm(familyId: fid, landId: b.land.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final livable = b.buildings.where((x) => x.type != 'well' && x.type != 'toilet').toList();
    return ListView(
      padding: const EdgeInsets.only(bottom: 32),
      children: [
        SectionTitle('ඉඩමට සම්බන්ධ පුද්ගලයින්',
            trailing: TextButton.icon(
              onPressed: () => editLandParty(context, b.land.id),
              icon: const Icon(Icons.add),
              label: const Text('එකතු කරන්න'),
            )),
        if (b.parties.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('අයිතිකරු, පදිංචිකරු, උරුමකරු ආදී අය මෙහි එකතු කරන්න.'),
          ),
        for (final p in b.parties)
          ListTile(
            leading: const Icon(Icons.badge_outlined),
            title: Text(b.partyName(p)),
            subtitle: Text([
              pl(PL.partyRole, p.role),
              if (p.share != null) 'කොටස ${p.share}',
              if (p.personId == null) 'වසමෙන් පිටත',
            ].join(' • ')),
            onTap: () => editLandParty(context, b.land.id, party: p, partyPerson: b.partyPersons[p.personId]),
          ),
        SectionTitle('පවුල් (${b.families.length})',
            trailing: TextButton.icon(
              onPressed: () => _addFamily(context),
              icon: const Icon(Icons.add),
              label: const Text('පවුලක්'),
            )),
        for (final f in b.families)
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const Icon(Icons.family_restroom),
                  title: Text(familyLabel(b, f)),
                  subtitle: Text([
                    buildingLabel(b.buildings.firstWhere((x) => x.id == f.buildingId,
                        orElse: () => b.buildings.first)),
                    if (f.tenure != null) pl(PL.tenure, f.tenure),
                    if (splitCodes(f.welfare).isNotEmpty) PickRegistry.instance.labels(PL.welfare, f.welfare),
                  ].join(' • ')),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () =>
                        push(context, FamilyForm(landId: b.land.id, buildings: livable, family: f)),
                  ),
                ),
                for (final p in b.membersOf(f.id))
                  ListTile(
                    dense: true,
                    contentPadding: const EdgeInsets.only(left: 32, right: 16),
                    leading: Icon(p.gender == 'f' ? Icons.woman : Icons.man,
                        color: isActive(p) ? null : Theme.of(context).colorScheme.outline),
                    title: Text(p.fullName,
                        style: isActive(p) ? null : const TextStyle(decoration: TextDecoration.lineThrough)),
                    subtitle: Text([
                      pl(PL.relation, p.relation),
                      if (p.dob != null) 'වයස ${ageOn(p.dob!, now)}',
                      if (p.nic != null) maskNic(p.nic),
                      if (p.status != 'resident') pl(PL.personStatus, p.status),
                    ].join(' • ')),
                    onTap: () => push(context, PersonCard(personId: p.id)),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit, size: 20),
                      onPressed: () => push(context, PersonForm(familyId: f.id, landId: b.land.id, person: p)),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, bottom: 8),
                  child: TextButton.icon(
                    onPressed: () => push(context, PersonForm(familyId: f.id, landId: b.land.id)),
                    icon: const Icon(Icons.person_add),
                    label: const Text('සාමාජිකයෙක් එකතු කරන්න'),
                  ),
                ),
              ],
            ),
          ),
        if (b.families.isEmpty)
          const EmptyHint('තවම පවුල් එකතු කර නැත. "පවුලක්" බොත්තම ඔබන්න.', icon: Icons.family_restroom),
      ],
    );
  }
}

// ===================================================================
// Trees & crops
// ===================================================================

class NatureSection extends StatelessWidget {
  const NatureSection(this.b, {super.key});
  final LandBundle b;

  @override
  Widget build(BuildContext context) {
    final counted = b.treeCounts.fold<int>(0, (s, t) => s + t.bearing + t.young);
    final empty = b.treeCounts.isEmpty && b.trees.isEmpty && b.crops.isEmpty;
    return ListView(
      padding: const EdgeInsets.only(bottom: 32),
      children: [
        SectionTitle('ගණනය කළ ගස් ($counted)',
            trailing: TextButton.icon(
              onPressed: () => push(context, TreeCountsScreen(landId: b.land.id, existing: b.treeCounts)),
              icon: const Icon(Icons.edit),
              label: const Text('ගණන් කරන්න'),
            )),
        for (final t in b.treeCounts)
          ListTile(
            dense: true,
            leading: const Icon(Icons.park_outlined),
            title: Text(pl(PL.treeCountSpecies, t.species)),
            trailing: Text('${t.bearing + t.young}', style: Theme.of(context).textTheme.titleMedium),
            subtitle: Text('ඵල දරන ${t.bearing} • ළපටි ${t.young}'),
            onTap: () => push(context, TreeCountsScreen(landId: b.land.id, existing: b.treeCounts)),
          ),
        SectionTitle('වටිනා / දැව ගස් (${b.trees.length})',
            trailing: TextButton.icon(
              onPressed: () => push(context, SingleTreeForm(landId: b.land.id)),
              icon: const Icon(Icons.add),
              label: const Text('තනි ගසක්'),
            )),
        for (final t in b.trees)
          ListTile(
            leading: _thumb(b.photosOf(t.id).firstOrNull, Icons.forest),
            title: Text(pl(PL.treeSingleSpecies, t.species)),
            subtitle: Text([
              if (t.girthIn != null) 'වට අඟල් ${numText(t.girthIn)}',
              if (t.heightFt != null) 'උස අඩි ${numText(t.heightFt)}',
              if (t.condition != null) pl(PL.treeCondition, t.condition),
              if (t.isHazard) '⚠ අනතුරුදායක',
            ].join(' • ')),
            onTap: () => push(context, SingleTreeForm(landId: b.land.id, tree: t)),
          ),
        SectionTitle('බෝග (${b.crops.length})',
            trailing: TextButton.icon(
              onPressed: () => push(context, CropForm(landId: b.land.id)),
              icon: const Icon(Icons.add),
              label: const Text('බෝගයක්'),
            )),
        for (final c in b.crops)
          ListTile(
            leading: const Icon(Icons.grass),
            title: Text(pl(PL.crop, c.crop)),
            subtitle: Text([
              if (c.extentValue != null) '${numText(c.extentValue)} ${pl(PL.cropUnit, c.extentUnit)}',
              if (c.season != null) pl(PL.season, c.season),
              if (c.cultivator != null) pl(PL.cultivator, c.cultivator),
            ].join(' • ')),
            onTap: () => push(context, CropForm(landId: b.land.id, crop: c)),
          ),
        if (empty)
          _noneTile('මෙම ඉඩමේ ගස් / බෝග නැත', b.land.noTrees, (v) => setLandFlag(b.land.id, noTrees: v)),
      ],
    );
  }
}

// ===================================================================
// Animals
// ===================================================================

class AnimalsSection extends StatelessWidget {
  const AnimalsSection(this.b, {super.key});
  final LandBundle b;

  @override
  Widget build(BuildContext context) {
    Widget form([Animal? a]) => AnimalForm(
          landId: b.land.id,
          families: b.families,
          animal: a,
          familyLabel: (f) => familyLabel(b, f),
        );
    return ListView(
      padding: const EdgeInsets.only(bottom: 32),
      children: [
        SectionTitle('සතුන් (${b.animalTotal})',
            trailing: TextButton.icon(
              onPressed: () => push(context, form()),
              icon: const Icon(Icons.add),
              label: const Text('එකතු කරන්න'),
            )),
        for (final a in b.animals)
          Card(
            child: ListTile(
              leading: const Icon(Icons.pets),
              title: Text('${pl(PL.animal, a.species)} — ${a.male + a.female + a.young}'),
              subtitle: Text([
                'පි. ${a.male} • ගැ. ${a.female} • පැ. ${a.young}',
                if (a.purpose != null) pl(PL.animalPurpose, a.purpose),
                if (a.dailyMilkL != null) 'කිරි ලී. ${numText(a.dailyMilkL)}/දින',
                if (a.vaccinated != null) 'එන්නත්: ${pl(PL.yesNoUnknown, a.vaccinated)}',
              ].join(' • ')),
              onTap: () => push(context, form(a)),
            ),
          ),
        if (b.animals.isEmpty)
          _noneTile('මෙම ඉඩමේ සතුන් නැත', b.land.noAnimals, (v) => setLandFlag(b.land.id, noAnimals: v)),
      ],
    );
  }
}

// ===================================================================
// Photos
// ===================================================================

class PhotosSection extends StatelessWidget {
  const PhotosSection(this.b, {super.key});
  final LandBundle b;

  @override
  Widget build(BuildContext context) {
    final landPhotos = b.photos.where((p) => p.ownerType == 'land').toList();
    final others = b.photos.where((p) => p.ownerType != 'land').toList();
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        const Text('ඉඩමේ ඡායාරූප'),
        PhotoStrip(ownerType: 'land', ownerId: b.land.id, landId: b.land.id, photos: landPhotos),
        if (others.isNotEmpty) ...[
          const SizedBox(height: 16),
          const Text('ගොඩනැගිලි / ගස්වල ඡායාරූප'),
          const SizedBox(height: 8),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
            children: [
              for (final p in others)
                GestureDetector(
                  onTap: () => openPhoto(context, p),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(AppState.photoFile(p.fileName), fit: BoxFit.cover, cacheWidth: 300,
                        errorBuilder: (_, _, _) => const Icon(Icons.broken_image)),
                  ),
                ),
            ],
          ),
        ],
      ],
    );
  }
}

// ===================================================================
// History
// ===================================================================

const _entityLabels = {
  'lands': 'ඉඩම',
  'land_parties': 'ඉඩමට සම්බන්ධ පුද්ගලයා',
  'buildings': 'ගොඩනැගිල්ල',
  'families': 'පවුල',
  'persons': 'පුද්ගලයා',
  'residence_events': 'පදිංචි වෙනස්වීම',
  'tree_counts': 'ගණනය කළ ගස්',
  'trees': 'තනි ගස',
  'crops': 'බෝගය',
  'animals': 'සතුන්',
  'photos': 'ඡායාරූපය',
};

const _actionLabels = {'create': 'එකතු කළා', 'update': 'වෙනස් කළා', 'delete': 'ඉවත් කළා'};

const _fieldLabels = {
  'name': 'නම',
  'fullName': 'නම',
  'nic': 'හැඳුනුම්පත',
  'dob': 'උපන් දිනය',
  'status': 'තත්ත්වය',
  'extentPerches': 'ප්‍රමාණය',
  'ownershipType': 'අයිතිය',
  'landUse': 'භාවිතය',
  'condition': 'තත්ත්වය',
  'bearing': 'ඵල දරන',
  'young': 'ළපටි',
  'relation': 'සම්බන්ධතාව',
  'occupation': 'රැකියාව',
  'education': 'අධ්‍යාපනය',
  'lat': 'GPS',
  'type': 'වර්ගය',
  'species': 'වර්ගය',
  'male': 'පිරිමි',
  'female': 'ගැහැණු',
};

class HistorySection extends StatelessWidget {
  const HistorySection(this.landId, {super.key});
  final String landId;

  String _value(dynamic v) {
    if (v == null) return '—';
    if (v is int && v > 100000000000) {
      return dateFmt.format(DateTime.fromMillisecondsSinceEpoch(v));
    }
    final s = '$v';
    return s.length > 40 ? '${s.substring(0, 40)}…' : s;
  }

  @override
  Widget build(BuildContext context) {
    final db = AppState.db;
    return StreamBuilder<List<ChangeLog>>(
      stream: db.watchLoad([db.changeLogs], () => db.loadHistory(landId)),
      builder: (context, snap) {
        final logs = snap.data;
        if (logs == null) return const Center(child: CircularProgressIndicator());
        if (logs.isEmpty) return const EmptyHint('ඉතිහාසයක් නැත');
        return ListView.separated(
          itemCount: logs.length,
          separatorBuilder: (_, _) => const Divider(height: 1),
          itemBuilder: (context, i) {
            final c = logs[i];
            final changes = (jsonDecode(c.changes) as Map<String, dynamic>)
              ..removeWhere((k, _) => const {'id', 'landId', 'deletedAt', 'gpsAccuracy', 'lng'}.contains(k));
            return ListTile(
              dense: true,
              title: Text('${_entityLabels[c.entity] ?? c.entity} — ${_actionLabels[c.action] ?? c.action}'),
              subtitle: Text([
                dateTimeFmt.format(c.at),
                if (c.action == 'update')
                  for (final e in changes.entries.take(4))
                    '${_fieldLabels[e.key] ?? e.key}: ${_value((e.value as List)[0])} → ${_value((e.value as List)[1])}',
              ].join('\n')),
            );
          },
        );
      },
    );
  }
}
