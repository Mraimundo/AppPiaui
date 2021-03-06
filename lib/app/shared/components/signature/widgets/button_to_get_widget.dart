import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class ButtonToGetWidget extends StatefulWidget {
  const ButtonToGetWidget({Key key}) : super(key: key);

  @override
  _ButtonToGetWidgetState createState() => _ButtonToGetWidgetState();
}

class _ButtonToGetWidgetState extends State<ButtonToGetWidget> {
  @override
  Widget build(BuildContext context) {
    double vHeight = MediaQuery.of(context).size.height;
    double vWidth = MediaQuery.of(context).size.width;
    return TextButton(
      onPressed: () {},
      child: Container(
        color: AppColors.orangePiaui,
        height: vHeight * 0.05,
        width: vWidth / 1,
        child: Align(
          child: Text(
            'Já é assinante? Entre agora.',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
