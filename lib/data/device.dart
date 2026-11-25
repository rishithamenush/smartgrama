import 'dart:io';

import 'package:drift/drift.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import '../app_state.dart';
import '../l10n/l10n.dart';
import 'database.dart';

class GpsFix {
  const GpsFix(this.lat, this.lng, this.accuracy);
  final double lat, lng, accuracy;
}

class DeviceError implements Exception {
  DeviceError(this.message);
  final String message;
  @override
  String toString() => message;
}

Future<void> _ensureLocationPermission() async {
  if (!await Geolocator.isLocationServiceEnabled()) {
    throw DeviceError(L10n.current.gpsServiceOff);
  }
  var perm = await Geolocator.checkPermission();
  if (perm == LocationPermission.denied) perm = await Geolocator.requestPermission();
  if (perm == LocationPermission.denied || perm == LocationPermission.deniedForever) {
    throw DeviceError(L10n.current.gpsDenied);
  }
}

/// One accurate GPS reading (only when the officer presses the button —
/// no background tracking).
Future<GpsFix> captureGps() async {
  await _ensureLocationPermission();
  try {
    final p = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.best,
        timeLimit: Duration(seconds: 30),
      ),
    );
    return GpsFix(p.latitude, p.longitude, p.accuracy);
  } catch (_) {
    throw DeviceError(L10n.current.gpsFailed);
  }
}

/// Best-effort location for tagging photos; never blocks or throws.
Future<GpsFix?> quickGps() async {
  try {
    final last = await Geolocator.getLastKnownPosition();
    if (last == null) return null;
    return GpsFix(last.latitude, last.longitude, last.accuracy);
  } catch (_) {
    return null;
  }
}

/// Takes/picks a photo, stores a compressed copy in the app-private photos
/// folder and records it. Returns null if the officer cancelled.
Future<Photo?> addPhoto({
  required String ownerType,
  required String ownerId,
  required String landId,
  required bool fromCamera,
}) async {
  final picked = await ImagePicker().pickImage(
    source: fromCamera ? ImageSource.camera : ImageSource.gallery,
    maxWidth: 1600,
    maxHeight: 1600,
    imageQuality: 70,
  );
  if (picked == null) return null;
  final id = newId();
  final fileName = '$id.jpg';
  await File(picked.path).copy(AppState.photoFile(fileName).path);
  final gps = await quickGps();
  final db = AppState.db;
  await db.saveRow(
    db.photos,
    id,
    PhotosCompanion.insert(
      id: id,
      ownerType: ownerType,
      ownerId: ownerId,
      landId: Value(landId),
      fileName: fileName,
      takenAt: DateTime.now(),
      lat: Value(gps?.lat),
      lng: Value(gps?.lng),
    ),
    landId: landId,
  );
  return db.byId(db.photos, id);
}
