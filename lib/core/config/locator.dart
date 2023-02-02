import 'package:get_it/get_it.dart';

import '../../feature/upcoming_feature/domin/repo/launches_repo.dart';
import '../utils/rest_call.dart';


final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(()=> RestCall());
  locator.registerLazySingleton(()=> LaunchesRepo());

}