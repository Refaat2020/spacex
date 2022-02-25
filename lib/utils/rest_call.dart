
import 'package:dio/dio.dart';
import 'package:spacex/config/dio_options.dart';


class RestCall {
  Dio dio = Dio();

  Future getRequest(String apiUrl,) async {
    try {
      dio.options = DioConfigOptions.options;
      Response response = await dio.get(apiUrl);

      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
