import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme.dart';
import '../ui/setup/language_screen.dart';
import '../ui/widgets/art.dart';

import 'key_store.dart';
import '../l10n/l10n.dart';

/// PIN entry used both for first-time setup (enter twice) and unlocking.
class PinScreen extends StatefulWidget {
  const PinScreen.setup({super.key, required this.onDone})
      : isSetup = true,
        allowBiometric = false;
  const PinScreen.unlock({super.key, required this.onDone, this.allowBiometric = true})
      : isSetup = false;

  final bool isSetup;
  final bool allowBiometric;
  final VoidCallback onDone;

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  static const _len = 6;
  String _pin = '';
  String? _first;
  String? _error;
  int _failures = 0;
  DateTime? _blockedUntil;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    if (!widget.isSetup && widget.allowBiometric) _tryBiometric();
  }

  Future<void> _tryBiometric() async {
    if (!await KeyStore.biometricEnabled()) return;
    if (await KeyStore.authenticateBiometric()) widget.onDone();
  }

  String _title(AppLocalizations t) {
    if (!widget.isSetup) return t.pinEnter;
    return _first == null ? t.pinCreate : t.pinConfirm;
  }

  Future<void> _complete() async {
    if (widget.isSetup) {
      if (_first == null) {
        setState(() {
          _first = _pin;
          _pin = '';
          _error = null;
        });
        return;
      }
      if (_first != _pin) {
        setState(() {
          _first = null;
          _pin = '';
          _error = context.l10n.pinMismatch;
        });
        return;
      }
      setState(() => _busy = true);
      await KeyStore.setPin(_pin);
      widget.onDone();
      return;
    }

    setState(() => _busy = true);
    final ok = await KeyStore.checkPin(_pin);
    if (!mounted) return;
    if (ok) {
      widget.onDone();
      return;
    }
    _failures++;
    setState(() {
      _busy = false;
      _pin = '';
      if (_failures >= 5) {
        _blockedUntil = DateTime.now().add(const Duration(seconds: 30));
        _error = context.l10n.pinLockedOut;
        Timer(const Duration(seconds: 30), () {
          if (mounted) setState(() => _error = null);
        });
        _failures = 0;
      } else {
        _error = context.l10n.pinWrong;
      }
    });
  }

  void _press(String d) {
    if (_busy) return;
    if (_blockedUntil != null && DateTime.now().isBefore(_blockedUntil!)) return;
    if (_pin.length >= _len) return;
    setState(() {
      _pin += d;
      _error = null;
    });
    if (_pin.length == _len) _complete();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final t = context.l10n;
    final top = MediaQuery.of(context).padding.top;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            BrandHeader(
              height: top + 230,
              radius: 36,
              houseX: 0.14,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: top + 28),
                    child: Center(
                      child: Column(
                        children: [
                          const AppLogo(size: 76),
                          const SizedBox(height: 12),
                          const Text('SmartGrama',
                              style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800)),
                          Text(t.appTagline, style: const TextStyle(color: Brand.goldLight, fontSize: 13)),
                        ],
                      ),
                    ),
                  ),
                  // Language switch, so whoever unlocks can read the screens.
                  Positioned(
                    top: top + 4,
                    right: 8,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(foregroundColor: Colors.white),
                      onPressed: () => showLanguageSheet(context),
                      icon: const Icon(Icons.translate_rounded, size: 18),
                      label: Text(L10n.lang.value.nativeName,
                          style: TextStyle(fontFamily: fontFamilyFor(L10n.lang.value))),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            Text(_title(t),
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Brand.brownDark)),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < _len; i++)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    margin: const EdgeInsets.all(8),
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: i < _pin.length ? Brand.brown : Colors.white,
                      border: Border.all(color: i < _pin.length ? Brand.brown : Brand.brownLight, width: 2),
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 30,
              child: _error == null
                  ? null
                  : Text(_error!, style: TextStyle(color: cs.error)),
            ),
            const Spacer(),
            for (final row in const [
              ['1', '2', '3'],
              ['4', '5', '6'],
              ['7', '8', '9'],
            ])
              _row(row.map((d) => _key(d, () => _press(d))).toList()),
            _row([
              widget.isSetup || !widget.allowBiometric
                  ? const SizedBox(width: 88, height: 72)
                  : _icon(Icons.fingerprint, _tryBiometric),
              _key('0', () => _press('0')),
              _icon(Icons.backspace_outlined, () {
                if (_pin.isNotEmpty) setState(() => _pin = _pin.substring(0, _pin.length - 1));
              }),
            ]),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
          ],
        ),
      ),
    );
  }

  Widget _row(List<Widget> children) =>
      Row(mainAxisAlignment: MainAxisAlignment.center, children: children);

  Widget _key(String label, VoidCallback onTap) => Padding(
        padding: const EdgeInsets.all(6),
        child: SizedBox(
          width: 76,
          height: 60,
          child: OutlinedButton(
            onPressed: onTap,
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Brand.brownDark,
              side: const BorderSide(color: Brand.line),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            child: Text(label, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500)),
          ),
        ),
      );

  Widget _icon(IconData icon, VoidCallback onTap) => Padding(
        padding: const EdgeInsets.all(6),
        child: SizedBox(
          width: 76,
          height: 60,
          child: IconButton(onPressed: onTap, icon: Icon(icon, size: 28, color: Brand.brownMid)),
        ),
      );
}
