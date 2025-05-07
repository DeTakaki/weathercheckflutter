import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_checking/features/dashboard/domain/user_location.dart';
import 'package:weather_checking/features/dashboard/presentation/providers/get_weather_provider.dart';

import '../../../../routing/routes_strings.dart';
import '../providers/location_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key, required this.name});

  final String name;

  // void _getLocation(bool permission) async {
  //   final position = await Geolocator.getCurrentPosition(
  //       locationSettings: LocationSettings(accuracy: LocationAccuracy.medium));
  //   debugPrint('resultado $position');
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationPermission = ref.watch(locationProvider);
    final state = ref.watch(getWeatherStatusProvider);

    ref.listen(locationProvider, (_, next) {
      next.whenOrNull(
        error: (error, stackTrace) => debugPrint('ERRADO ${error.toString()}'),
        data: (data) {
          if (data != null) {
            ref.read(getWeatherQueryProvider.notifier).state = Some(
              UserLocation(latitude: data.latitude, longitude: data.longitude),
            );
            debugPrint('ALOOO $data');
          }
        },
      );
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hi $name'),
          locationPermission.when(
              data: (position) {
                if (position != null) {}
                return ElevatedButton(
                  onPressed: () {
                    context.goNamed(RoutesStrings.login);
                  },
                  child: Text('logout'),
                );
              },
              error: (error, _) => Text('erro $error'),
              loading: () => const CircularProgressIndicator())

          // ElevatedButton(
          //     onPressed: locationPermission.isLoading
          //         ? null
          //         : () => _getLocation(true),
          //     child: Text('getlocation')),
        ],
      ),
    );
  }
}
