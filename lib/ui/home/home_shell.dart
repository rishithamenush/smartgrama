import 'package:flutter/material.dart';

import '../map/map_screen.dart';
import '../reports/reports_screen.dart';
import '../search/search_screen.dart';
import 'dashboard.dart';
import 'land_list_screen.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
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
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'මුල් පිටුව'),
          NavigationDestination(icon: Icon(Icons.landscape_outlined), selectedIcon: Icon(Icons.landscape), label: 'ඉඩම්'),
          NavigationDestination(icon: Icon(Icons.search), label: 'සෙවීම'),
          NavigationDestination(icon: Icon(Icons.map_outlined), selectedIcon: Icon(Icons.map), label: 'සිතියම'),
          NavigationDestination(icon: Icon(Icons.bar_chart_outlined), selectedIcon: Icon(Icons.bar_chart), label: 'වාර්තා'),
        ],
      ),
    );
  }
}
