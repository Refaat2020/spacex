import 'package:spacex/file_export.dart';

import 'config/app_router.dart';
import 'config/locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final  AppRouter _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
    builder: () => BlocProvider(
      create: (context) => LaunchCubit(),
      child: MaterialApp(
        theme: ThemeData.dark(),

        builder: (context, widget) {
          ScreenUtil.setContext(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    ),

    );
  }
}

