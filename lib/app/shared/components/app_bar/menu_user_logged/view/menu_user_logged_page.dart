import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:piaui_app/app/shared/components/app_bar/menu/controller/menu_controller.dart';
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';
import 'package:piaui_app/app/shared/components/complete_download/complete_download.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

Future<void> cleanUser() async {
  await FlutterSession().set("user", "");
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
    final double vBtnHeght = 3;
    return Scaffold(
      appBar: PreferredAppBarWidget(height: 56),
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
                                  'MINHA ASSINATURA',
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
                  // TextButton(
                  //   onPressed: () {
                  //     Modular.to.pushNamed('/signature');
                  //   },
                  //   child: ListTile(
                  //     title: Padding(
                  //       padding: const EdgeInsets.only(right: 15, left: 15),
                  //       child: Column(
                  //         children: [
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //             children: [
                  //               Container(
                  //                 width: 20,
                  //                 height: 20,
                  //                 child: Align(
                  //                   alignment: Alignment.topCenter,
                  //                   child: Text(
                  //                     '3',
                  //                     textScaleFactor: 2,
                  //                     style: TextStyle(
                  //                       fontSize: 8,
                  //                       color: AppColors.textColorWhite,
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(50),
                  //                   color: AppColors.orangePiaui,
                  //                 ),
                  //               ),
                  //               Text(
                  //                 'MINHAS NOTIFICAÇÕES',
                  //                 style: TextStyle(
                  //                     fontSize: vFontSize,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: AppColors.dark),
                  //               ),
                  //               Image.asset(
                  //                 'assets/images/arrow_menu.png',
                  //                 width: 20,
                  //                 height: 12,
                  //               ),
                  //             ],
                  //           ),
                  //           Container(
                  //             height: 25,
                  //             decoration: BoxDecoration(
                  //               border: Border(
                  //                 bottom: BorderSide(
                  //                   color: AppColors.internalBorderColor,
                  //                   width: 1,
                  //                 ),
                  //               ),
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => CompleteDownload(),
                      );
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
                                  'PROBLEMA COM ASSINATURA',
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
                    // padding: EdgeInsets.zero,
                    onPressed: () async {
                      await cleanUser();
                      /* Modular.to.pushNamed('/login'); */
                      SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
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
