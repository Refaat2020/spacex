
import '../../../../../file_export.dart';
import '../../../../upcoming_feature/data/model/launche_model.dart';

class PastLaunchCard extends StatelessWidget {
  const PastLaunchCard({Key? key,required this.lunch}) : super(key: key);
  final LaunchModel lunch;
  @override
  Widget build(BuildContext context) {
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
                  imageUrl:  lunch.patchUrl!,
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
                        lunch.name!,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 15.sp,
                        ),
                      ),
                      Text(
                        lunch.getTentativeDate!,
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

            showModalBottomSheet(
                context: context,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                builder: (builder) {
                  return  LaunchesDetailsScreen(selectedOne:  lunch,);
                });
          },
        ),

      ],
    );
  }
}
