import 'package:flutter/material.dart';
import 'package:piaui_app/app/modules/all_editions_page/view/all_edition_page.dart';
import 'package:piaui_app/app/shared/components/app_bar/login/model/auth_user.dart';
import 'package:piaui_app/app/shared/components/app_bar/login/widgets/login_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  Dados _user;

  Dados get user => _user;

  void setUser(BuildContext context, Dados user) {
    if (user != null) {
      _user = user;
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => AllEditionPage(user: _user)),
          (Route<dynamic> route) => false);

      // Modular.to.pushNamed('/logged');
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoginWidget(),
      ));
      // Modular.to.pushNamed('/editions');
    }
  }

  Future<void> saveUser(var user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    if (instance.containsKey("user")) {
      // final json = instance.get("user") as String;
      // setUser(context, Dados.fromJson(json));
      return;
    } else {
      setUser(context, null);
    }
  }
}
