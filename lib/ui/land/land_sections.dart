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
import '../../l10n/l10n.dart';

Future<T?> push<T>(BuildContext context, Widget page) =>
    Navigator.of(context).push<T>(MaterialPageRoute(builder: (_) => page));

String familyLabel(LandBundle b, Family f) {
  final head = b.persons.where((p) => p.id == f.headPersonId).firstOrNull;
  return head == null ? L10n.current.familyNoHead : L10n.current.familyOf(head.fullName);
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
      subtitle: Text(L10n.current.forCompleteness),
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
    final t = context.l10n;
    final l = b.land;
    final check = checkLand(b);
    final nics = b.persons.map((p) => p.nic).whereType<String>().toSet();
    final done = check.items.where((i) => i.ok).length;
    return ListView(
      padding: const EdgeInsets.only(bottom: 40),
      children: [
        // ---- counts
        SectionCard(
          title: t.onThisLand,
          icon: Icons.dashboard_rounded,
          children: [
            const SizedBox(height: 4),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              MiniStat(Icons.home_work_rounded, '${b.buildings.length}', t.buildings, Brand.gold),
              MiniStat(Icons.family_restroom_rounded, '${b.families.length}', t.families, Brand.terracotta),
              MiniStat(Icons.people_alt_rounded, '${b.persons.where(isActive).length}', t.persons, Brand.brown),
            ]),
            const SizedBox(height: 12),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              MiniStat(Icons.park_rounded, '${b.treeTotal}', t.trees, Brand.ok),
              MiniStat(Icons.pets_rounded, '${b.animalTotal}', t.animals, Brand.slate),
              MiniStat(Icons.photo_library_rounded, '${b.photos.length}', t.photos, Brand.olive),
            ]),
          ],
        ),

        // ---- completeness
        SectionCard(
          title: t.completeness,
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
                      ? t.allSectionsComplete
                      : t.sectionsDone(done, check.items.length, check.missing.map((m) => m.label).join(', ')),
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
              for (final d in dups) t.nicDupElsewhere(d.nic ?? '', d.fullName),
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
                    Text(t.pleaseCheckN(warnings.length),
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
                            !await confirm(context, t.markCompleteConfirm(check.missing.length, t.markComplete))) {
                          return;
                        }
                        if (context.mounted) await _setStatus(context, 'complete');
                      },
                      icon: const Icon(Icons.task_alt_rounded),
                      label: Text(t.markComplete),
                    ),
                  ),
                if (l.status == 'draft') const SizedBox(width: 10),
                if (l.status != 'verified')
                  Expanded(
                    child: FilledButton.icon(
                      style: FilledButton.styleFrom(backgroundColor: Brand.ok),
                      onPressed: () => _setStatus(context, 'verified'),
                      icon: const Icon(Icons.verified_rounded),
                      label: Text(t.verify),
                    ),
                  ),
                if (l.status != 'draft')
                  TextButton(
                    onPressed: () => _setStatus(context, 'draft'),
                    child: Text(t.backToDraft),
                  ),
              ],
            ),
          ),

        // ---- details
        SectionCard(
          title: t.landDetails,
          icon: Icons.description_rounded,
          color: Brand.brownMid,
          padding: const EdgeInsets.fromLTRB(0, 12, 0, 6),
          trailing: showActions
              ? Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: TextButton.icon(
                    onPressed: () => push(context, LandForm(land: l)),
                    icon: const Icon(Icons.edit_rounded, size: 18),
                    label: Text(t.edit),
                  ),
                )
              : null,
          children: [
            InfoRow(t.fExtent,
                l.extentPerches == null ? null : '${formatExtent(l.extentPerches)} (${formatHectares(l.extentPerches)})'),
            InfoRow(PickRegistry.instance.def(PL.extentSource).title,
                l.extentSource == null ? null : pl(PL.extentSource, l.extentSource)),
            InfoRow(t.fOwnership, l.ownershipType == null ? null : pl(PL.ownership, l.ownershipType)),
            InfoRow(t.fOwners, b.ownerNames.join(', ')),
            InfoRow(t.fDeedPermitNo, l.deedNo),
            InfoRow(t.fPlanLotNo, [l.planNo, l.lotNo].whereType<String>().join(' / ')),
            InfoRow(t.fScheme, l.schemeName),
            InfoRow(t.fUse, l.landUse == null ? null : pl(PL.landUse, l.landUse)),
            InfoRow(t.fSubdivision, l.subdivisionAllowed == null ? null : pl(PL.yesNoUnknown, l.subdivisionAllowed)),
            InfoRow(t.fAddress, l.addressText),
            InfoRow(t.fNorth, l.boundaryNorth),
            InfoRow(t.fEast, l.boundaryEast),
            InfoRow(t.fSouth, l.boundarySouth),
            InfoRow(t.fWest, l.boundaryWest),
            InfoRow('GPS', l.lat == null ? null : '${l.lat!.toStringAsFixed(6)}, ${l.lng!.toStringAsFixed(6)}'),
            if (l.hasDispute) InfoRow(t.fDispute, l.disputeNote ?? t.disputeExists),
            InfoRow(t.notes, l.notes),
            if (l.verifiedAt != null)
              InfoRow(t.fVerified, '${dateFmt.format(l.verifiedAt!)} — ${pl(PL.infoSource, l.infoSource)}'),
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
    final t = context.l10n;
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
                label: Text(t.other),
                onPressed: () => push(context, BuildingForm(landId: b.land.id, initialType: null)),
              ),
            ],
          ),
        ),
        if (b.buildings.isEmpty)
          _noneTile(t.noBuildingsOnLand, b.land.noBuildings,
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
                if (x.rooms != null) t.roomsN(x.rooms!),
                if (x.type == 'house') t.familiesN(b.familiesIn(x.id).length),
                if (x.type == 'house' && b.photosOf(x.id).isEmpty) t.noPhotosWarning,
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
      if (!await confirm(context, context.l10n.addHouseFirstConfirm)) {
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
    final t = context.l10n;
    final now = DateTime.now();
    final livable = b.buildings.where((x) => x.type != 'well' && x.type != 'toilet').toList();
    return ListView(
      padding: const EdgeInsets.only(bottom: 32),
      children: [
        SectionTitle(t.landParties,
            trailing: TextButton.icon(
              onPressed: () => editLandParty(context, b.land.id),
              icon: const Icon(Icons.add),
              label: Text(t.add),
            )),
        if (b.parties.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(t.landPartiesHint),
          ),
        for (final p in b.parties)
          ListTile(
            leading: const Icon(Icons.badge_outlined),
            title: Text(b.partyName(p)),
            subtitle: Text([
              pl(PL.partyRole, p.role),
              if (p.share != null) t.shareN(p.share!),
              if (p.personId == null) t.outsideDivision,
            ].join(' • ')),
            onTap: () => editLandParty(context, b.land.id, party: p, partyPerson: b.partyPersons[p.personId]),
          ),
        SectionTitle('${t.families} (${b.families.length})',
            trailing: TextButton.icon(
              onPressed: () => _addFamily(context),
              icon: const Icon(Icons.add),
              label: Text(t.addFamilyButton),
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
                      if (p.dob != null) t.ageN(ageOn(p.dob!, now)),
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
                    label: Text(t.addMember),
                  ),
                ),
              ],
            ),
          ),
        if (b.families.isEmpty)
          EmptyHint(t.noFamiliesYet(t.addFamilyButton), icon: Icons.family_restroom),
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
    final l10n = context.l10n;
    final counted = b.treeCounts.fold<int>(0, (s, t) => s + t.bearing + t.young);
    final empty = b.treeCounts.isEmpty && b.trees.isEmpty && b.crops.isEmpty;
    return ListView(
      padding: const EdgeInsets.only(bottom: 32),
      children: [
        SectionTitle('${l10n.countedTrees} ($counted)',
            trailing: TextButton.icon(
              onPressed: () => push(context, TreeCountsScreen(landId: b.land.id, existing: b.treeCounts)),
              icon: const Icon(Icons.edit),
              label: Text(l10n.countAction),
            )),
        for (final t in b.treeCounts)
          ListTile(
            dense: true,
            leading: const Icon(Icons.park_outlined),
            title: Text(pl(PL.treeCountSpecies, t.species)),
            trailing: Text('${t.bearing + t.young}', style: Theme.of(context).textTheme.titleMedium),
            subtitle: Text(l10n.bearingYoung(t.bearing, t.young)),
            onTap: () => push(context, TreeCountsScreen(landId: b.land.id, existing: b.treeCounts)),
          ),
        SectionTitle('${l10n.valuableTimberTrees} (${b.trees.length})',
            trailing: TextButton.icon(
              onPressed: () => push(context, SingleTreeForm(landId: b.land.id)),
              icon: const Icon(Icons.add),
              label: Text(l10n.singleTree),
            )),
        for (final t in b.trees)
          ListTile(
            leading: _thumb(b.photosOf(t.id).firstOrNull, Icons.forest),
            title: Text(pl(PL.treeSingleSpecies, t.species)),
            subtitle: Text([
              if (t.girthIn != null) l10n.girthInN(numText(t.girthIn)),
              if (t.heightFt != null) l10n.heightFtN(numText(t.heightFt)),
              if (t.condition != null) pl(PL.treeCondition, t.condition),
              if (t.isHazard) l10n.hazardWarning,
            ].join(' • ')),
            onTap: () => push(context, SingleTreeForm(landId: b.land.id, tree: t)),
          ),
        SectionTitle('${l10n.crops} (${b.crops.length})',
            trailing: TextButton.icon(
              onPressed: () => push(context, CropForm(landId: b.land.id)),
              icon: const Icon(Icons.add),
              label: Text(l10n.addCropButton),
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
          _noneTile(l10n.noTreesOnLand, b.land.noTrees, (v) => setLandFlag(b.land.id, noTrees: v)),
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
    final t = context.l10n;
    return ListView(
      padding: const EdgeInsets.only(bottom: 32),
      children: [
        SectionTitle('${t.animals} (${b.animalTotal})',
            trailing: TextButton.icon(
              onPressed: () => push(context, form()),
              icon: const Icon(Icons.add),
              label: Text(t.add),
            )),
        for (final a in b.animals)
          Card(
            child: ListTile(
              leading: const Icon(Icons.pets),
              title: Text('${pl(PL.animal, a.species)} — ${a.male + a.female + a.young}'),
              subtitle: Text([
                t.animalCountsShort(a.male, a.female, a.young),
                if (a.purpose != null) pl(PL.animalPurpose, a.purpose),
                if (a.dailyMilkL != null) t.milkLitresPerDay(numText(a.dailyMilkL)),
                if (a.vaccinated != null) t.vaccinatedValue(pl(PL.yesNoUnknown, a.vaccinated)),
              ].join(' • ')),
              onTap: () => push(context, form(a)),
            ),
          ),
        if (b.animals.isEmpty)
          _noneTile(t.noAnimalsOnLand, b.land.noAnimals, (v) => setLandFlag(b.land.id, noAnimals: v)),
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
        Text(context.l10n.landPhotos),
        PhotoStrip(ownerType: 'land', ownerId: b.land.id, landId: b.land.id, photos: landPhotos),
        if (others.isNotEmpty) ...[
          const SizedBox(height: 16),
          Text(context.l10n.otherPhotos),
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

String _entityLabel(AppLocalizations t, String entity) => switch (entity) {
      'lands' => t.land,
      'land_parties' => t.entLandParty,
      'buildings' => t.entBuilding,
      'families' => t.family,
      'persons' => t.person,
      'residence_events' => t.entResidenceEvent,
      'tree_counts' => t.countedTrees,
      'trees' => t.entTree,
      'crops' => t.entCrop,
      'animals' => t.animals,
      'photos' => t.entPhoto,
      _ => entity,
    };

String _actionLabel(AppLocalizations t, String action) => switch (action) {
      'create' => t.actCreate,
      'update' => t.actUpdate,
      'delete' => t.actDelete,
      _ => action,
    };

String _fieldLabel(AppLocalizations t, String field) => switch (field) {
      'name' || 'fullName' => t.name,
      'nic' => t.fNic,
      'dob' => t.fDob,
      'status' => t.fStatus,
      'extentPerches' => t.fExtent,
      'ownershipType' => t.fOwnership,
      'landUse' => t.fUse,
      'condition' => PickRegistry.instance.def(PL.condition).title,
      'bearing' => t.fBearing,
      'young' => t.fYoungTrees,
      'relation' => t.fRelation,
      'occupation' => PickRegistry.instance.def(PL.occupation).title,
      'education' => PickRegistry.instance.def(PL.education).title,
      'lat' => 'GPS',
      'type' || 'species' => t.fType,
      'male' => t.fMaleAnimals,
      'female' => t.fFemaleAnimals,
      _ => field,
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
        final t = context.l10n;
        if (logs.isEmpty) return EmptyHint(t.noHistory);
        return ListView.separated(
          itemCount: logs.length,
          separatorBuilder: (_, _) => const Divider(height: 1),
          itemBuilder: (context, i) {
            final c = logs[i];
            final changes = (jsonDecode(c.changes) as Map<String, dynamic>)
              ..removeWhere((k, _) => const {'id', 'landId', 'deletedAt', 'gpsAccuracy', 'lng'}.contains(k));
            return ListTile(
              dense: true,
              title: Text('${_entityLabel(t, c.entity)} — ${_actionLabel(t, c.action)}'),
              subtitle: Text([
                dateTimeFmt.format(c.at),
                if (c.action == 'update')
                  for (final e in changes.entries.take(4))
                    '${_fieldLabel(t, e.key)}: ${_value((e.value as List)[0])} → ${_value((e.value as List)[1])}',
              ].join('\n')),
            );
          },
        );
      },
    );
  }
}
