import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'package:shimmer/shimmer.dart';

class ImageShimmer extends StatefulWidget {
  final String url;

  const ImageShimmer({Key key, this.url}) : super(key: key);

  @override
  _ImageShimmerState createState() => _ImageShimmerState();
}

class _ImageShimmerState extends State<ImageShimmer> {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      widget.url,
      fit: BoxFit.fill,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Shimmer.fromColors(
            direction: ShimmerDirection.ltr,
            child: SizedBox.expand(
              child: Container(
                color: Colors.black,
              ),
            ),
            baseColor: Colors.grey,
            highlightColor: AppColors.appBackground);
      },
    );
  }
}
