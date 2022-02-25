import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spacex/config/locator.dart';
import 'package:spacex/model/launche_model.dart';
import 'package:spacex/repo/launches_repo.dart';
import 'package:url_launcher/url_launcher.dart';

part 'launch_state.dart';

class LaunchCubit extends Cubit<LaunchState> {
  LaunchCubit() : super(LaunchInitial());
  final LaunchesRepo _repository = locator<LaunchesRepo>();
  final List<LaunchModel>pastLaunch = [];
  final List<LaunchModel>filterLaunch = [];

  List<LaunchModel>allLaunch = [];
  LaunchModel ?upCoaming;
  LaunchModel ?selectedOne;

  DateTime? from;
  DateTime ?to;
  Future<void>getAllLaunch()async{
    emit(LaunchLoading());
    var  response = await _repository.getAllLaunch();
    allLaunch = response;
    getUpCoaming();
    getPastList();
    emit(LaunchDone());
  }
  /// getUpcoming launch
  void getUpCoaming(){
    for (var element in allLaunch) {
      if (element.upcoming == true && element.launchDate!.isAfter(DateTime.now())) {
        upCoaming = element;
      }
    }
  }
  ///get past launch
  void getPastList(){
    for (var element in allLaunch) {
      if (element.upcoming == false) {
       pastLaunch.add(element);
      }
    }
  }
  void filterBetweenDate(){
    filterLaunch.clear();
    emit(LaunchLoading());
    for (var element in pastLaunch) {
      if (element.launchDate!.isAfter(from!) && element.launchDate!.isBefore(to!)) {
        filterLaunch.add(element);
      }
    }
    filterLaunch.isNotEmpty?
    emit(LaunchFilter(pastLaunch: filterLaunch))
    :emit(LaunchListEmpty());

  }
  void clearFilter(){
    emit(LaunchLoading());
    emit(LaunchDone());
  }
  void launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
