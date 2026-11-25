import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:smartgrama/data/analytics.dart';
import 'package:smartgrama/data/nic.dart';
import 'package:smartgrama/data/picklists.dart';
import 'package:smartgrama/data/units.dart';
import 'package:smartgrama/l10n/l10n.dart';

final _sinhala = RegExp('[඀-෿]');
final _tamil = RegExp('[஀-௿]');
final _placeholder = RegExp(r'\{(\w+)');

Map<String, dynamic> _arb(String lang) =>
    jsonDecode(File('lib/l10n/app_$lang.arb').readAsStringSync()) as Map<String, dynamic>;

Set<String> _placeholders(String message) =>
    _placeholder.allMatches(message).map((m) => m[1]!).where((p) => int.tryParse(p) == null).toSet();

void main() {
  tearDown(() => L10n.lang.value = AppLang.si);

  group('ARB files', () {
    final en = _arb('en'), si = _arb('si'), ta = _arb('ta');
    Iterable<String> keys(Map<String, dynamic> m) => m.keys.where((k) => !k.startsWith('@'));

    test('all three languages have exactly the same messages', () {
      expect(keys(si).toSet(), keys(en).toSet());
      expect(keys(ta).toSet(), keys(en).toSet());
    });

    test('placeholders match the English template', () {
      for (final k in keys(en)) {
        final want = _placeholders(en[k] as String);
        expect(_placeholders(si[k] as String), want, reason: 'si: $k');
        expect(_placeholders(ta[k] as String), want, reason: 'ta: $k');
      }
    });

    test('every message is non-empty and written in its own script', () {
      for (final k in keys(en)) {
        final e = en[k] as String, s = si[k] as String, t = ta[k] as String;
        expect(e.trim(), isNotEmpty, reason: k);
        expect(_sinhala.hasMatch(e) || _tamil.hasMatch(e), isFalse, reason: 'en has si/ta text: $k');
        expect(_tamil.hasMatch(s), isFalse, reason: 'si has Tamil: $k');
        expect(_sinhala.hasMatch(t), isFalse, reason: 'ta has Sinhala: $k');
        // Short neutral strings ("OK"-like codes, numbers) may stay Latin.
        if (_sinhala.hasMatch(s) == false) {
          expect(s, e, reason: 'si has no Sinhala but differs from en: $k');
        }
        if (_tamil.hasMatch(t) == false) {
          expect(t, e, reason: 'ta has no Tamil but differs from en: $k');
        }
      }
    });
  });

  group('pick lists', () {
    test('every built-in option has a label in all three languages', () {
      for (final d in pickListDefs) {
        final codes = <String>{};
        for (final o in [...d.options]) {
          expect(codes.add(o.code), isTrue, reason: 'duplicate ${d.name}/${o.code}');
          expect(_sinhala.hasMatch(o.si), isTrue, reason: 'si ${d.name}/${o.code}');
          expect(_tamil.hasMatch(o.ta), isTrue, reason: 'ta ${d.name}/${o.code}');
          expect(o.en.trim(), isNotEmpty, reason: 'en ${d.name}/${o.code}');
          expect(_sinhala.hasMatch(o.en) || _tamil.hasMatch(o.en), isFalse, reason: 'en ${d.name}/${o.code}');
        }
        expect(_sinhala.hasMatch(d.titles.si) && _tamil.hasMatch(d.titles.ta) && d.titles.en.isNotEmpty, isTrue,
            reason: 'title ${d.name}');
      }
    });

    test('labels follow the current language; codes do not change', () {
      L10n.lang.value = AppLang.si;
      expect(pl(PL.treeCountSpecies, 'coconut'), 'පොල්');
      L10n.lang.value = AppLang.en;
      expect(pl(PL.treeCountSpecies, 'coconut'), 'Coconut');
      L10n.lang.value = AppLang.ta;
      expect(pl(PL.treeCountSpecies, 'coconut'), 'தென்னை');
      expect(pl(PL.season, 'maha'), 'பெரும்போகம்');
    });

    test('search matches an option typed in any language', () {
      final o = PickRegistry.instance.def(PL.animal).options.firstWhere((o) => o.code == 'cattle');
      expect(o.names.matches('ගව'), isTrue);
      expect(o.names.matches('cATtle'), isTrue);
      expect(o.names.matches('மாடு'), isTrue);
    });

    test('officer-added options show the same text in every language', () {
      PickRegistry.instance.setCustom(const [CustomPick(PL.crop, 'c_1', 'Kohila')]);
      for (final l in AppLang.values) {
        L10n.lang.value = l;
        expect(pl(PL.crop, 'c_1'), 'Kohila');
      }
      PickRegistry.instance.setCustom(const []);
    });
  });

  test('land extent is written in each language', () {
    L10n.lang.value = AppLang.si;
    expect(formatExtent(250), 'අක්. 1 රූ. 2 පර්. 10');
    L10n.lang.value = AppLang.en;
    expect(formatExtent(250), 'A 1 R 2 P 10');
    expect(formatExtent(20), 'P 20');
    expect(formatHectares(395.369), '1.000 ha');
    L10n.lang.value = AppLang.ta;
    expect(formatExtent(250), 'ஏக்கர் 1 ரூட் 2 பேர்ச் 10');
  });

  test('NIC errors are localized', () {
    final r = parseNic('12345');
    expect(r.errorCode, NicError.format);
    L10n.lang.value = AppLang.en;
    expect(r.error, startsWith('Wrong format'));
    L10n.lang.value = AppLang.ta;
    expect(r.error, startsWith('தவறான வடிவம்'));
  });

  test('ready-made list titles follow the language', () {
    final list = readyLists.firstWhere((r) => r.id == 'elderly60');
    L10n.lang.value = AppLang.si;
    expect(list.title, 'වයස 60 ට වැඩි අය');
    L10n.lang.value = AppLang.en;
    expect(list.title, 'Aged 60 and over');
    L10n.lang.value = AppLang.ta;
    expect(_tamil.hasMatch(list.title), isTrue);
  });

  test('English plurals', () {
    final en = L10n.of(AppLang.en);
    expect(en.itemsN(1), '1 item');
    expect(en.itemsN(3), '3 items');
    expect(en.dashIssues(1), '1 item needs checking');
    expect(L10n.of(AppLang.si).itemsN(3), '3 අයිතම');
  });
}
