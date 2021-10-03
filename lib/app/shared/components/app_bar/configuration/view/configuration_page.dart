import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/shared/components/app_bar/configuration/controller/configuration_controller.dart';
import 'package:piaui_app/app/shared/components/app_bar/configuration/widgets/back_to_menu_widget.dart';
import 'package:piaui_app/app/shared/components/app_bar/configuration/widgets/text_config_widget.dart';
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'package:piaui_app/app/shared/providers/ThemeChanger.dart';
import 'package:provider/provider.dart';

class ConfigPage extends StatefulWidget {
  final String title;
  const ConfigPage({Key key, this.title = "Config"}) : super(key: key);

  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends ModularState<ConfigPage, ConfigController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var darkThemeEnabled = Provider.of<ThemeChanger>(context);
    final double vFontSize = 15;
    final double vBtnHeght = 5;
    return Scaffold(
      appBar: PreferredAppBarWidget(height: 56, close: true, closeCongif: true),
      body: Column(
        children: [
          BackToMenuWidget(),
          TextConfiWidget(),
          Expanded(
            child: Container(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
                children: <Widget>[
                  TextButton(
                    // padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: vBtnHeght),
                      tileColor: Theme.of(context).backgroundColor,
                      title: Padding(
                        padding: const EdgeInsets.only(right: 12, left: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Alterar tamanho da fonte',
                              style: TextStyle(
                                  fontSize: vFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                            ),
                            Image.asset(
                              'assets/images/font-size.png',
                              scale: 0.6,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    // padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: vBtnHeght),
                      tileColor: Theme.of(context).backgroundColor,
                      title: Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ativar modo noturno',
                              style: TextStyle(
                                  fontSize: vFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                            ),
                            Switch(
                                value: darkThemeEnabled.isDark(),
                                onChanged: (status) {
                                  darkThemeEnabled.setDarkStatus(status);
                                })
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
