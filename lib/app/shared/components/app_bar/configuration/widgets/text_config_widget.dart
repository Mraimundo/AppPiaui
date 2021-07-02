import 'package:flutter/cupertino.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class TextConfiWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double vFontSize = 18;
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 29),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Configurações",
              style: TextStyle(
                  fontSize: vFontSize,
                  fontWeight: FontWeight.bold,
                  color: AppColors.dark),
            ),
          ],
        ),
      ),
    );
  }
}
