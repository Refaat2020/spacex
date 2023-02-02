import 'package:dio/dio.dart';

import '../utils/faliure.dart';

extension ResponseHandler on Response {
  dynamic handleResponse() async {
    if (statusCode! >201) {
      throw Failure(message:data,code: statusCode );

    } else {
      return data;
    }
  }
}