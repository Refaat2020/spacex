
import 'package:spacex/feature/past_launches_feature/views/past_launches_page/components/past_launch_card.dart';

import '../../../../../file_export.dart';
import '../../../../upcoming_feature/domin/cubit/launch_cubit.dart';
import '../../../domin/cubit/past_launches_cubit.dart';

class ListOfLaunches extends StatelessWidget {
  const ListOfLaunches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final launchCubit = context.watch<LaunchCubit>();

    return  Padding(
      padding: EdgeInsets.only(top: ScreenUtil().screenHeight /4.5),
      child: BlocBuilder<PastLaunchesCubit, PastLaunchesState>(
        builder: (context, state) {
          if (state is PastLaunchesFilter) {
            return ListView.builder(
              itemCount: state.pastLaunch!.length,
              shrinkWrap: true,

              itemBuilder: (context, index) {
                return PastLaunchCard(lunch: state.pastLaunch![index],);
              },);
          }
          else if (state is PastLaunchesEmpty) {
            return const Center(
              child: Text("No Launch between this Dates 🛰"),
            );
          }
          return ListView.builder(
            itemCount: launchCubit.pastLaunch.length,
            shrinkWrap: true,

            itemBuilder: (context, index) {
              return PastLaunchCard(lunch: launchCubit.pastLaunch[index],);
            },);
        },
      ),
    );
  }
}
