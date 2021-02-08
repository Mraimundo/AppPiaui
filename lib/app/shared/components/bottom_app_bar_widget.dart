import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class BottomAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.orangePiaui,
      height: 80,
      child: Align(
        child: ListTile(
            title: Visibility(
              visible:
                  MediaQuery.of(context).orientation == Orientation.portrait,
              child: Text(
                '1 ano de revista piauí com 52% de desconto!',
                style: TextStyle(color: AppColors.textColorWhite, fontSize: 17),
              ),
              replacement: Text(
                '1 ano de revista piauí com 52% de desconto!',
                style: TextStyle(color: AppColors.textColorWhite, fontSize: 36),
              ),
            ),
            trailing: OutlineButton(
              borderSide: BorderSide(color: AppColors.textColorWhite),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Text(
                'Assine agora',
                style: TextStyle(
                    color: AppColors.textColorWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              onPressed: () {
                Modular.to.pushNamed('/subscribe');
              },
            )),
      ),
    );
  }
}
