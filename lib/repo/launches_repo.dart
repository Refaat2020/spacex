import 'package:spacex/config/locator.dart';
import 'package:spacex/constant/app_api_endpoints.dart';
import 'package:spacex/model/launche_model.dart';
import 'package:spacex/utils/rest_call.dart';

class LaunchesRepo{

  final RestCall _repository = locator<RestCall>();
  Future<List<LaunchModel>>getAllLaunch()async{
  var response = await  _repository.getRequest(AppApiEndPoints.launches);
    List<LaunchModel> allLaunches;
  allLaunches = (response as List)
        .map((launches) => LaunchModel.fromJson(launches as Map<String,dynamic>))
        .toList();

  return allLaunches;
  }
}