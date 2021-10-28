import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:piaui_app/app/shared/components/app_bar/menu/controller/menu_controller.dart';
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> cleanUser() async {
  await FlutterSession().set("user", "");
}

_launchProblem() async {
  var url = 'http://revistapiaui.com.br/politica-de-privacidade';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class MenuUserLoggedPage extends StatefulWidget {
  final String title;
  const MenuUserLoggedPage({Key key, this.title = "Menu"}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends ModularState<MenuUserLoggedPage, MenuController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    final double vFontSize = 15;
    return Scaffold(
      appBar: PreferredAppBarWidget(height: 56, close: true),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
                children: <Widget>[
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      Modular.to.pushNamed("/config");
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
                                      color: Theme.of(context).cardColor),
                                ),
                                Image.asset(
                                  'assets/images/Seta.png',
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
                      Modular.to.pushNamed('/about_us');
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
                                      color: Theme.of(context).cardColor),
                                ),
                                Image.asset(
                                  'assets/images/Seta.png',
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
                      Modular.to.pushNamed('/problem_subscription');
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
                                  'PROBLEMA COM ASSINATURA',
                                  style: TextStyle(
                                      fontSize: vFontSize,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).cardColor),
                                ),
                                Image.asset(
                                  'assets/images/Seta.png',
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
                      _launchProblem();
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
                                  'POLÍTICA DE PRIVACIDADE',
                                  style: TextStyle(
                                      fontSize: vFontSize,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).cardColor),
                                ),
                                Image.asset(
                                  'assets/images/Seta.png',
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
                    // padding: EdgeInsets.zero,
                    onPressed: () async {
                      await cleanUser();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/editions', (Route<dynamic> route) => false);
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
                                  'SAIR',
                                  style: TextStyle(
                                      fontSize: vFontSize,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.orangePiaui),
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
