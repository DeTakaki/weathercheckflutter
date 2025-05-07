import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:weather_checking/features/dashboard/data/repos/dashboard_repository.dart';
import 'package:weather_checking/features/dashboard/domain/user_location.dart';
import 'package:weather_checking/features/dashboard/domain/weather.dart';

final getWeatherStatusProvider =
    Provider.autoDispose<AsyncValue<Weather?>>((ref) {
  final query = ref.watch(getWeatherQueryProvider);
  return query.match(
    () => const AsyncData(null),
    (value) => ref.watch(getWeatherFutureProvider(value)),
  );
});

final getWeatherQueryProvider =
    StateProvider.autoDispose<Option<UserLocation>>((_) => const None());

final getWeatherFutureProvider = FutureProvider.autoDispose
    .family<Weather, UserLocation>((ref, location) async {
  final repository = ref.read(dashboardRepositoryProvider);
  return await repository.getWeatherFromLocation(
      location.latitude, location.longitude);
});
