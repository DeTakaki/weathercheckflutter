import 'package:weather_checking/features/dashboard/domain/weather.dart';

abstract interface class IDashboardRepository {
  Future<Weather> getWeatherFromLocation(double lat, double lon);
}
