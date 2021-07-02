import 'package:flutter/cupertino.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class BackToHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 31),
      child: Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/arrow-left.png'),
              SizedBox(
                width: 16,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Voltar para início",
                // style: TextStyles.buttonGray,
              ),
            ],
          )
        ],
      ),
    );
  }
}
