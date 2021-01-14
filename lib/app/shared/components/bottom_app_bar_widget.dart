import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class BottomAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bottomAppBar,
      height: 80,
      child: Align(
        child: ListTile(
            title: Text(
              '1 ano de revista piauí com 52% de desconto!',
              style: TextStyle(color: AppColors.textColorWhite, fontSize: 14),
            ),
            trailing: OutlineButton(
              borderSide: BorderSide(color: AppColors.textColorWhite),
              child: Text(
                'Assine agora',
                style: TextStyle(color: AppColors.textColorWhite),
              ),
              onPressed: () {},
            )),
      ),
    );
  }
}
