import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onTap;
  const SocialLoginButton({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double vHeight = MediaQuery.of(context).size.height;
    double vWidth = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: onTap,
        child: Container(
          height: 56,
          width: vWidth / 1.5,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            border: Border.fromBorderSide(
              BorderSide(color: AppColors.backgroundColor),
            ),
          ),
          child: Row(children: [
            Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/google.png'),
                    SizedBox(
                      width: 16,
                    ),
                  ],
                )),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Acessar com Google",
                  )
                ],
              ),
            )
          ]),
        ));
  }
}
