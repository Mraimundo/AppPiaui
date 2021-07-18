import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class BorderTopWidget extends StatelessWidget {
  const BorderTopWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.internalBorderColor, width: 0.9),
        ),
      ),
    );
  }
}
