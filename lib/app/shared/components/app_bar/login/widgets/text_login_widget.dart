import 'package:flutter/cupertino.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class TextLoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double vFontSize = 18;
    final double vFontSize2 = 15;

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 29),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Faça seu login",
              style: TextStyle(
                  fontSize: vFontSize,
                  fontWeight: FontWeight.bold,
                  color: AppColors.dark),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 9),
              child: Text(
                "Assinantes da revista piauí possuem acesso ilimitado a todo conteúdo disponível no app.",
                style: TextStyle(
                    fontSize: vFontSize2,
                    fontWeight: FontWeight.normal,
                    color: AppColors.dark),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
