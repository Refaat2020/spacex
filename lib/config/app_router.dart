import 'package:flutter/cupertino.dart';
import 'package:spacex/ui/screens/past_launches_screen.dart';
import 'package:spacex/ui/screens/splash_screen.dart';
import 'package:spacex/ui/screens/time_screen.dart';


class AppRouter{
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_)=> SplashScreen());
      case '/timeScreen':
        return CupertinoPageRoute(builder: (_)=> const TimeScreen());
      case '/pastScreen':
        return CupertinoPageRoute(builder: (_)=> const PastLaunchesScreen());

      default:
        return null;
    }
  }
}