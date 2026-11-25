import 'package:flutter/material.dart';

import '../map/map_screen.dart';
import '../reports/reports_screen.dart';
import '../search/search_screen.dart';
import 'dashboard.dart';
import 'land_list_screen.dart';
import '../../l10n/l10n.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final t = context.l10n;
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: [
          Dashboard(onOpenTab: (i) => setState(() => _index = i)),
          const LandListScreen(),
          const SearchScreen(),
          // Map is built lazily so tiles load only when opened.
          _index == 3 ? const MapScreen() : const SizedBox.shrink(),
          const ReportsScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: [
          NavigationDestination(
              icon: const Icon(Icons.home_outlined), selectedIcon: const Icon(Icons.home), label: t.navHome),
          NavigationDestination(
              icon: const Icon(Icons.landscape_outlined), selectedIcon: const Icon(Icons.landscape), label: t.lands),
          NavigationDestination(icon: const Icon(Icons.search), label: t.navSearch),
          NavigationDestination(
              icon: const Icon(Icons.map_outlined), selectedIcon: const Icon(Icons.map), label: t.navMap),
          NavigationDestination(
              icon: const Icon(Icons.bar_chart_outlined), selectedIcon: const Icon(Icons.bar_chart), label: t.navReports),
        ],
      ),
    );
  }
}
