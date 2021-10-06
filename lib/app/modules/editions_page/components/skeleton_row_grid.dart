import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonRowGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double rowHeight = 250;
    final double rowWidth = MediaQuery.of(context).size.width / 2.2;
    final double rowFontsize = 30;
    const framePadding = EdgeInsets.fromLTRB(0, 8, 0, 8);
    CrossAxisAlignment columAlignH = CrossAxisAlignment.center;
    MainAxisAlignment columAlignV = MainAxisAlignment.end;
    CrossAxisAlignment rowAlignV = CrossAxisAlignment.center;
    MainAxisAlignment rowAlignH = MainAxisAlignment.spaceEvenly;
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: AppColors.appBackground,
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: rowAlignV,
                mainAxisAlignment: rowAlignH,
                children: [
                  Padding(
                    padding: framePadding,
                    child: Container(
                      color: Theme.of(context).primaryColor,
                      height: rowHeight,
                      width: rowWidth,
                      child: Column(
                        crossAxisAlignment: columAlignH,
                        mainAxisAlignment: columAlignV,
                        children: [
                          Shimmer.fromColors(
                              child: Container(
                                color: Colors.red,
                                height: rowHeight * 0.80,
                                width: rowWidth * 0.85,
                              ),
                              baseColor: Colors.grey,
                              highlightColor: AppColors.appBackground),
                          Container(
                            color: Colors.white,
                            height: rowHeight * 0.15,
                            width: rowWidth * 0.85,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Shimmer.fromColors(
                                  child: Text(
                                    '...',
                                    style: TextStyle(fontSize: rowFontsize),
                                  ),
                                  baseColor: Colors.grey,
                                  highlightColor: AppColors.appBackground),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: framePadding,
                    child: Container(
                      color: Colors.white,
                      height: rowHeight,
                      width: rowWidth,
                      child: Column(
                        crossAxisAlignment: columAlignH,
                        mainAxisAlignment: columAlignV,
                        children: [
                          Shimmer.fromColors(
                              child: Container(
                                color: Colors.red,
                                height: rowHeight * 0.80,
                                width: rowWidth * 0.85,
                              ),
                              baseColor: Colors.grey,
                              highlightColor: AppColors.appBackground),
                          Container(
                            color: Colors.white,
                            height: rowHeight * 0.15,
                            width: rowWidth * 0.85,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Shimmer.fromColors(
                                  child: Text(
                                    '...',
                                    style: TextStyle(fontSize: rowFontsize),
                                  ),
                                  baseColor: Colors.grey,
                                  highlightColor: AppColors.appBackground),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
