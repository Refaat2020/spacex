import 'package:spacex/file_export.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final launchCubit = context.watch<LaunchCubit>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(color: Colors.black),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    right: -130,
                    top: 0,
                    bottom: 0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.height / 2.6,
                      child: CachedNetworkImage(
                        imageUrl: "https://ian.macky.net/pat/map/globes/venus-skin-256-fast.gif",
                        fit: BoxFit.contain,
                        progressIndicatorBuilder: (context, url, downloadProgress) =>
                        const LoadingWidget(),
                        errorWidget: (context, url, error) =>  const LoadingWidget(),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 44,
                    left: 8,
                    bottom: 16,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
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
                            launchCubit.upCoaming!.getRemainTime(),
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
                            launchCubit.upCoaming!.name!,
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
                            launchCubit.upCoaming!.getNumber!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
           Center(
             child: InkWell(
               onTap:(){
                Navigator.pushNamed(context, "/pastScreen");
               } ,
               child: Container(
                 height: 40.h,
                 width: ScreenUtil().screenWidth/1.1,
                 decoration: BoxDecoration(
                     color:Colors.blueAccent ,
                     borderRadius: BorderRadius.circular(5.r),
                     border: Border.all(color: Colors.blueAccent,width:1.5 )
                 ),
                 child: Center(
                   child: Text("Past Launches" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold,fontSize: 16.sp),),
                 ),
               ),
             ),
           )
          ],
        ),
      ),
    );
  }
}
