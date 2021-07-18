import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class ButtomDownLoadWidget extends StatefulWidget {
  const ButtomDownLoadWidget({Key key}) : super(key: key);

  @override
  _ButtomDownLoadWidgetState createState() => _ButtomDownLoadWidgetState();
}

class _ButtomDownLoadWidgetState extends State<ButtomDownLoadWidget> {
  @override
  Widget build(BuildContext context) {
    double vHeight = MediaQuery.of(context).size.height;
    double vWidth = MediaQuery.of(context).size.width;
    return TextButton(
      onPressed: () {},
      // padding: EdgeInsets.zero,
      child: Container(
        height: vHeight * 0.06,
        width: vWidth / 8,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.orangePiaui,
          ),
        ),
        child: Align(
          child: Image.asset(
            'assets/images/arrow_download.png',
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
