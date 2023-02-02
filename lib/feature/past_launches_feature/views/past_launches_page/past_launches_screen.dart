
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:spacex/feature/past_launches_feature/domin/cubit/past_launches_cubit.dart';
import 'package:spacex/file_export.dart';

import '../../../upcoming_feature/domin/cubit/launch_cubit.dart';
import 'components/list_of_launches.dart';


class PastLaunchesScreen extends StatelessWidget {
  const PastLaunchesScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final launchCubit = context.watch<LaunchCubit>();
    final pastLaunches = context.watch<PastLaunchesCubit>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
            showCustomDateRangePicker(
              context,
              dismissible: true,
              minimumDate: DateTime(2002,1,1),
              maximumDate: DateTime.now().add(const Duration(days: 30)),
              endDate: pastLaunches.from,
              startDate: pastLaunches.to,
              onApplyClick: (start, end) {
                pastLaunches.saveAndFilterDates(start, end, launchCubit.pastLaunch);
              },
              onCancelClick: () {

              },
            );
          }, icon: const Icon(Icons.date_range)),
          IconButton(onPressed: () {
            pastLaunches.clearFilter();

          }, icon: const Icon(Icons.clear))
        ],
      ),
        body: Stack(
          children: [
            ///list of launches
            const ListOfLaunches(),
            ///background
            CachedNetworkImage(
              imageUrl: "https://c4.wallpaperflare.com/wallpaper/950/897/191/space-nasa-tilt-shift-clouds-wallpaper-preview.jpg",
              fit: BoxFit.contain,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
              const LoadingWidget(),
              errorWidget: (context, url, error) =>  const LoadingWidget(),
            ),
            Positioned(
                top: 150.h,
                left: 100.w,
                child: Text("Past Launches",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 25.sp),)),
          ],
        ),
    );
  }
}
