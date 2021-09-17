import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class SelectYearWidget extends StatelessWidget {
  const SelectYearWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: AppColors.internalBorderColor,
              width: 0.9,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Expanded(
            flex: 1,
            child: Row(
              children: [
                Text(
                  'Ano',
                  style: TextStyle(
                    fontFamily: 'Palatino',
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: AppColors.dark,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.textColorBlack,
                  size: 22,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
