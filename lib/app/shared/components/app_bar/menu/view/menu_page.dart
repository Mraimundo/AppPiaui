import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/shared/components/app_bar/menu/controller/menu_controller.dart';
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class MenuPage extends StatefulWidget {
  final String title;
  const MenuPage({Key key, this.title = "Menu"}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends ModularState<MenuPage, MenuController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    final double vFontSize = 15;
    final double vBtnHeght = 5;
    return Scaffold(
      appBar: PreferredAppBarWidget(height: 56, close: true),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: AppColors.backgroundColor,
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Modular.to.pushNamed('/login');
                      // Modular.to.pushNamed('/problem_subscription');
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
                                  'FAÇA SEU LOGIN',
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
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      Modular.to.pushNamed('/signature');
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
                                  'CONFIGURAÇÕES',
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
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      Modular.to.pushNamed('/change_password');
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
                                  'SOBRE NÓS',
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
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: () {},
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'POLÍTICA DE PRIVACIDADE',
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
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: () {},
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ASSINAR',
                                  style: TextStyle(
                                    fontSize: vFontSize,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.orangePiaui,
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/arrow_sair.png',
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
