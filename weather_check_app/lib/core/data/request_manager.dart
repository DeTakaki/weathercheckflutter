import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

abstract class HttpMethods {
  static const String post = 'POST';
  static const String get = 'GET';
  static const String put = 'PUT';
  static const String delete = 'DELETE';
  static const String patch = 'PATCH';
}

class RequestManager {
  Future<Response> restRequest({
    required String url,
    required String method,
    Map? headers,
    dynamic body,
    Map<String, dynamic>? parameters,
    //bool hasToken = true,
  }) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll(
        {'content-type': 'application/json', 'accept': 'application/json'},
      );

    Dio dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 10),
    ));

    if (!kIsWeb) {
      dio.httpClientAdapter = IOHttpClientAdapter(createHttpClient: () {
        final HttpClient client =
            HttpClient(context: SecurityContext(withTrustedRoots: false));
        client.badCertificateCallback =
            ((X509Certificate certificate, String host, int port) => true);
        return client;
      });
    }

    //TODO: Add an auth token to persist, in case it is needed

    try {
      Response response = await dio.request(
        url,
        options: Options(headers: defaultHeaders, method: method),
        data: body,
        queryParameters: parameters,
      );
      return response;
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionTimeout) {
        throw Exception(
            "We've had a problem with your request. Please try again");
      } else if (error.type == DioExceptionType.connectionError) {
        throw Exception(
            'Whoops, internet connection seems to be not working. Please check and try again');
      } else if (error.response != null) {
        return error.response!;
      }
      rethrow;
    }
  }
}
