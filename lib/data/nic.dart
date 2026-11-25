/// Sri Lankan National Identity Card (NIC) number parsing.
///
/// Old format: `YYDDDNNNNV` (9 digits + V or X), year = 19YY.
/// New format: `YYYYDDDNNNNN` (12 digits).
/// `DDD` is the day of the year; 500 is added for women. The NIC calendar
/// always gives February 29 days, so day 60 is "Feb 29" even in non-leap
/// years (day 61 is always March 1).
library;

import '../l10n/l10n.dart';

class NicInfo {
  const NicInfo({required this.dob, required this.gender, required this.normalized});
  final DateTime dob;

  /// `m` or `f` (matches the `gender` pick list codes).
  final String gender;

  /// Upper-cased number without spaces.
  final String normalized;
}

/// Why a NIC number was rejected (localized by [NicResult.error]).
enum NicError { empty, format, day, feb29, future, year }

class NicResult {
  const NicResult.ok(this.info) : errorCode = null;
  const NicResult.error(NicError this.errorCode) : info = null;
  final NicInfo? info;
  final NicError? errorCode;
  bool get isValid => info != null;

  /// Reason in the current language, or null when valid.
  String? get error {
    final t = L10n.current;
    return switch (errorCode) {
      null => null,
      NicError.empty => t.nicEmpty,
      NicError.format => t.nicBadFormat,
      NicError.day => t.nicBadDay,
      NicError.feb29 => t.nicFeb29,
      NicError.future => t.nicFuture,
      NicError.year => t.nicBadYear,
    };
  }
}

const _nicMonthDays = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

String normalizeNic(String raw) => raw.replaceAll(RegExp(r'\s'), '').toUpperCase();

NicResult parseNic(String raw, {DateTime? now}) {
  final nic = normalizeNic(raw);
  if (nic.isEmpty) return const NicResult.error(NicError.empty);

  int year;
  int days;
  if (RegExp(r'^\d{9}[VX]$').hasMatch(nic)) {
    year = 1900 + int.parse(nic.substring(0, 2));
    days = int.parse(nic.substring(2, 5));
  } else if (RegExp(r'^\d{12}$').hasMatch(nic)) {
    year = int.parse(nic.substring(0, 4));
    days = int.parse(nic.substring(4, 7));
  } else {
    return const NicResult.error(NicError.format);
  }

  var gender = 'm';
  if (days > 500) {
    gender = 'f';
    days -= 500;
  }
  if (days < 1 || days > 366) {
    return const NicResult.error(NicError.day);
  }

  var month = 0;
  var remaining = days;
  while (remaining > _nicMonthDays[month]) {
    remaining -= _nicMonthDays[month];
    month++;
  }
  final isLeap = (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
  if (month == 1 && remaining == 29 && !isLeap) {
    return const NicResult.error(NicError.feb29);
  }
  final dob = DateTime(year, month + 1, remaining);

  final today = now ?? DateTime.now();
  if (dob.isAfter(today)) {
    return const NicResult.error(NicError.future);
  }
  if (year < 1900) {
    return const NicResult.error(NicError.year);
  }
  return NicResult.ok(NicInfo(dob: dob, gender: gender, normalized: nic));
}

/// `78•••••50V` style masking for lists.
String maskNic(String? nic) {
  if (nic == null || nic.length < 6) return nic ?? '';
  return '${nic.substring(0, 2)}${'•' * (nic.length - 5)}${nic.substring(nic.length - 3)}';
}

int ageOn(DateTime dob, DateTime on) {
  var age = on.year - dob.year;
  if (on.month < dob.month || (on.month == dob.month && on.day < dob.day)) age--;
  return age;
}
