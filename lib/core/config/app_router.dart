import 'package:flutter/cupertino.dart';
import 'package:spacex/feature/past_launches_feature/domin/cubit/past_launches_cubit.dart';
import 'package:spacex/feature/past_launches_feature/views/past_launches_page/past_launches_screen.dart';
import 'package:spacex/feature/upcoming_feature/views/splash_page/splash_screen.dart';

import '../../feature/upcoming_feature/views/home_page/time_screen.dart';
import '../../file_export.dart';


class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => SplashScreen());
      case '/timeScreen':
        return CupertinoPageRoute(builder: (_) => const TimeScreen());
      case '/pastScreen':
        return CupertinoPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => PastLaunchesCubit(),
              child: const PastLaunchesScreen(),
            ));

      default:
        return null;
    }
  }
}