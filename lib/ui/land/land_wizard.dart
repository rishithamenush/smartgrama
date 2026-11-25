import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';

import '../../app_state.dart';
import '../../data/analytics.dart';
import '../../data/bundle.dart';
import '../../data/database.dart';
import '../../theme.dart';
import '../forms/land_form.dart';
import '../widgets/brand.dart';
import 'land_sections.dart';
import '../../l10n/l10n.dart';

/// Wizard step names in the current language.
List<String> wizardSteps(AppLocalizations t) =>
    [t.land, t.buildings, t.people, t.treesAndCrops, t.animals, t.review];

/// Starts the "new place" flow: land form, then the step-by-step wizard.
Future<void> startNewLand(NavigatorState nav) async {
  final id = await nav.push<String>(MaterialPageRoute(builder: (_) => const LandForm()));
  if (id != null && nav.mounted) {
    await nav.push(MaterialPageRoute(builder: (_) => LandWizard(landId: id, startStep: 1)));
  }
}

/// Six steps for one place while walking house to house. Every step can be
/// skipped and finished later from the land card.
class LandWizard extends StatefulWidget {
  const LandWizard({super.key, required this.landId, this.startStep = 0});
  final String landId;
  final int startStep;

  @override
  State<LandWizard> createState() => _LandWizardState();
}

class _LandWizardState extends State<LandWizard> {
  late int _step = widget.startStep;

  Widget _body(LandBundle b) => switch (_step) {
        0 => SummarySection(b, showActions: false),
        1 => BuildingsSection(b),
        2 => PeopleSection(b),
        3 => NatureSection(b),
        4 => AnimalsSection(b),
        _ => SummarySection(b),
      };

  @override
  Widget build(BuildContext context) {
    final db = AppState.db;
    final t = context.l10n;
    final steps = wizardSteps(t);
    return StreamBuilder<LandBundle?>(
      stream: db.watchBundle(widget.landId),
      builder: (context, snap) {
        final b = snap.data;
        final last = _step == steps.length - 1;
        return BrandPage(
          title: b?.land.name ?? '',
          subtitle: t.stepOf(_step + 1, steps.length, steps[_step]),
          actions: [
            if (_step == 0 && b != null)
              HeaderAction(Icons.edit_rounded, () => push(context, LandForm(land: b.land))),
          ],
          headerChild: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: (_step + 1) / steps.length,
                  minHeight: 6,
                  color: Brand.gold,
                  backgroundColor: Colors.white.withValues(alpha: 0.18),
                ),
              ),
              const SizedBox(height: 10),
              HeaderChips(items: [
                for (var i = 0; i < steps.length; i++)
                  ('${i + 1}. ${steps[i]}', _step == i, () => setState(() => _step = i)),
              ]),
            ],
          ),
          body: b == null ? const Center(child: CircularProgressIndicator()) : _body(b),
          bottomBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 8),
              child: Row(
                children: [
                  if (_step > 0)
                    OutlinedButton.icon(
                      onPressed: () => setState(() => _step--),
                      icon: const Icon(Icons.arrow_back),
                      label: Text(t.back),
                    ),
                  const Spacer(),
                  if (!last)
                    FilledButton.icon(
                      onPressed: () => setState(() => _step++),
                      icon: const Icon(Icons.arrow_forward),
                      label: Text(t.nextStep(steps[_step + 1])),
                    )
                  else ...[
                    TextButton(onPressed: () => Navigator.pop(context), child: Text(t.finish)),
                    const SizedBox(width: 8),
                    FilledButton.icon(
                      onPressed: b == null
                          ? null
                          : () async {
                              final check = checkLand(b);
                              if (b.land.status == 'draft' && check.missing.isEmpty) {
                                await db.saveRow(
                                    db.lands, b.land.id, const LandsCompanion(status: Value('complete')),
                                    landId: b.land.id);
                              }
                              if (!context.mounted) return;
                              final nav = Navigator.of(context);
                              nav.pop();
                              await startNewLand(nav);
                            },
                      icon: const Icon(Icons.add_home),
                      label: Text(t.nextPlace),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
