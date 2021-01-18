import 'package:flutter/cupertino.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class ReturnLibraryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 60,
            color: AppColors.appBackground,
            child: Align(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Voltar para a biblioteca de revistas'),
              ),
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
      ],
    );
  }
}
