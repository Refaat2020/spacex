
import 'package:spacex/feature/past_launches_feature/domin/cubit/past_launches_cubit.dart';
import 'package:spacex/file_export.dart';

import '../../../upcoming_feature/data/model/launche_model.dart';

class LaunchesDetailsScreen extends StatelessWidget {
  const LaunchesDetailsScreen({Key? key,this.selectedOne}) : super(key: key);
  final LaunchModel? selectedOne;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(left: 50.w),
            child: Column(

              children: [
               selectedOne!.hasPhotos!?
                CachedNetworkImage(
                  imageUrl: selectedOne!.photos![0],
                  fit: BoxFit.contain,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const LoadingWidget(),
                  errorWidget: (context, url, error) =>  const LoadingWidget(),
                )
                :CachedNetworkImage(
                  imageUrl: selectedOne!.patchUrl!,
                  fit: BoxFit.contain,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const LoadingWidget(),
                  errorWidget: (context, url, error) =>  const LoadingWidget(),
                ),

                SizedBox(height: 10.h,),

                Text("Name : ${selectedOne!.name!}"),
                SizedBox(height: 10.h,),
                Text("Date : ${selectedOne!.getTentativeDate!}"),

                SizedBox(height: 10.h,),
                Text("launchpad : ${selectedOne!.launchpad!}"),
                SizedBox(height: 10.h,),
                Text("Rocket : ${selectedOne!.rocket!}"),
                SizedBox(height: 10.h,),
                Text("Payloads : ${selectedOne!.payloads![0]}"),
                SizedBox(height: 10.h,),

                selectedOne!.hasVideo!?
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
                        context.read<PastLaunchesCubit>().launchURL(selectedOne!.getVideo!);
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
