import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class TextHasNoSignatureWidget extends StatelessWidget {
  final VoidCallback onTap;
  const TextHasNoSignatureWidget({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Text(
          'Bem-vindo à piauí, Tiago.',
          style: TextStyle(
            height: 1.3,
            fontFamily: 'Piaui',
            fontSize: 17.5,
            fontWeight: FontWeight.bold,
            color: AppColors.textColorNormal,
          ),
        ),
      ),
    );
  }
}
