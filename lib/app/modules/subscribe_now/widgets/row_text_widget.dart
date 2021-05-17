import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

Widget rowTextWidget(double width, double height, String text, double fontSize,
    {FontWeight fontWeight}) {
  return Row(
    children: [
      Container(
        width: width,
        height: height,
        color: AppColors.appBackground,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: AppColors.dark,
            ),
          ),
        ),
      ),
    ],
  );
}
