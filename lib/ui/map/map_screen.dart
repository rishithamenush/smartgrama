import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../app_state.dart';
import '../../data/bundle.dart';
import '../../data/database.dart';
import '../../data/device.dart';
import '../../data/picklists.dart';
import '../land/land_card.dart';
import '../land/land_sections.dart';
import '../widgets/common.dart';
import '../../theme.dart';

enum _Layer { lands, houses, poorHouses, trees }

const _layerLabels = {
  _Layer.lands: 'ඉඩම්',
  _Layer.houses: 'නිවාස',
  _Layer.poorHouses: 'අබලන් නිවාස',
  _Layer.trees: 'වටිනා ගස්',
};

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _map = MapController();
  final _layers = {_Layer.lands};
  LatLng? _me;
  bool _centered = false;

  Future<void> _locate() async {
    try {
      final fix = await captureGps();
      setState(() => _me = LatLng(fix.lat, fix.lng));
      _map.move(_me!, 17);
    } on DeviceError catch (e) {
      if (mounted) snack(context, e.message);
    }
  }

  void _showLand(Snapshot s, Land l) {
    final b = s.bundle(l.id);
    showModalBottomSheet(
      context: context,
      builder: (c) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(l.name, style: Theme.of(c).textTheme.titleLarge),
              subtitle: Text([
                s.groupById[l.houseGroupId]?.code ?? '',
                if (b.ownerNames.isNotEmpty) b.ownerNames.join(', '),
              ].join(' • ')),
              trailing: StatusBadge(l.status),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                  'ගොඩනැගිලි ${b.buildings.length} • පුද්ගලයින් ${b.persons.length} • ගස් ${b.treeTotal} • සතුන් ${b.animalTotal}'),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: FilledButton.icon(
                onPressed: () {
                  Navigator.pop(c);
                  push(context, LandCard(landId: l.id));
                },
                icon: const Icon(Icons.open_in_new),
                label: const Text('ඉඩම විවෘත කරන්න'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Marker _pin(LatLng at, Color color, IconData icon, VoidCallback onTap, {double size = 36}) => Marker(
        point: at,
        width: size,
        height: size,
        alignment: Alignment.topCenter,
        child: GestureDetector(onTap: onTap, child: Icon(icon, color: color, size: size)),
      );

  @override
  Widget build(BuildContext context) {
    final db = AppState.db;
    return Scaffold(
      appBar: AppBar(title: const Text('සිතියම')),
      body: StreamBuilder<Snapshot>(
        stream: db.watchSnapshot(),
        builder: (context, snap) {
          final s = snap.data;
          if (s == null) return const Center(child: CircularProgressIndicator());
          final located = s.lands.where((l) => l.lat != null).toList();
          LatLng center = const LatLng(7.8731, 80.7718);
          double zoom = 7.5;
          if (located.isNotEmpty) {
            center = LatLng(
              located.map((l) => l.lat!).reduce((a, b) => a + b) / located.length,
              located.map((l) => l.lng!).reduce((a, b) => a + b) / located.length,
            );
            zoom = 15;
          }
          final markers = <Marker>[];
          if (_layers.contains(_Layer.lands)) {
            for (final l in located) {
              markers.add(_pin(LatLng(l.lat!, l.lng!), statusColor(l.status), Icons.location_on,
                  () => _showLand(s, l)));
            }
          }
          for (final b in s.buildings.where((b) => b.type == 'house' && b.lat != null)) {
            final poor = b.condition == 'poor' || b.condition == 'unusable';
            if (_layers.contains(_Layer.houses) || (poor && _layers.contains(_Layer.poorHouses))) {
              final land = s.landById[b.landId];
              markers.add(_pin(LatLng(b.lat!, b.lng!), poor ? Brand.terracotta : Brand.info, Icons.home,
                  land == null ? () {} : () => _showLand(s, land), size: 28));
            }
          }
          if (_layers.contains(_Layer.trees)) {
            for (final t in s.trees.where((t) => t.lat != null)) {
              final land = s.landById[t.landId];
              markers.add(Marker(
                point: LatLng(t.lat!, t.lng!),
                width: 90,
                height: 40,
                child: GestureDetector(
                  onTap: land == null ? null : () => _showLand(s, land),
                  child: Column(children: [
                    Icon(Icons.forest, color: t.isHazard ? Brand.terracotta : Brand.olive, size: 22),
                    Text(pl(PL.treeSingleSpecies, t.species),
                        style: const TextStyle(fontSize: 10, backgroundColor: Colors.white70)),
                  ]),
                ),
              ));
            }
          }
          if (!_centered && located.isNotEmpty) {
            _centered = true;
          }
          return Stack(
            children: [
              FlutterMap(
                mapController: _map,
                options: MapOptions(initialCenter: center, initialZoom: zoom, maxZoom: 19),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'lk.smartgrama.app',
                  ),
                  MarkerLayer(markers: markers),
                  if (_me != null)
                    MarkerLayer(markers: [
                      Marker(
                        point: _me!,
                        width: 24,
                        height: 24,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Brand.info,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),
                          ),
                        ),
                      ),
                    ]),
                  const RichAttributionWidget(
                    attributions: [TextSourceAttribution('© OpenStreetMap contributors')],
                  ),
                ],
              ),
              Positioned(
                top: 8,
                left: 8,
                right: 8,
                child: Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    for (final layer in _Layer.values)
                      FilterChip(
                        label: Text(_layerLabels[layer]!),
                        selected: _layers.contains(layer),
                        onSelected: (on) =>
                            setState(() => on ? _layers.add(layer) : _layers.remove(layer)),
                      ),
                  ],
                ),
              ),
              if (located.isEmpty)
                const Positioned(
                  bottom: 80,
                  left: 16,
                  right: 16,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text('GPS සහිත ඉඩම් තවම නැත. ඉඩමක් ඇතුළත් කිරීමේදී "GPS ගන්න" ඔබන්න.'),
                    ),
                  ),
                ),
              Positioned(
                right: 16,
                bottom: 56,
                child: FloatingActionButton(
                  heroTag: 'locate',
                  onPressed: _locate,
                  child: const Icon(Icons.my_location),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
