import 'package:flutter/cupertino.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class MoreEditionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 80,
            color: AppColors.appBackground,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                child: Text('Mais edições'),
                alignment: Alignment.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
