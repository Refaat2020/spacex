
import '../../../../../file_export.dart';

class MarsImageWidget extends StatelessWidget {
  const MarsImageWidget({Key? key,required this.imageUrl}) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return   Positioned(
      right: -130,
      top: 0,
      bottom: 0,
      child: SizedBox(
        width: MediaQuery.of(context).size.height / 2.6,
        child: CachedNetworkImage(
          imageUrl: "https://64.media.tumblr.com/acf18c8d589d9795b2c9791f3e3a76a9/tumblr_inline_nw6ag9H9F51tzhl5u_400.gifv",
          fit: BoxFit.contain,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
          const LoadingWidget(),
          errorWidget: (context, url, error) =>  const LoadingWidget(),
        ),
      ),
    );
  }
}
