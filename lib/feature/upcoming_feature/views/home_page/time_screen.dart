import 'package:spacex/file_export.dart';

import '../../domin/cubit/launch_cubit.dart';
import 'components/mars_image_widget.dart';
import 'components/upcoming_widget.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final launchCubit = context.watch<LaunchCubit>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: BlocBuilder<LaunchCubit, LaunchState>(
          builder: (context, state) {
            if (state is LaunchError) {
              return Center(
                child: Text(state.errorMessage,
                    style: TextStyle(fontSize: 14.sp, color: Colors.white)),
              );
            }
            return Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: const BoxDecoration(color: Colors.black),
                  child: Stack(
                    children: <Widget>[
                      const MarsImageWidget(
                          imageUrl:
                              "https://64.media.tumblr.com/acf18c8d589d9795b2c9791f3e3a76a9/tumblr_inline_nw6ag9H9F51tzhl5u_400.gifv"),
                      UpcomingWidget(
                        upCoaming: launchCubit.upCoaming,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/pastScreen");
                    },
                    child: Container(
                      height: 40.h,
                      width: ScreenUtil().screenWidth / 1.1,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(5.r),
                          border:
                              Border.all(color: Colors.blueAccent, width: 1.5)),
                      child: Center(
                        child: Text(
                          "Past Launches",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
