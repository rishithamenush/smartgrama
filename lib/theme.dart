import 'package:flutter/material.dart';

/// SmartGrama colour system: the reference brown is the major colour; every
/// other colour is an earthy companion (sand, gold, terracotta, olive, slate)
/// so the whole app reads as one family.
class Brand {
  // Brown (major)
  static const brown = Color(0xFF3F2F19);
  static const brownDark = Color(0xFF2A1F10);
  static const brownMid = Color(0xFF5C4426);
  static const brownLight = Color(0xFF8A6A42);

  // Companions
  static const gold = Color(0xFFC9973F);
  static const goldLight = Color(0xFFF3E3C3);
  static const terracotta = Color(0xFFB5562F);
  static const olive = Color(0xFF5E7A2E);
  static const slate = Color(0xFF3F6577);
  static const clay = Color(0xFF9A6B4F);

  // Surfaces
  static const cream = Color(0xFFFBF7F0);
  static const sand = Color(0xFFF2E9DA);
  static const sandDark = Color(0xFFE6D8C1);
  static const line = Color(0xFFDCCCB3);
  static const muted = Color(0xFF8C7A62);

  // Meaning colours, tuned to sit with the browns.
  static const ok = Color(0xFF4F7A32);
  static const info = Color(0xFF3D6B8C);
  static const pending = Color(0xFFC7871A);
  static const warn = Color(0xFFB5562F);
  static const warnBg = Color(0xFFFBEBDD);

  static const headerGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [brownDark, brown, brownMid],
  );
}

const fontFamily = 'AbhayaLibre';

/// Abhaya Libre's glyphs sit a little small next to Material's metrics, so
/// all text is scaled by this on top of the user's text-size setting.
const fontBoost = 1.1;

ThemeData buildTheme() {
  const scheme = ColorScheme(
    brightness: Brightness.light,
    primary: Brand.brown,
    onPrimary: Colors.white,
    primaryContainer: Brand.sandDark,
    onPrimaryContainer: Brand.brownDark,
    secondary: Brand.gold,
    onSecondary: Colors.white,
    secondaryContainer: Brand.goldLight,
    onSecondaryContainer: Brand.brownDark,
    tertiary: Brand.olive,
    onTertiary: Colors.white,
    tertiaryContainer: Color(0xFFE4EAD3),
    onTertiaryContainer: Color(0xFF26330F),
    error: Color(0xFFB3261E),
    onError: Colors.white,
    surface: Brand.cream,
    onSurface: Color(0xFF241A0E),
    onSurfaceVariant: Color(0xFF5E5040),
    surfaceContainerLowest: Colors.white,
    surfaceContainerLow: Color(0xFFF8F2E8),
    surfaceContainer: Brand.sand,
    surfaceContainerHigh: Color(0xFFEDE2D0),
    surfaceContainerHighest: Brand.sandDark,
    outline: Brand.muted,
    outlineVariant: Brand.line,
    inverseSurface: Brand.brownDark,
    onInverseSurface: Brand.cream,
    inversePrimary: Brand.goldLight,
    shadow: Colors.black,
  );

  final radius = BorderRadius.circular(14);
  return ThemeData(
    colorScheme: scheme,
    useMaterial3: true,
    fontFamily: fontFamily,
    scaffoldBackgroundColor: Brand.cream,
    dividerTheme: const DividerThemeData(color: Brand.line, space: 1),
    appBarTheme: const AppBarTheme(
      backgroundColor: Brand.brown,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(fontFamily: fontFamily, fontSize: 21, fontWeight: FontWeight.w700, color: Colors.white),
    ),
    cardTheme: CardThemeData(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Brand.line),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: radius),
      enabledBorder: OutlineInputBorder(
        borderRadius: radius,
        borderSide: const BorderSide(color: Brand.line),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: radius,
        borderSide: const BorderSide(color: Brand.brown, width: 2),
      ),
      labelStyle: const TextStyle(color: Brand.muted),
      floatingLabelStyle: const TextStyle(color: Brand.brown),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(64, 50),
        shape: RoundedRectangleBorder(borderRadius: radius),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(64, 48),
        foregroundColor: Brand.brown,
        side: const BorderSide(color: Brand.brownLight),
        shape: RoundedRectangleBorder(borderRadius: radius),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Brand.brownMid),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Brand.brown,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: Colors.white,
      selectedColor: Brand.goldLight,
      side: const BorderSide(color: Brand.line),
      checkmarkColor: Brand.brown,
      labelStyle: const TextStyle(color: Brand.brownDark),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith(
            (s) => s.contains(WidgetState.selected) ? Brand.goldLight : Colors.white),
        foregroundColor: const WidgetStatePropertyAll(Brand.brownDark),
        side: const WidgetStatePropertyAll(BorderSide(color: Brand.line)),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      indicatorColor: Brand.goldLight,
      elevation: 3,
      shadowColor: Colors.black26,
      iconTheme: WidgetStateProperty.resolveWith((s) => IconThemeData(
            color: s.contains(WidgetState.selected) ? Brand.brown : Brand.muted,
          )),
      labelTextStyle: WidgetStateProperty.resolveWith((s) => TextStyle(
            fontSize: 12,
            fontWeight: s.contains(WidgetState.selected) ? FontWeight.w700 : FontWeight.w500,
            color: s.contains(WidgetState.selected) ? Brand.brown : Brand.muted,
          )),
    ),
    tabBarTheme: const TabBarThemeData(
      labelColor: Colors.white,
      unselectedLabelColor: Color(0xCCFFFFFF),
      indicatorColor: Brand.gold,
      dividerColor: Colors.transparent,
    ),
    listTileTheme: const ListTileThemeData(iconColor: Brand.brownMid),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Brand.brown,
      linearTrackColor: Brand.sand,
      circularTrackColor: Brand.sand,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? Colors.white : Brand.muted),
      trackColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? Brand.brown : Brand.sand),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? Brand.brown : null),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Brand.brownDark,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: radius),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: Brand.cream,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Brand.cream,
      showDragHandle: true,
    ),
  );
}
