import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_checking/constants/api_key.dart';
import 'package:weather_checking/constants/environment.dart';
import 'package:weather_checking/core/data/request_manager.dart';

abstract interface class IDashboardRemoteDatasource {
  Future<void> getWeatherFromLocation(double lat, double lon);
}

class DashboardRemoteDatasource implements IDashboardRemoteDatasource {
  @override
  Future<void> getWeatherFromLocation(double lat, double lon) async {
    final response = await RequestManager()
        .restRequest(url: baseUrl, method: HttpMethods.get, parameters: {
      'lat': lat.toStringAsFixed(2),
      'lon': lon.toStringAsFixed(2),
      'appid': apiKey,
    });
    // return response;
  }
}

final dashboardRemoteDatasourceProvider =
    Provider<IDashboardRemoteDatasource>((_) => DashboardRemoteDatasource());
