import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app_state.dart';
import '../../l10n/l10n.dart';
import '../../theme.dart';
import '../widgets/art.dart';

/// First-run language choice (before the PIN is created). Tapping a
/// language switches the whole app at once, so the officer sees the result
/// before continuing.
class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key, required this.onDone});
  final VoidCallback onDone;

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: ValueListenableBuilder<AppLang>(
          valueListenable: L10n.lang,
          builder: (context, current, _) => Column(
            children: [
              BrandHeader(
                height: top + 230,
                radius: 36,
                houseX: 0.14,
                child: Padding(
                  padding: EdgeInsets.only(top: top + 28),
                  child: Column(
                    children: [
                      const AppLogo(size: 76),
                      const SizedBox(height: 12),
                      const Text('SmartGrama',
                          style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800)),
                      Text(context.l10n.appTagline,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Brand.goldLight, fontSize: 13)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(20, 22, 20, 16),
                  children: [
                    // The prompt in all three languages, so anyone can read it.
                    for (final l in AppLang.values)
                      Text(
                        L10n.of(l).languageChoose,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: l == current ? 17 : 14,
                          fontWeight: l == current ? FontWeight.w700 : FontWeight.w500,
                          color: l == current ? Brand.brownDark : Brand.muted,
                        ),
                      ),
                    const SizedBox(height: 18),
                    for (final l in AppLang.values)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: LanguageTile(
                          lang: l,
                          selected: l == current,
                          onTap: () => L10n.lang.value = l,
                        ),
                      ),
                    const SizedBox(height: 4),
                    Text(context.l10n.languageChangeLater,
                        textAlign: TextAlign.center, style: const TextStyle(color: Brand.muted, fontSize: 13)),
                  ],
                ),
              ),
              SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () async {
                        await AppState.setLanguage(current);
                        onDone();
                      },
                      icon: const Icon(Icons.arrow_forward_rounded),
                      label: Text(context.l10n.continueAction),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// One large, tappable language option showing its own native name.
class LanguageTile extends StatelessWidget {
  const LanguageTile({super.key, required this.lang, required this.selected, required this.onTap});
  final AppLang lang;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Material(
        color: selected ? Brand.goldLight : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(color: selected ? Brand.gold : Brand.line, width: selected ? 2 : 1),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    lang.nativeName,
                    // Each name is drawn in a font that has its script.
                    style: TextStyle(
                      fontFamily: fontFamilyFor(lang),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Brand.brownDark,
                    ),
                  ),
                ),
                Icon(
                  selected ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded,
                  color: selected ? Brand.brown : Brand.muted,
                ),
              ],
            ),
          ),
        ),
      );
}

/// Bottom sheet to switch language from anywhere (lock screen, settings).
Future<void> showLanguageSheet(BuildContext context) => showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      builder: (c) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(c.l10n.language, style: Theme.of(c).textTheme.titleLarge),
            const SizedBox(height: 12),
            for (final l in AppLang.values)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: LanguageTile(
                  lang: l,
                  selected: l == L10n.lang.value,
                  onTap: () async {
                    Navigator.pop(c);
                    await AppState.setLanguage(l);
                  },
                ),
              ),
          ],
        ),
      ),
    );
