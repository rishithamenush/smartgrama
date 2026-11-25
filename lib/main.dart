import 'package:flutter/material.dart';

import 'app_state.dart';
import 'data/bundle.dart';
import 'data/database.dart';
import 'l10n/l10n.dart';
import 'security/key_store.dart';
import 'security/pin_screen.dart';
import 'theme.dart';
import 'ui/home/home_shell.dart';
import 'ui/setup/language_screen.dart';
import 'ui/setup/setup_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SmartGramaApp());
}

class SmartGramaApp extends StatelessWidget {
  const SmartGramaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([AppState.fontScale, L10n.lang]),
      builder: (context, _) {
        final lang = L10n.lang.value;
        return MaterialApp(
          title: 'SmartGrama',
          debugShowCheckedModeBanner: false,
          theme: buildTheme(lang),
          locale: lang.locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          // Tapping outside a field closes the keyboard (the iOS number pad
          // has no "Done" key and would otherwise cover the save button).
          builder: (context, child) => GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                  textScaler: TextScaler.linear(AppState.fontScale.value * fontBoostFor(lang))),
              child: child!,
            ),
          ),
          home: const BootGate(),
        );
      },
    );
  }
}

enum _Stage { loading, error, language, setPin, locked, setup, ready }

/// Start-up state machine: open DB → (first run) language → PIN setup /
/// unlock → division setup →
/// home. Re-locks after [AppState.autoLockMinutes] in the background.
class BootGate extends StatefulWidget {
  const BootGate({super.key});

  @override
  State<BootGate> createState() => _BootGateState();
}

class _BootGateState extends State<BootGate> with WidgetsBindingObserver {
  _Stage _stage = _Stage.loading;
  Object? _error;
  DateTime? _pausedAt;
  Division? _division;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _boot();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused || state == AppLifecycleState.hidden) {
      _pausedAt ??= DateTime.now();
    } else if (state == AppLifecycleState.resumed) {
      final since = _pausedAt;
      _pausedAt = null;
      if (since != null &&
          _stage == _Stage.ready &&
          DateTime.now().difference(since).inMinutes >= AppState.autoLockMinutes) {
        Navigator.of(context).popUntil((r) => r.isFirst);
        setState(() => _stage = _Stage.locked);
      }
    }
  }

  Future<void> _boot() async {
    try {
      await AppState.init();
      _division = await AppState.db.loadDivision();
      final hasPin = await KeyStore.hasPin();
      // Installs from before the language setting existed were Sinhala.
      if (hasPin && !AppState.languageChosen) L10n.lang.value = AppLang.si;
      setState(() => _stage = hasPin
          ? _Stage.locked
          : AppState.languageChosen
              ? _Stage.setPin
              : _Stage.language);
    } catch (e) {
      setState(() {
        _error = e;
        _stage = _Stage.error;
      });
    }
  }

  void _unlocked() =>
      setState(() => _stage = _division == null ? _Stage.setup : _Stage.ready);

  @override
  Widget build(BuildContext context) {
    switch (_stage) {
      case _Stage.loading:
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      case _Stage.error:
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(context.l10n.dbOpenError('$_error'), textAlign: TextAlign.center),
            ),
          ),
        );
      case _Stage.language:
        return LanguageScreen(onDone: () => setState(() => _stage = _Stage.setPin));
      case _Stage.setPin:
        return PinScreen.setup(onDone: _unlocked);
      case _Stage.locked:
        return PinScreen.unlock(onDone: _unlocked);
      case _Stage.setup:
        return SetupScreen(onDone: (d) {
          _division = d;
          setState(() => _stage = _Stage.ready);
        });
      case _Stage.ready:
        return const HomeShell();
    }
  }
}
