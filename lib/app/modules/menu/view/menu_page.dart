import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/menu/controller/menu_controller.dart';
import 'package:piaui_app/app/shared/components/bottom_app_bar_widget.dart';
import 'package:piaui_app/app/shared/components/preferred_app_bar_widget.dart';
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
    final double vFontSize = 30;
    final double vGap = 20;
    final double vBtnHeght = 30;
    return Scaffold(
      appBar: PreferredAppBarWidget(height: 60),
      body: Column(
        children: [
          BottomAppBarWidget(),
          Expanded(
            child: Container(
              color: AppColors.appBackground,
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
                children: <Widget>[
                  FlatButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.2,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.zero),
                      child: ListTile(
                        minVerticalPadding: vBtnHeght,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/icon_revista.png',
                                scale: 2.5),
                            SizedBox(width: vGap),
                            Text(
                              'Minhas revistas',
                              style: TextStyle(
                                  fontSize: vFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.dark),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  FlatButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.2,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.zero),
                      child: ListTile(
                        minVerticalPadding: vBtnHeght,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/icon_profile.png',
                                scale: 2.5),
                            SizedBox(width: vGap),
                            Text(
                              'Sou assinante',
                              style: TextStyle(
                                  fontSize: vFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.dark),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  FlatButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.2,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.zero),
                      child: ListTile(
                        minVerticalPadding: vBtnHeght,
                        tileColor: AppColors.bottomAppBar,
                        title: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'CADASTRE-SE',
                            style: TextStyle(
                                fontSize: vFontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
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
