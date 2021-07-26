import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/shared/components/app_bar/login/model/auth_user.dart';
import 'package:piaui_app/app/shared/components/app_bar/login/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel _user;

  UserModel get user => _user;

  void setUser(BuildContext context, UserModel user) {
    if (user != null) {
      _user = user;
      Modular.to.pushNamed('/logged');
    } else {
      Modular.to.pushNamed('/editions');
    }
  }

  // Future<void> saveUser(var user) async {
  //   final instance = await SharedPreferences.getInstance();
  //   await instance.setString("user", user.toJson());
  //   return;
  // }

  // Future<void> currentUser(BuildContext context) async {
  //   final instance = await SharedPreferences.getInstance();
  //   if (instance.containsKey("user")) {
  //     final json = instance.get("user") as String;
  //     setUser(context, UserModel.fromJson(json));
  //     return;
  //   } else {
  //     setUser(context, null);
  //   }
  // }
}
