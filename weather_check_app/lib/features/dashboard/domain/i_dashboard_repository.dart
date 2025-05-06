abstract interface class IDashboardRepository {
  Future<void> getWeatherFromLocation(double lat, double lon);
}
