
import 'package:spacex/file_export.dart';
class LaunchesDetailsScreen extends StatelessWidget {
  const LaunchesDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final launchCubit = context.watch<LaunchCubit>();
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(left: 50.w),
            child: Column(

              children: [
                launchCubit.selectedOne!.hasPhotos!?
                CachedNetworkImage(
                  imageUrl: launchCubit.selectedOne!.photos![0],
                  fit: BoxFit.contain,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const LoadingWidget(),
                  errorWidget: (context, url, error) =>  const LoadingWidget(),
                )
                :CachedNetworkImage(
                  imageUrl: launchCubit.selectedOne!.patchUrl!,
                  fit: BoxFit.contain,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const LoadingWidget(),
                  errorWidget: (context, url, error) =>  const LoadingWidget(),
                ),

                SizedBox(height: 10.h,),

                Text("Name : ${launchCubit.selectedOne!.name!}"),
                SizedBox(height: 10.h,),
                Text("Date : ${launchCubit.selectedOne!.getTentativeDate!}"),

                SizedBox(height: 10.h,),
                Text("launchpad : ${launchCubit.selectedOne!.launchpad!}"),
                SizedBox(height: 10.h,),
                Text("Rocket : ${launchCubit.selectedOne!.rocket!}"),
                SizedBox(height: 10.h,),
                Text("Payloads : ${launchCubit.selectedOne!.payloads![0]}"),
                SizedBox(height: 10.h,),

                launchCubit.selectedOne!.hasVideo!?
                    Container(
                      height: 100.h,
                      width: 100.w,
                      decoration:BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      ) ,
                      child: GestureDetector(
                        child: const Icon(Icons.play_arrow),
                        onTap: () {
                         launchCubit .launchURL( launchCubit.selectedOne!.getVideo!);
                        },
                      ),
                    )
                    :const Text("No video for this launch"),
                SizedBox(height: 10.h,),


              ],
            ),
          ),
        ),
    );
  }

}
