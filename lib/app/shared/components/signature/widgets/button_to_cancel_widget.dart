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
    return Container(
      width: 260,
      height: 35,
      color: AppColors.backgroundColorButton,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(AppColors.backgroundColorButton),
          side: MaterialStateProperty.all(
            BorderSide(
              color: AppColors.borderColor,
              width: 1,
            ),
          ),
        ),
        child: Text(
          'Cancelar',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.orangePiaui,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
