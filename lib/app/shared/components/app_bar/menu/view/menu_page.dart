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
                    },
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: vBtnHeght),
                      tileColor: AppColors.appBar,
                      title: Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Faça seu login',
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
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    // padding: EdgeInsets.zero,
                    onPressed: () {
                      Modular.to.pushNamed('/signature');
                    },
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: vBtnHeght),
                      tileColor: AppColors.appBar,
                      title: Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Configurações',
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
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    // padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: vBtnHeght),
                      tileColor: AppColors.appBar,
                      title: Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sobre nós',
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
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    // padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: vBtnHeght),
                      tileColor: AppColors.appBar,
                      title: Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Política de privacidade',
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
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    // padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: vBtnHeght),
                      tileColor: AppColors.orangePiaui,
                      title: Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Assinar',
                              style: TextStyle(
                                  fontSize: vFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Image.asset(
                              'assets/images/arrow-sign.png',
                              width: 20,
                              height: 12,
                            ),
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
