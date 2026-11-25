import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'app_localizations.dart';

export 'app_localizations.dart';

/// The three languages the app is written in. Sinhala is the default.
enum AppLang {
  si('si', 'සිංහල'),
  en('en', 'English'),
  ta('ta', 'தமிழ்');

  const AppLang(this.code, this.nativeName);

  /// ISO 639-1 code; matches the ARB file suffix and the stored setting.
  final String code;

  /// Name of the language written in that language (for pickers).
  final String nativeName;

  Locale get locale => Locale(code);

  static AppLang? tryParse(String? code) {
    for (final l in values) {
      if (l.code == code) return l;
    }
    return null;
  }
}

/// App-wide current language. Changing [lang] rebuilds the [MaterialApp]
/// (see main.dart), so every screen re-reads its strings.
class L10n {
  L10n._();

  /// Settings key under which the chosen language code is stored.
  static const settingKey = 'locale';

  static final lang = ValueNotifier<AppLang>(AppLang.si);

  static final _cache = <AppLang, AppLocalizations>{};

  /// Strings for the current language. Use this only where there is no
  /// [BuildContext] (data layer, exports, error messages); widgets use
  /// `context.l10n`.
  static AppLocalizations get current => of(lang.value);

  static AppLocalizations of(AppLang l) => _cache[l] ??= lookupAppLocalizations(l.locale);

  /// Long, human date in the current language, e.g.
  /// "2026 නොවැම්බර් 25, බදාදා" / "Wednesday, 25 November 2026" /
  /// "புதன், 25 நவம்பர், 2026".
  static String longDate(DateTime d) {
    // Sri Lankan English writes day-month-year (British style).
    final tag = lang.value == AppLang.en ? 'en_GB' : lang.value.code;
    try {
      return DateFormat.yMMMMEEEEd(tag).format(d);
    } catch (_) {
      // Date symbols are loaded by GlobalMaterialLocalizations; fall back
      // to ISO if called before that (e.g. in plain unit tests).
      return DateFormat('yyyy-MM-dd').format(d);
    }
  }
}

extension L10nContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

/// Labels for stored codes that are not pick lists.
extension DomainLabels on AppLocalizations {
  /// Land record status: `draft` / `complete` / `verified`.
  String landStatus(String code) => switch (code) {
        'draft' => statusDraft,
        'complete' => statusComplete,
        'verified' => statusVerified,
        _ => code,
      };

  /// Residence events (`residence_events.type`).
  String residenceEvent(String type) => switch (type) {
        'arrived' => evArrived,
        'left' => evLeft,
        'birth' => evBirth,
        'death' => evDeath,
        'away' => evAway,
        'returned' => evReturned,
        _ => type,
      };
}
