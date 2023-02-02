part of 'past_launches_cubit.dart';

@immutable
abstract class PastLaunchesState {}

class PastLaunchesInitial extends PastLaunchesState {}
class PastLaunchesLoading extends PastLaunchesState {}
class PastLaunchesFilter extends PastLaunchesState {
  final List<LaunchModel>?pastLaunch;

  PastLaunchesFilter(this.pastLaunch);
}
class PastLaunchesDone extends PastLaunchesState {}
class PastLaunchesEmpty extends PastLaunchesState {}
