
import '../../file_export.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin  {
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    context.read<LaunchCubit>().getAllLaunch();

    _controller = AnimationController(vsync: this);
    _controller.addListener(() {
      if (_controller.isCompleted) {
        Navigator.pushNamedAndRemoveUntil(
            context, "/timeScreen", (route) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: ScreenUtil().screenHeight,
        width:ScreenUtil().screenWidth ,
        child: Lottie.asset(
          "assets/rocket_splash.json",
          fit: BoxFit.fitHeight,
          controller: _controller,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward();
          },
        ),
      ),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
