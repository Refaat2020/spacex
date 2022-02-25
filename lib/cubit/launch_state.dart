part of 'launch_cubit.dart';

abstract class LaunchState extends Equatable {
  const LaunchState();
}

class LaunchInitial extends LaunchState {
  @override
  List<Object> get props => [];
}
class LaunchLoading extends LaunchState {
  @override
  List<Object> get props => [];
}
class LaunchDone extends LaunchState {
  final List<LaunchModel>?pastLaunch;

  LaunchDone({this.pastLaunch});

  @override
  List<Object> get props => [];
}
class LaunchFilter extends LaunchState {
  final List<LaunchModel>?pastLaunch;

  LaunchFilter({this.pastLaunch});

  @override
  List<Object> get props => [];
}
class LaunchListEmpty extends LaunchState {
  @override
  List<Object> get props => [];
}

