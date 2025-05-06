import 'dart:ffi';

import 'package:weather_checking/constants/environment.dart';
import 'package:weather_checking/core/data/request_manager.dart';

abstract interface class IDashboardRemoteDatasource {
  Future<void> getWeatherFromLocation(Double lat, Double lon);
}

class DashboardRemoteDatasource implements IDashboardRemoteDatasource {
  @override
  Future<void> getWeatherFromLocation(Double lat, Double lon) async {
    final response = await RequestManager()
        .restRequest(url: baseUrl, method: HttpMethods.get, parameters: {
      'lat': lat,
      'lon': lon,
    });
    // return response;
  }
}
