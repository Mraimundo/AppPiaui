import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class ButtonToCancelWidget extends StatefulWidget {
  const ButtonToCancelWidget({Key key}) : super(key: key);

  @override
  _ButtonToCancelWidgetState createState() => _ButtonToCancelWidgetState();
}

class _ButtonToCancelWidgetState extends State<ButtonToCancelWidget> {
  @override
  Widget build(BuildContext context) {
    double vHeight = MediaQuery.of(context).size.height;
    double vWidth = MediaQuery.of(context).size.width;
    return TextButton(
      onPressed: () {},
      child: Container(
        height: vHeight * 0.05,
        width: vWidth / 1,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.orangePiaui,
          ),
        ),
        child: Align(
          child: Text(
            'Cancelar',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.orangePiaui,
            ),
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
