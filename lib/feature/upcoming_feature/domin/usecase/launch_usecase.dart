import '../../data/model/launche_model.dart';

abstract class ILaunch {

  Future<List<LaunchModel>> getAllLaunch();

}