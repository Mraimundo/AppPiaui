import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class BackToMagazine extends StatefulWidget {
  @override
  _BackToMagazineState createState() => _BackToMagazineState();
}

class _BackToMagazineState extends State<BackToMagazine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: AppColors.appBackground,
      child: Align(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Voltar para a revista Edição #',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 16,
            ),
          ),
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }
}
