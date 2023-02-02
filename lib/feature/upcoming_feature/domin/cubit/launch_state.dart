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
class LaunchError extends LaunchState {
  final String errorMessage;

  const LaunchError({required this.errorMessage});

  @override
  List<Object> get props => [];
}
class LaunchDone extends LaunchState {
  final List<LaunchModel>?pastLaunch;

  LaunchDone({this.pastLaunch});

  @override
  List<Object> get props => [];
}



