import 'package:flutter/cupertino.dart';

class BackToMenuWidget extends StatelessWidget {
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
                "Voltar para menu",
                // style: TextStyles.buttonGray,
              ),
            ],
          )
        ],
      ),
    );
  }
}
