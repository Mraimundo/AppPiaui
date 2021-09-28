import 'package:flutter/material.dart';
import 'package:piaui_app/app/app_widget.dart';
import 'package:piaui_app/app/shared/components/app_bar/configuration/widgets/back_to_menu_widget.dart';
import 'package:piaui_app/app/shared/components/app_bar/configuration/widgets/night_mode.dart';
import 'package:piaui_app/app/shared/components/app_bar/configuration/widgets/text_config_widget.dart';
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class ConfigPage extends StatelessWidget {
  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);
  @override
  Widget build(BuildContext context) {
    final double vFontSize = 15;
    final double vBtnHeght = 5;
    return Scaffold(
      appBar: PreferredAppBarWidget(height: 56),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          BackToMenuWidget(),
          TextConfiWidget(),
          Expanded(
            child: Container(
              color: AppColors.backgroundColor,
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
                children: <Widget>[
                  TextButton(
                    // padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: vBtnHeght),
                      tileColor: AppColors.appBar,
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
                                  color: AppColors.dark),
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
                    onPressed: () {
                      AppWidget.themeNotifier.value =
                          AppWidget.themeNotifier.value == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light;
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
                              'Ativar modo noturno',
                              style: TextStyle(
                                  fontSize: vFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.dark),
                            ),
                            Image.asset('assets/images/night-mode.png',
                                scale: 0.6),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // NightMode(),
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
