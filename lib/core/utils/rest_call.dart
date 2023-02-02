
import 'package:dio/dio.dart';
import 'package:spacex/core/extension/response_extension.dart';

import '../config/dio_options.dart';


class RestCall {
  Dio dio = Dio();

  Future getRequest(String apiUrl,) async {
    try {
      dio.options = DioConfigOptions.options;
      Response response = await dio.get(apiUrl);

     return response.handleResponse();
    } catch (e) {
      throw Exception(e);
    }
  }
}
