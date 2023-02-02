
import 'package:flutter/foundation.dart';

import '../../../../core/config/locator.dart';
import '../../../../core/constant/app_api_endpoints.dart';
import '../../../../core/utils/faliure.dart';
import '../../../../core/utils/rest_call.dart';
import '../../data/model/launche_model.dart';
import '../usecase/launch_usecase.dart';


class LaunchesRepo implements ILaunch{

  final RestCall _repository = locator<RestCall>();

  @override
  Future<List<LaunchModel>>getAllLaunch()async{
    try{
      var response =  await _repository.getRequest(AppApiEndPoints.launches);
      List<LaunchModel> allLaunches;

      allLaunches = await parseJsonInBackground(json: await response);

      return allLaunches;
    }on Failure {
      rethrow;
    } catch (e) {

      throw Failure(message: e.toString());
    }

  }
  Future<List<LaunchModel>> parseJsonInBackground({dynamic json}) async {
    // compute spawns an isolate, runs a callback on that isolate, and returns a Future with the result
    return await compute(parseJson, json);
  }
}

List<LaunchModel> parseJson(dynamic json){
  List<LaunchModel> allLaunches;
  allLaunches = (json as List)
      .map((launches) => LaunchModel.fromJson(launches as Map<String,dynamic>))
      .toList();
  return allLaunches;
}
