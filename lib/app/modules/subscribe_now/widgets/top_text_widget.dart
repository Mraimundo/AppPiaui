import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

Widget topTextWidget(double width, double fontSize) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 26),
        child: Container(
          width: width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Assine a',
                    style: TextStyle(
                      fontSize: fontSize,
                    ),
                  ),
                  Text(
                    ' revista piauí ',
                    style: TextStyle(
                      fontSize: fontSize,
                      color: AppColors.orangePiaui,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'agora e',
                    style: TextStyle(
                      fontSize: fontSize,
                    ),
                  ),
                ],
              ),
              Text(
                'obtenha descontos incríveis',
                style: TextStyle(
                  fontSize: fontSize,
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}
