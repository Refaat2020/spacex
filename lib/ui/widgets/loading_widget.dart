
import '../../file_export.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Lottie.asset(
        "assets/loading_rocket.json",
        fit: BoxFit.contain,
      ),
    );
  }
}
