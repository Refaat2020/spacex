
import 'package:spacex/file_export.dart';
import 'package:f_datetimerangepicker/f_datetimerangepicker.dart';

class PastLaunchesScreen extends StatelessWidget {
  const PastLaunchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final launchCubit = context.watch<LaunchCubit>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            DateTimeRangePicker(
                startText: "From",
                endText: "To",
                doneText: "Yes",
                cancelText: "Cancel",
                interval: 5,
                initialStartTime: DateTime.now(),
                initialEndTime: DateTime.now(),
                mode: DateTimeRangePickerMode.date,
                minimumTime: DateTime(2002,1,1),
                maximumTime: DateTime.now().add(const Duration(days: 25)),
                use24hFormat: true,
                onConfirm: (start, end) {
                  launchCubit.from = start;
                  launchCubit.to = end;
                  launchCubit.filterBetweenDate();
                }).showPicker(context);

          }, icon: const Icon(Icons.date_range)),
          IconButton(onPressed: () {
           launchCubit.clearFilter();

          }, icon: const Icon(Icons.clear))
        ],
      ),
        body: Stack(
          children: [
            ///list of launches
            Padding(
              padding:  EdgeInsets.only(top: ScreenUtil().screenHeight /4.5),
              child: BlocBuilder<LaunchCubit, LaunchState>(
              builder: (context, state) {
                if (state is LaunchFilter) {
                  return ListView.builder(
                    itemCount: state.pastLaunch!.length,
                    shrinkWrap: true,

                    itemBuilder: (context, index) {
                      return Column(

                        children: [
                          Divider(
                            height: 50.h,
                            color: Colors.black12,
                            endIndent: 10,
                            indent: 10,
                            thickness: 1.6,
                          ),
                          GestureDetector(
                            child: Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width: 10.w,),

                                  CachedNetworkImage(
                                    imageUrl:  state.pastLaunch![index].patchUrl!,
                                    height: 70.h,
                                    width: 60.w,
                                    fit: BoxFit.contain,
                                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                                    const LoadingWidget(),
                                    errorWidget: (context, url, error) =>  const LoadingWidget(),
                                  ),

                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  SizedBox(
                                    width: ScreenUtil().screenWidth -140.w,
                                    child: Column(
                                      children: [
                                        SizedBox(height: 10.h,),
                                        Text(
                                          state.pastLaunch![index].name!,
                                          overflow: TextOverflow.fade,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                        Text(
                                          state.pastLaunch![index].getTentativeDate!,
                                          overflow: TextOverflow.fade,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                              color: Colors.transparent,
                            ),
                            onTap: () {
                              launchCubit.selectedOne = launchCubit.pastLaunch[index];
                              showModalBottomSheet(
                                  context: context,

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  builder: (builder) {
                                    return const LaunchesDetailsScreen();
                                  });
                            },
                          ),

                        ],
                      );
                    },);
                }
                else if (state is LaunchListEmpty) {
                  return const Center(
                    child: Text("No Launch between this Dates"),
                  );
                }
                return ListView.builder(
                itemCount: launchCubit.pastLaunch.length,
                shrinkWrap: true,

                itemBuilder: (context, index) {
                return Column(

                  children: [
                    Divider(
                      height: 50.h,
                      color: Colors.black12,
                      endIndent: 10,
                      indent: 10,
                      thickness: 1.6,
                    ),
                    GestureDetector(
                      
                      child: Container(
                        
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 10.w,),

                            CachedNetworkImage(
                              imageUrl:  launchCubit.pastLaunch[index].patchUrl!,
                              height: 70.h,
                              width: 60.w,
                              fit: BoxFit.contain,
                              progressIndicatorBuilder: (context, url, downloadProgress) =>
                              const LoadingWidget(),
                              errorWidget: (context, url, error) =>  const LoadingWidget(),
                            ),

                            SizedBox(
                              width: 15.w,
                            ),
                            SizedBox(
                              width: ScreenUtil().screenWidth -140.w,
                              child: Column(
                                children: [
                                  SizedBox(height: 10.h,),
                                  Text(
                                    launchCubit.pastLaunch[index].name!,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  Text(
                                    launchCubit.pastLaunch[index].getTentativeDate!,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                        color: Colors.transparent,
                      ),
                      onTap: () {
                        launchCubit.selectedOne = launchCubit.pastLaunch[index];
                        showModalBottomSheet(
                            context: context,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            builder: (builder) {
                              return const LaunchesDetailsScreen();
                            });
                      },
                    ),

                  ],
                );
              },);
              },
            ),
            ),
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
