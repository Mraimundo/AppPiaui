import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class TextToSignWidget extends StatelessWidget {
  final VoidCallback onTap;
  const TextToSignWidget({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Center(
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: 'Bem-vindo à piauí, Tiago.',
                style: TextStyle(
                  fontFamily: ' Piaui',
                  fontSize: 17.5,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColorNormal,
                ),
              ),
              TextSpan(
                text: '  Clique aqui.',
                style: TextStyle(
                  fontFamily: 'Palatino',
                  fontSize: 12,
                  color: AppColors.orangePiaui,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
