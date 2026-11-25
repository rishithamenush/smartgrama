import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme.dart';
import 'art.dart';

/// Page shell used by every screen: brown gradient header with a faint
/// village scene, title + subtitle, optional actions and an optional widget
/// under the title (search box, filters, tabs), then the body.
class BrandPage extends StatelessWidget {
  const BrandPage({
    super.key,
    required this.title,
    required this.body,
    this.subtitle,
    this.icon,
    this.actions = const [],
    this.headerChild,
    this.floatingActionButton,
    this.bottomBar,
    this.showBack,
  });

  final String title;
  final String? subtitle;
  final IconData? icon;
  final List<Widget> actions;
  final Widget? headerChild;
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? bottomBar;

  /// Defaults to "can this route pop".
  final bool? showBack;

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    final back = showBack ?? Navigator.of(context).canPop();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomBar,
        body: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(26)),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(gradient: Brand.headerGradient),
                child: CustomPaint(
                  painter: const VillageScenePainter(opacity: 0.45, houseX: 0.80),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(back ? 6 : 18, top + 6, 8, headerChild == null ? 18 : 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            if (back)
                              IconButton(
                                icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
                                onPressed: () => Navigator.of(context).maybePop(),
                              )
                            else if (icon != null) ...[
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Brand.gold.withValues(alpha: 0.9),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(icon, color: Brand.brownDark, size: 22),
                              ),
                              const SizedBox(width: 12),
                            ],
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800, height: 1.15)),
                                  if (subtitle != null && subtitle!.isNotEmpty)
                                    Text(subtitle!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(color: Brand.goldLight, fontSize: 14)),
                                ],
                              ),
                            ),
                            ...actions,
                          ],
                        ),
                        if (headerChild != null) ...[
                          const SizedBox(height: 12),
                          Padding(
                            padding: EdgeInsets.only(left: back ? 12 : 0, right: 10),
                            child: headerChild!,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(child: body),
          ],
        ),
      ),
    );
  }
}

/// White icon button for header actions.
class HeaderAction extends StatelessWidget {
  const HeaderAction(this.icon, this.onTap, {super.key, this.tooltip});
  final IconData icon;
  final VoidCallback onTap;
  final String? tooltip;

  @override
  Widget build(BuildContext context) => IconButton(
        tooltip: tooltip,
        onPressed: onTap,
        icon: Icon(icon, color: Colors.white),
      );
}

/// Translucent chip row used inside headers (filters).
class HeaderChips extends StatelessWidget {
  const HeaderChips({super.key, required this.items});
  final List<(String label, bool selected, VoidCallback onTap)> items;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 36,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          children: [
            for (final (label, selected, onTap) in items)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Material(
                  color: selected ? Brand.gold : Colors.white.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(18),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: onTap,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                      child: Text(label,
                          style: TextStyle(
                            color: selected ? Brand.brownDark : Colors.white,
                            fontWeight: selected ? FontWeight.w800 : FontWeight.w500,
                            fontSize: 14,
                          )),
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
}

/// White rounded card with an icon + title header.
class SectionCard extends StatelessWidget {
  const SectionCard({
    super.key,
    required this.title,
    required this.children,
    this.icon,
    this.color = Brand.brown,
    this.trailing,
    this.margin = const EdgeInsets.fromLTRB(16, 12, 16, 0),
    this.padding = const EdgeInsets.fromLTRB(14, 12, 14, 12),
  });

  final String title;
  final IconData? icon;
  final Color color;
  final Widget? trailing;
  final List<Widget> children;
  final EdgeInsets margin;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) => Container(
        margin: margin,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Brand.line),
          boxShadow: [BoxShadow(color: Brand.brownDark.withValues(alpha: 0.04), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(children: [
                if (icon != null) ...[IconBadge(icon!, color, size: 34), const SizedBox(width: 10)],
                Expanded(
                  child: Text(title,
                      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Brand.brownDark)),
                ),
                ?trailing,
              ]),
              const SizedBox(height: 8),
              ...children,
            ],
          ),
        ),
      );
}

/// Tappable white row card with an icon badge (lists everywhere).
class ListCard extends StatelessWidget {
  const ListCard({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.color = Brand.brownMid,
    this.leading,
    this.trailing,
    this.onTap,
    this.margin = const EdgeInsets.fromLTRB(16, 0, 16, 10),
  });

  final String title;
  final String? subtitle;
  final IconData? icon;
  final Color color;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin,
        child: Material(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: const BorderSide(color: Brand.line),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 10, 12),
              child: Row(
                children: [
                  leading ?? (icon == null ? const SizedBox.shrink() : IconBadge(icon!, color)),
                  if (leading != null || icon != null) const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Brand.brownDark)),
                        if (subtitle != null && subtitle!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(subtitle!, style: const TextStyle(fontSize: 13, color: Brand.muted)),
                          ),
                      ],
                    ),
                  ),
                  trailing ?? (onTap == null ? const SizedBox.shrink() : const Icon(Icons.chevron_right_rounded, color: Brand.muted)),
                ],
              ),
            ),
          ),
        ),
      );
}

/// Small coloured count / label pill.
class Pill extends StatelessWidget {
  const Pill(this.text, {super.key, this.color = Brand.brownMid, this.icon});
  final String text;
  final Color color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
        decoration: BoxDecoration(color: color.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(12)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          if (icon != null) ...[Icon(icon, size: 14, color: color), const SizedBox(width: 4)],
          Text(text, style: TextStyle(fontSize: 13, color: color, fontWeight: FontWeight.w700)),
        ]),
      );
}

/// Big round number + label used in summary rows.
class MiniStat extends StatelessWidget {
  const MiniStat(this.icon, this.value, this.label, this.color, {super.key});
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          IconBadge(icon, color, size: 40),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Brand.brownDark)),
          Text(label, style: const TextStyle(fontSize: 12, color: Brand.muted)),
        ],
      );
}

/// Drop-in replacement for [AppBar] on form / detail screens: brand
/// gradient, faint village scene and rounded bottom corners.
class BrandAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BrandAppBar({super.key, this.title, this.actions, this.bottom});
  final Widget? title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize => Size.fromHeight(68 + (bottom?.preferredSize.height ?? 0));

  @override
  Widget build(BuildContext context) => AppBar(
        title: title,
        actions: actions,
        bottom: bottom,
        toolbarHeight: 68,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        flexibleSpace: ClipRRect(
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
          child: Container(
            decoration: const BoxDecoration(gradient: Brand.headerGradient),
            child: const CustomPaint(
              painter: VillageScenePainter(opacity: 0.4, houseX: 0.80),
              child: SizedBox.expand(),
            ),
          ),
        ),
      );
}
