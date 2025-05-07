import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

final locationProvider = FutureProvider.autoDispose<Position?>((ref) async {
  return await Geolocator.getCurrentPosition(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.low,
      timeLimit: Duration(seconds: 10),
    ),
  );
});

final permissionProvider = FutureProvider.autoDispose<void>((ref) async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw Exception(
        'Location services are not enabled. Please check your settings for location.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception(
          'Location services have been disabled. You must enable for Weather or Not to check the weather conditions');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'You must enable the permission for location in the settings of your device. Without it, it is not possible to retrieve your location.');
  }
});
