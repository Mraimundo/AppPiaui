import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
      onPressed: () {
        Modular.to.pushNamed('/magazine',
            arguments:
                'https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F80%2F85%2Fea%2F8085ea8d91dda668fc1e4c9620583af0.jpg&imgrefurl=https%3A%2F%2Fbr.pinterest.com%2Fpin%2F116530709093102919%2F&tbnid=3I5cjPzOnxPi3M&vet=12ahUKEwjwn7Hkl5jyAhV_pZUCHcQqD40QMygEegUIARC9AQ..i&docid=WopqXG1wt83raM&w=2000&h=2626&q=piaui%20revista&ved=2ahUKEwjwn7Hkl5jyAhV_pZUCHcQqD40QMygEegUIARC9AQ');
      },
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
