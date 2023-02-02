import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../upcoming_feature/data/model/launche_model.dart';

part 'past_launches_state.dart';

class PastLaunchesCubit extends Cubit<PastLaunchesState> {
  PastLaunchesCubit() : super(PastLaunchesInitial());

  DateTime? from;
  DateTime? to;
  final List<LaunchModel>filterLaunch = [];
  LaunchModel ?selectedOne;

  ///for filter
  void filterBetweenDate( List<LaunchModel>pastLaunch){
    filterLaunch.clear();
    emit(PastLaunchesLoading());
    for (var element in pastLaunch) {
      if (element.launchDate!.isAfter(from!) && element.launchDate!.isBefore(to!)) {
        filterLaunch.add(element);
      }
    }
    from =null;
    to = null;
    filterLaunch.isNotEmpty?
    emit(PastLaunchesFilter( filterLaunch))
        :emit(PastLaunchesEmpty());

  }
  void clearFilter(){
    emit(PastLaunchesLoading());
    filterLaunch.clear();
    emit(PastLaunchesDone());
  }

  /// get range and filter between the launches

  void saveAndFilterDates(DateTime start , DateTime end,List<LaunchModel>pastLaunch){
    from = start;
    to = end;
    filterBetweenDate(pastLaunch);
  }
///for open video
  void launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
