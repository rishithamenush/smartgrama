/// Land extent units. Everything is stored in perches; the UI converts.
///
/// 1 acre = 4 roods = 160 perches; 1 perch = 25.29285264 m²;
/// 1 hectare = 10,000 m² ≈ 395.369 perches.
library;

import '../l10n/l10n.dart';

const double sqmPerPerch = 25.29285264;
const double perchesPerHectare = 10000 / sqmPerPerch;

double arpToPerches({num acres = 0, num roods = 0, num perches = 0}) =>
    acres * 160.0 + roods * 40.0 + perches.toDouble();

double hectaresToPerches(num ha) => ha * perchesPerHectare;
double perchesToHectares(num p) => p / perchesPerHectare;
double acresToPerches(num a) => a * 160.0;

class Arp {
  const Arp(this.acres, this.roods, this.perches);
  final int acres;
  final int roods;
  final double perches;
}

Arp perchesToArp(double total) {
  final acres = total ~/ 160;
  final rest = total - acres * 160;
  final roods = rest ~/ 40;
  final p = rest - roods * 40;
  return Arp(acres, roods, double.parse(p.toStringAsFixed(2)));
}

String _num(double v) =>
    v == v.roundToDouble() ? v.toStringAsFixed(0) : v.toStringAsFixed(2);

/// Human readable extent in the current language, e.g.
/// "අක්. 1 රූ. 2 පර්. 10" / "A 1 R 2 P 10" / "ஏக்கர் 1 ரூட் 2 பேர்ச் 10",
/// or "පර්. 20" / "P 20" / "பேர்ச் 20" under one acre.
String formatExtent(double? perches) {
  if (perches == null) return '—';
  final t = L10n.current;
  if (perches < 160) return t.extentPerches(_num(perches));
  final a = perchesToArp(perches);
  final parts = <String>[t.extentAcres('${a.acres}')];
  if (a.roods > 0) parts.add(t.extentRoods('${a.roods}'));
  if (a.perches > 0) parts.add(t.extentPerches(_num(a.perches)));
  return parts.join(' ');
}

String formatHectares(double? perches) =>
    perches == null ? '—' : L10n.current.extentHectares(perchesToHectares(perches).toStringAsFixed(3));

/// Converts a crop extent in any unit to perches (null for plant counts).
double? cropExtentToPerches(double value, String unit) => switch (unit) {
      'perch' => value,
      'acre' => acresToPerches(value),
      'hectare' => hectaresToPerches(value),
      _ => null,
    };
