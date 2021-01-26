import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonLastEdition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double vHeight = MediaQuery.of(context).size.height;
    double vWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Expanded(
          child: Container(
            color: AppColors.appBackground,
            child: Container(
              color: Colors.white,
              width: vWidth,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                    child: Shimmer.fromColors(
                        child: Container(
                          color: Colors.red,
                          height: vHeight * 0.6,
                          width: vWidth,
                        ),
                        baseColor: Colors.grey,
                        highlightColor: AppColors.appBackground),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: Shimmer.fromColors(
                        child: Text(
                          '...',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40),
                        ),
                        baseColor: Colors.grey,
                        highlightColor: AppColors.appBackground),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                    child: Container(
                      color: AppColors.bottomAppBar,
                      height: vHeight * 0.08,
                      child: Align(
                        child: Shimmer.fromColors(
                            child: Text(
                              '...',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 40),
                            ),
                            baseColor: Colors.grey,
                            highlightColor: AppColors.appBackground),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
