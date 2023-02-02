import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:spacex/core/config/locator.dart';
import 'package:spacex/feature/upcoming_feature/domin/cubit/launch_cubit.dart';
import 'package:test/test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  group('LaunchCubit', () {
    late LaunchCubit launchCubit;

    setUp(() {
      launchCubit = LaunchCubit();
    });

    tearDown(() {
      launchCubit.close();
    });

    test('initial state of LaunchCubit is launchState()', () {
      expect(launchCubit.state, LaunchInitial());
    });

    blocTest(
        'the LaunchCubit should emit a LaunchLoading when the getAllLaunch function is called',
        build: () => launchCubit,
        act: (cubit) => launchCubit.getAllLaunch(),
        expect: () => [LaunchLoading(),LaunchDone(),],);
  });
}