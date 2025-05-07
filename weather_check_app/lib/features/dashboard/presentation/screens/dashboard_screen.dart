import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_checking/constants/app_colors.dart';
import 'package:weather_checking/features/dashboard/domain/user_location.dart';
import 'package:weather_checking/features/dashboard/presentation/providers/get_weather_provider.dart';

import '../../../../routing/routes_strings.dart';
import '../providers/location_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key, required this.name});

  final String name;

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
          }
        },
      );
    });

    ref.listen(getWeatherStatusProvider, (_, next) {
      next.whenData((weather) {
        if (weather != null) {
          debugPrint('now i have $weather');
        }
      });
    });
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                loading: () => const CircularProgressIndicator()),
            ElevatedButton(
                onPressed: () {
                  context.goNamed(RoutesStrings.login);
                },
                child: Text('sair')),
            state.when(
                data: (weather) {
                  if (weather != null) {
                    return Column(
                      children: [
                        Text('The weather now in ${weather.cityName} is:'),
                        Text('${weather.temperature} degrees Celsius'),
                        Text(
                            'It feels like ${weather.feelsLike} degrees Celsius'),
                        Text('The humidity is at ${weather.humidity}%'),
                        Text('and the wind speed is ${weather.windSpeed}m/s'),
                      ],
                    );
                  } else {
                    return const Text('No weather conditions');
                  }
                },
                error: (error, _) => Text('error $error'),
                loading: () => const LinearProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
