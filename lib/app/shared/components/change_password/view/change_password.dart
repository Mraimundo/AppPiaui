import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/shared/components/app_bar/menu/controller/menu_controller.dart';
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';
import 'package:piaui_app/app/shared/components/change_password/widgets/back_to_menu_widget.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class ChangePasswordPage extends StatefulWidget {
  final String title;
  const ChangePasswordPage({Key key, this.title = "Menu"}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends ModularState<ChangePasswordPage, MenuController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    final double vFontSize = 15;
    final double vBtnHeght = 3;
    return Scaffold(
      appBar: PreferredAppBarWidget(height: 56),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          BackToMenuWidget(
            onTap: () {
              Modular.to.pushNamed('/logged');
            },
          ),
          Text('Minha conta'),
          Expanded(
            child: Container(
              color: AppColors.backgroundColor,
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      // Modular.to.pushNamed('/login');
                    },
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'TESTANDO AQUI MAS UMA VEZ',
                                  style: TextStyle(
                                      fontSize: vFontSize,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.dark),
                                ),
                                Image.asset(
                                  'assets/images/arrow_menu.png',
                                  width: 20,
                                  height: 12,
                                ),
                              ],
                            ),
                            Container(
                              height: 25,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColors.internalBorderColor,
                                    width: 1,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
