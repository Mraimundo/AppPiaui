import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class ButtomOrangeWidget extends StatefulWidget {
  const ButtomOrangeWidget({Key key}) : super(key: key);

  @override
  _ButtomOrangeWidgetState createState() => _ButtomOrangeWidgetState();
}

class _ButtomOrangeWidgetState extends State<ButtomOrangeWidget> {
  @override
  Widget build(BuildContext context) {
    double vHeight = MediaQuery.of(context).size.height;
    double vWidth = MediaQuery.of(context).size.width;
    return TextButton(
      onPressed: () {},
      // padding: EdgeInsets.zero,
      child: Container(
        color: AppColors.orangePiaui,
        height: vHeight * 0.06,
        width: vWidth / 2.5,
        child: Align(
          child: Text(
            'Experimente',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
