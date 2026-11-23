import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';

import '../../app_state.dart';
import '../../data/analytics.dart';
import '../../data/bundle.dart';
import '../../data/database.dart';
import '../forms/land_form.dart';
import 'land_sections.dart';

const wizardSteps = ['ඉඩම', 'ගොඩනැගිලි', 'මිනිසුන්', 'ගස් හා බෝග', 'සතුන්', 'සමාලෝචනය'];

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
    return StreamBuilder<LandBundle?>(
      stream: db.watchBundle(widget.landId),
      builder: (context, snap) {
        final b = snap.data;
        final last = _step == wizardSteps.length - 1;
        return Scaffold(
          appBar: AppBar(
            title: Text(b?.land.name ?? ''),
            actions: [
              if (_step == 0 && b != null)
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => push(context, LandForm(land: b.land)),
                ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(56),
              child: SizedBox(
                height: 56,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  children: [
                    for (var i = 0; i < wizardSteps.length; i++)
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: ChoiceChip(
                          avatar: CircleAvatar(
                            radius: 10,
                            child: Text('${i + 1}', style: const TextStyle(fontSize: 11)),
                          ),
                          label: Text(wizardSteps[i]),
                          selected: _step == i,
                          onSelected: (_) => setState(() => _step = i),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          body: b == null ? const Center(child: CircularProgressIndicator()) : _body(b),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 8),
              child: Row(
                children: [
                  if (_step > 0)
                    OutlinedButton.icon(
                      onPressed: () => setState(() => _step--),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('ආපසු'),
                    ),
                  const Spacer(),
                  if (!last)
                    FilledButton.icon(
                      onPressed: () => setState(() => _step++),
                      icon: const Icon(Icons.arrow_forward),
                      label: Text('ඊළඟ: ${wizardSteps[_step + 1]}'),
                    )
                  else ...[
                    TextButton(onPressed: () => Navigator.pop(context), child: const Text('අවසන්')),
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
                      label: const Text('ඊළඟ ස්ථානය'),
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
