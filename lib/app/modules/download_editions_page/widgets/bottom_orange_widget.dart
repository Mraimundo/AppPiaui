import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class ButtomOrangeWidget extends StatefulWidget {
  dynamic revist;
  ButtomOrangeWidget({Key key, this.revist}) : super(key: key);

  @override
  _ButtomOrangeWidgetState createState() => _ButtomOrangeWidgetState();
}

class _ButtomOrangeWidgetState extends State<ButtomOrangeWidget> {
  @override
  Widget build(BuildContext context) {
    double vHeight = MediaQuery.of(context).size.height;
    double vWidth = MediaQuery.of(context).size.width;
    return TextButton(
      onPressed: () {
        Modular.to.pushNamed('/magazine_downloads',
            arguments: {"revist": widget.revist});
      },
      // padding: EdgeInsets.zero,
      child: Container(
        color: AppColors.backgroundColorLastEdition,
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
