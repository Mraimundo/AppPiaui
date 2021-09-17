// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:piaui_app/app/modules/all_editions_page/view/all_edition_page.dart';
// import 'package:piaui_app/app/shared/components/app_bar/login/model/google_user.dart';

// class AuthController {
//   LoginModel _user;

//   LoginModel get user => _user;

//   void setUser(BuildContext context, LoginModel user) {
//     if (user != null) {
//       _user = user;
//      Navigator.of(context).pushReplacement(MaterialPageRoute(
//       builder: (context) => AllEditionPage(),
//       ));
//     } else {
//       Navigator.of(context).pushReplacement(MaterialPageRoute(
//       builder: (context) => AllEditionPage(),
//       ));
//     }
//   }

//   Future<void> saveUser(var user) async {
//     final instance = await SharedPreferences.getInstance();
//     await instance.setString("user", user.toJson());
//     return;
//   }

//   Future<void> currentUser(BuildContext context) async {
//     final instance = await SharedPreferences.getInstance();
//     if (instance.containsKey("user")) {
//       final json = instance.get("user") as String;
//       setUser(context, LoginModel.fromJson(json));
//       return;
//     } else {
//       setUser(context, null);
//     }
//   }
// }
