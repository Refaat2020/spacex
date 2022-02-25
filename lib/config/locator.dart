import 'package:get_it/get_it.dart';
import 'package:spacex/repo/launches_repo.dart';
import 'package:spacex/utils/rest_call.dart';


final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(()=> RestCall());
  locator.registerLazySingleton(()=> LaunchesRepo());

}