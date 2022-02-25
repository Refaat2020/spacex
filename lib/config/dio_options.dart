import 'package:dio/dio.dart';
import 'package:spacex/constant/app_api_endpoints.dart';

class DioConfigOptions {

  static BaseOptions options =  BaseOptions(
      baseUrl: AppApiEndPoints.spacexBaseUrl,
      connectTimeout: 10000,
      receiveTimeout: 3000,
      followRedirects: false,
      validateStatus: (status) {
        return status! <= 500;
      },
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',

      });
}