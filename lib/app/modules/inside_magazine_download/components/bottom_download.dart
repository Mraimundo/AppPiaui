import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class BottomDownLoad extends StatelessWidget {
  const BottomDownLoad({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double vHeight = MediaQuery.of(context).size.height;
    double vWidth = MediaQuery.of(context).size.width;
    return TextButton(
      onPressed: () {},
      child: Container(
        color: AppColors.orangePiaui,
        height: vHeight * 0.06,
        width: vWidth / 4,
        child: Align(
          child: Text(
            'Ler agora',
            style: TextStyle(
              fontFamily: 'Piaui',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
