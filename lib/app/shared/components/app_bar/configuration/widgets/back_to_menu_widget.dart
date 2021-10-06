import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackToMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 31),
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/arrow-left.png',
                  scale: 1.4,
                ),
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
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
