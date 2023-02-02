import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spacex/core/extension/task_excuter.dart';

import '../../../../core/config/locator.dart';
import '../../data/model/launche_model.dart';
import '../repo/launches_repo.dart';

part 'launch_state.dart';

class LaunchCubit extends Cubit<LaunchState> {
  LaunchCubit() : super(LaunchInitial());
  final LaunchesRepo _repository = locator<LaunchesRepo>();
  final List<LaunchModel>pastLaunch = [];

  List<LaunchModel>allLaunch = [];
  LaunchModel ?upCoaming;


  Future<void>getAllLaunch()async{
    emit(LaunchLoading());
    var  response =  _repository.getAllLaunch();
    await response.execute(
      onFailed: (f) =>emit(LaunchError(errorMessage: f.message!)) ,
      onSuccess: (value) {
        allLaunch = value;
        getUpCoaming();
        getPastList();
        emit(LaunchDone());
      },
    );

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


}
