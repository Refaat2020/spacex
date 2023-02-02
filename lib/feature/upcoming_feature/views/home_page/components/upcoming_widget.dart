import 'package:spacex/file_export.dart';

import '../../../data/model/launche_model.dart';

class UpcomingWidget extends StatelessWidget {
  const UpcomingWidget({Key ?key,this.upCoaming}) : super(key: key);
 final  LaunchModel ?upCoaming;


  @override
  Widget build(BuildContext context) {
    return  Positioned(
      top: 44,
      left: 8,
      bottom: 16,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child:   upCoaming != null?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20.h,
            ),
            const Text(
              'Day Hours Min ',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
             upCoaming!.getRemainTime(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'Name ',
              style: TextStyle(color: Colors.grey, fontSize: 13.sp),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
            upCoaming!.name!,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'Flight number',
              style: TextStyle(color: Colors.grey, fontSize: 14.sp),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
             upCoaming!.getNumber!,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
          ],
        )
            :Text("No upcoming Launch 🚀 ",style: Theme.of(context).textTheme.headline2?.copyWith(color: Colors.white,fontSize: 15.sp)),
      ),
    );
  }
}
