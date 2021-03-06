import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class TextConfiWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double vFontSize = 18;
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 22, top: 29, right: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Configurações",
              style: TextStyle(
                  fontSize: vFontSize,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).cardColor),
            ),
            Container(
              height: 25,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.internalBorderColor,
                    width: 1,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
