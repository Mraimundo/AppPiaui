import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    double vHeight = MediaQuery.of(context).size.height;
    double vWidth = MediaQuery.of(context).size.width;
    return Material(
        child: Container(
      color: AppColors.backgroundColor,
      height: vHeight * 0.28,
      width: vWidth / 1.5,
      child: Padding(
        padding: const EdgeInsets.only(top: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: vHeight * 0.06,
              width: vWidth / 1.10,
              // margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors.borderColorForm, // set border color
                  width: 0.8,
                ), // set border width
                // set rounded corner radius
              ),
              child: Align(
                child: TextField(
                  onChanged: (text) {
                    email = text;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: vHeight * 0.06,
              width: vWidth / 1.10,
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors.borderColorForm, // set border color
                  width: 0.8,
                ), // set border width
                // set rounded corner radius
              ),
              child: TextField(
                onChanged: (text) {
                  password = text;
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Senha',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              margin: EdgeInsets.only(left: 0),
              child: TextButton(
                onPressed: () {},
                child: Container(
                  color: AppColors.orangePiaui,
                  height: vHeight * 0.06,
                  width: vWidth / 2.5,
                  child: Align(
                    child: Text(
                      'Entrar',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    // alignment: Alignment.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
