import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';

import '../l10n/l10n.dart';

/// Secrets kept in the platform keystore (Android Keystore / iOS Keychain):
/// the database encryption key and the salted PIN hash.
class KeyStore {
  KeyStore._();
  static const _s = FlutterSecureStorage();
  static const _dbKey = 'db_key';
  static const _pinHash = 'pin_hash';
  static const _pinSalt = 'pin_salt';
  static const _bio = 'biometric_enabled';

  static String _randomHex(int bytes) {
    final r = Random.secure();
    return List.generate(bytes, (_) => r.nextInt(256).toRadixString(16).padLeft(2, '0')).join();
  }

  /// 256-bit random key, created on first launch.
  static Future<String> dbKey() async {
    var k = await _s.read(key: _dbKey);
    if (k == null) {
      k = _randomHex(32);
      await _s.write(key: _dbKey, value: k);
    }
    return k;
  }

  static String _hash(String pin, String salt) {
    List<int> h = utf8.encode('$salt:$pin');
    for (var i = 0; i < 20000; i++) {
      h = sha256.convert(h).bytes;
    }
    return base64.encode(h);
  }

  static Future<bool> hasPin() async => (await _s.read(key: _pinHash)) != null;

  static Future<void> setPin(String pin) async {
    final salt = _randomHex(16);
    await _s.write(key: _pinSalt, value: salt);
    await _s.write(key: _pinHash, value: _hash(pin, salt));
  }

  static Future<bool> checkPin(String pin) async {
    final salt = await _s.read(key: _pinSalt);
    final hash = await _s.read(key: _pinHash);
    if (salt == null || hash == null) return false;
    return _hash(pin, salt) == hash;
  }

  static Future<bool> biometricEnabled() async => (await _s.read(key: _bio)) == '1';
  static Future<void> setBiometric(bool on) => _s.write(key: _bio, value: on ? '1' : '0');

  static Future<bool> biometricAvailable() async {
    try {
      final auth = LocalAuthentication();
      return await auth.canCheckBiometrics && await auth.isDeviceSupported();
    } catch (_) {
      return false;
    }
  }

  static Future<bool> authenticateBiometric() async {
    try {
      return await LocalAuthentication().authenticate(
        localizedReason: L10n.current.biometricReason,
        biometricOnly: true,
      );
    } catch (_) {
      return false;
    }
  }
}
