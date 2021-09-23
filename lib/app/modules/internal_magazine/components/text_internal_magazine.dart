import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class TextInternalMagazine extends StatefulWidget {
  @override
  _TextInternalMagazineState createState() => _TextInternalMagazineState();
}

class _TextInternalMagazineState extends State<TextInternalMagazine> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Align(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Edição #175',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColorNormal,
                  ),
                ),
              ),
              SizedBox(height: 23),
              Padding(
                padding: const EdgeInsets.only(left: 28, right: 32),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: AppColors.internalBorderColor, width: 0.9),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 21),
              SizedBox(height: 11),
              Text(
                'PARADOS NA CONTRAMÃO',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColorNormal,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              SizedBox(height: 10),
              Text(
                'JOÃO MOREIRA SALLES',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColorNormal,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Text(
                'abr2021',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColorNormal,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 35),
            ],
          ),
          alignment: Alignment.centerLeft),
    );
  }
}
