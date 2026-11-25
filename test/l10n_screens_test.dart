// Renders the main screens with demo data in Sinhala, English and Tamil on
// a phone-sized screen (normal and "very large" text) and fails on any
// layout overflow or exception. Tamil words are long, so this guards the
// layout of every translated screen.
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smartgrama/app_state.dart';
import 'package:smartgrama/data/bundle.dart';
import 'package:smartgrama/data/database.dart';
import 'package:smartgrama/data/demo_seed.dart';
import 'package:smartgrama/l10n/l10n.dart';
import 'package:smartgrama/theme.dart';
import 'package:smartgrama/ui/forms/building_form.dart';
import 'package:smartgrama/ui/forms/land_form.dart';
import 'package:smartgrama/ui/forms/person_form.dart';
import 'package:smartgrama/ui/home/dashboard.dart';
import 'package:smartgrama/ui/home/home_shell.dart';
import 'package:smartgrama/ui/home/land_list_screen.dart';
import 'package:smartgrama/ui/land/land_card.dart';
import 'package:smartgrama/ui/people/person_card.dart';
import 'package:smartgrama/ui/reports/reports_screen.dart';
import 'package:smartgrama/ui/settings/settings_screen.dart';
import 'package:smartgrama/ui/setup/language_screen.dart';
import 'package:smartgrama/ui/setup/setup_screen.dart';
import 'package:smartgrama/ui/setup/structure_screen.dart';

void main() {
  late Directory dir;
  late AppDb db;
  late Land land;
  late Person person;
  late Family family;

  setUpAll(() async {
    FlutterSecureStorage.setMockInitialValues({});
    dir = Directory.systemTemp.createTempSync('sgl10n');
    db = AppDb.open(File('${dir.path}/a.sqlite'), 'cafe1234');
    AppState.db = db;
    AppState.photosDir = Directory('${dir.path}/photos')..createSync();
    await seedDemo(db);
    await AppState.reloadPicks();
    final s = await db.loadSnapshot();
    land = s.lands.first;
    family = s.families.first;
    person = s.persons.firstWhere((p) => p.familyId == family.id);
  });

  tearDownAll(() async {
    await db.close();
    dir.deleteSync(recursive: true);
  });

  final screens = <String, Widget Function()>{
    'language': () => LanguageScreen(onDone: () {}),
    'home': () => const HomeShell(),
    'dashboard': () => Dashboard(onOpenTab: (_) {}),
    'lands': () => const LandListScreen(),
    for (var tab = 0; tab < 7; tab++) 'land card tab $tab': () => LandCard(landId: land.id, initialTab: tab),
    'person card': () => PersonCard(personId: person.id),
    'reports': () => const ReportsScreen(),
    'statistics': () => const StatsScreen(),
    'ready lists': () => const ReadyListsScreen(),
    'data checks': () => const QualityScreen(),
    'settings': () => const SettingsScreen(),
    'pick lists': () => const PickListsScreen(),
    'division setup': () => SetupScreen(onDone: (_) {}),
    'villages': () => StructureScreen(onDone: () {}),
    'land form': () => LandForm(land: land),
    'person form': () => PersonForm(familyId: family.id, landId: land.id, person: person),
    'building form': () => BuildingForm(landId: land.id, initialType: 'house'),
  };

  for (final lang in AppLang.values) {
    for (final scale in [1.0, 1.3]) {
      for (final e in screens.entries) {
        testWidgets('${lang.code} ×$scale ${e.key}', (tester) async {
          tester.view.physicalSize = const Size(393 * 3, 852 * 3);
          tester.view.devicePixelRatio = 3;
          addTearDown(tester.view.reset);
          L10n.lang.value = lang;
          addTearDown(() => L10n.lang.value = AppLang.si);

          await tester.pumpWidget(MaterialApp(
            theme: buildTheme(lang),
            locale: lang.locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            builder: (context, child) => MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(scale * fontBoostFor(lang))),
              child: child!,
            ),
            home: e.value(),
          ));
          // Let the database streams deliver (real async), then settle.
          for (var i = 0; i < 6; i++) {
            await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 60)));
            await tester.pump(const Duration(milliseconds: 50));
          }
          expect(tester.takeException(), isNull);
        });
      }
    }
  }
}
