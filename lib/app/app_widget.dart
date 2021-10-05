import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'package:piaui_app/app/shared/providers/ThemeChanger.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool darkThemeEnabled = Provider.of<ThemeChanger>(context).isDark();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: ThemeData(
          fontFamily: 'Piaui',
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
          primaryColorDark: AppColors.backgroundColorLastEdition,
          backgroundColor: AppColors.appBar,
          primaryColor: AppColors.textColorNormal,
          primaryColorLight: AppColors.boxColor,
          cardColor: AppColors.textColorArticle,
          bottomAppBarColor: AppColors.cardColor),
      initialRoute: '/',
      darkTheme: ThemeData(
          primaryColorDark: AppColors.dark,
          brightness: Brightness.dark,
          primarySwatch: Colors.blueGrey,
          primaryColor: Colors.white,
          backgroundColor: AppColors.dark,
          primaryColorLight: AppColors.dark,
          bottomAppBarColor: AppColors.dark,
          cardColor: Colors.grey,
          fontFamily: 'Piaui'),
      themeMode: darkThemeEnabled ? ThemeMode.dark : ThemeMode.light,
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
