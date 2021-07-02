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
    return Container(
      width: 260,
      height: 35,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            AppColors.orangePiaui,
          ),
        ),
        onPressed: () {},
        child: Text(
          'Já é assinante? Entre agora.',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: AppColors.textColorWhite,
          ),
        ),
      ),
    );
  }
}
