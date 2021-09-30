import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackToMenuWidget extends StatelessWidget {
  final VoidCallback onTap;
  const BackToMenuWidget({Key key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
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
      ),
    );
  }
}
