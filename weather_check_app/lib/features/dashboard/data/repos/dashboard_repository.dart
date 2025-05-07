import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_checking/features/dashboard/data/datasources/dashboard_remote_datasource.dart';
import 'package:weather_checking/features/dashboard/domain/i_dashboard_repository.dart';
import 'package:weather_checking/features/dashboard/domain/weather.dart';

class DashboardRepository implements IDashboardRepository {
  const DashboardRepository({
    required this.remoteDatasource,
  });

  final IDashboardRemoteDatasource remoteDatasource;
  @override
  Future<Weather> getWeatherFromLocation(double lat, double lon) async {
    return await remoteDatasource.getWeatherFromLocation(lat, lon);
  }
}

final dashboardRepositoryProvider = Provider.autoDispose<IDashboardRepository>(
    (ref) => DashboardRepository(
        remoteDatasource: ref.watch(dashboardRemoteDatasourceProvider)));
