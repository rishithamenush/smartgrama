import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../theme.dart';
import '../../l10n/l10n.dart';

/// Decorative Sri Lankan village scene (sun, hills, paddy terraces, coconut
/// palms and a house) painted in brand tones over the brown header.
/// Pure vector — no image assets, scales to any width.
class VillageScenePainter extends CustomPainter {
  const VillageScenePainter({this.opacity = 1, this.houseX = 0.60});
  final double opacity;

  /// Horizontal position of the house (0–1), so it can avoid centred text.
  final double houseX;

  Paint _fill(Color c, double a) => Paint()..color = c.withValues(alpha: a * opacity);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;

    // Sun with soft glow.
    final sun = Offset(w * 0.84, h * 0.26);
    canvas.drawCircle(sun, h * 0.30, _fill(Brand.gold, 0.08));
    canvas.drawCircle(sun, h * 0.20, _fill(Brand.gold, 0.12));
    canvas.drawCircle(sun, h * 0.11, _fill(Brand.gold, 0.55));

    // Far hills.
    final far = Path()
      ..moveTo(0, h * 0.70)
      ..quadraticBezierTo(w * 0.18, h * 0.48, w * 0.38, h * 0.62)
      ..quadraticBezierTo(w * 0.58, h * 0.42, w * 0.80, h * 0.58)
      ..quadraticBezierTo(w * 0.92, h * 0.50, w, h * 0.56)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();
    canvas.drawPath(far, _fill(Brand.gold, 0.16));

    // Near hills.
    final near = Path()
      ..moveTo(0, h * 0.84)
      ..quadraticBezierTo(w * 0.30, h * 0.66, w * 0.62, h * 0.80)
      ..quadraticBezierTo(w * 0.82, h * 0.88, w, h * 0.74)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();
    canvas.drawPath(near, _fill(Brand.brownDark, 0.45));

    // Paddy terrace lines on the near hill.
    final terrace = Paint()
      ..color = Brand.goldLight.withValues(alpha: 0.10 * opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    for (var i = 1; i <= 3; i++) {
      final y = h * (0.80 + i * 0.05);
      final p = Path()
        ..moveTo(0, y)
        ..quadraticBezierTo(w * 0.30, y - h * 0.10, w * 0.62, y)
        ..quadraticBezierTo(w * 0.82, y + h * 0.05, w, y - h * 0.08);
      canvas.drawPath(p, terrace);
    }

    // House.
    _house(canvas, Offset(w * houseX, h * 0.82), h * 0.11);

    // Coconut palms.
    _palm(canvas, Offset(w * 0.72, h * 0.86), h * 0.48, -0.10);
    _palm(canvas, Offset(w * 0.93, h * 0.80), h * 0.40, 0.12);
  }

  void _house(Canvas canvas, Offset base, double s) {
    final body = Rect.fromLTWH(base.dx - s * 0.7, base.dy - s, s * 1.4, s);
    final dark = _fill(Brand.brownDark, 0.75);
    canvas.drawRect(body, dark);
    final roof = Path()
      ..moveTo(base.dx - s * 0.95, base.dy - s)
      ..lineTo(base.dx, base.dy - s * 1.65)
      ..lineTo(base.dx + s * 0.95, base.dy - s)
      ..close();
    canvas.drawPath(roof, _fill(Brand.terracotta, 0.85));
    canvas.drawRect(
        Rect.fromLTWH(base.dx - s * 0.18, base.dy - s * 0.55, s * 0.36, s * 0.55),
        _fill(Brand.gold, 0.7));
  }

  void _palm(Canvas canvas, Offset base, double height, double lean) {
    final top = Offset(base.dx + height * lean, base.dy - height);
    final trunk = Paint()
      ..color = Brand.brownDark.withValues(alpha: 0.85 * opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = height * 0.045
      ..strokeCap = StrokeCap.round;
    final p = Path()
      ..moveTo(base.dx, base.dy)
      ..quadraticBezierTo(base.dx + height * lean * 0.2, base.dy - height * 0.6, top.dx, top.dy);
    canvas.drawPath(p, trunk);

    final frond = Paint()
      ..color = Brand.brownDark.withValues(alpha: 0.85 * opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = height * 0.035
      ..strokeCap = StrokeCap.round;
    for (var i = 0; i < 7; i++) {
      final a = -math.pi + i * (math.pi / 6);
      final len = height * (0.38 + (i.isEven ? 0.06 : 0));
      final end = top + Offset(math.cos(a) * len, math.sin(a) * len * 0.55 + len * 0.35);
      final ctrl = top + Offset(math.cos(a) * len * 0.5, math.sin(a) * len * 0.7 - len * 0.1);
      canvas.drawPath(
        Path()
          ..moveTo(top.dx, top.dy)
          ..quadraticBezierTo(ctrl.dx, ctrl.dy, end.dx, end.dy),
        frond,
      );
    }
    canvas.drawCircle(top + Offset(0, height * 0.03), height * 0.035, _fill(Brand.gold, 0.8));
  }

  @override
  bool shouldRepaint(covariant VillageScenePainter old) => old.opacity != opacity || old.houseX != houseX;
}

/// Brown gradient panel with the village scene and rounded bottom corners.
class BrandHeader extends StatelessWidget {
  const BrandHeader({super.key, required this.height, this.child, this.radius = 30, this.houseX = 0.60});
  final double height;
  final double houseX;
  final double radius;
  final Widget? child;

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(radius)),
        child: Container(
          height: height,
          width: double.infinity,
          decoration: const BoxDecoration(gradient: Brand.headerGradient),
          child: CustomPaint(
            painter: VillageScenePainter(houseX: houseX),
            child: child ?? const SizedBox.expand(),
          ),
        ),
      );
}

/// Round app mark: gold disc with a village-house glyph.
class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.size = 48});
  final double size;

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFE8C27A), Brand.gold],
          ),
          border: Border.all(color: Colors.white.withValues(alpha: 0.7), width: size * 0.04),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.25), blurRadius: size * 0.2, offset: Offset(0, size * 0.06)),
          ],
        ),
        child: Icon(Icons.holiday_village_rounded, color: Brand.brownDark, size: size * 0.56),
      );
}

/// Soft tinted circle behind an icon (stat tiles, menu rows).
class IconBadge extends StatelessWidget {
  const IconBadge(this.icon, this.color, {super.key, this.size = 44});
  final IconData icon;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: color.withValues(alpha: 0.13), shape: BoxShape.circle),
        child: Icon(icon, color: color, size: size * 0.52),
      );
}

/// Greeting for the time of day in the current language.
String timeGreeting(AppLocalizations t, DateTime d) => d.hour < 12
    ? t.greetingMorning
    : d.hour < 16
        ? t.greetingAfternoon
        : t.greetingEvening;
