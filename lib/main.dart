import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:piaui_app/app/app_module.dart';
import 'package:piaui_app/app/shared/components/app_bar/login/model/auth_user.dart';
import 'package:piaui_app/app/shared/database/database.dart';

Future<Dados> readUser() async {
  if (await FlutterSession().get("user") == null) {
    await FlutterSession().set("user", "");
  }
  if (await FlutterSession().get("date") == null) {
    await FlutterSession().set("date", "");
  }
  var response = await FlutterSession().get("user");
  /* var dataLogin = await FlutterSession().get("date"); */

  Dados user;
  if (response == "") {
    user = new Dados();
  } else {
    /* final dataSplit = dataLogin.toString().split(" ")[0].split("-");
    final data = DateTime(int.parse(dataSplit[0]), int.parse(dataSplit[1]),
        int.parse(dataSplit[2]));
    final today = DateTime.now();
    final difference = today.difference(data).inDays; */

    user = Dados.fromJson(response);

    /* if (difference > 7) {
      user = new Dados();
      await FlutterSession().set("user", "");
      await FlutterSession().set("date", "");
    } */
  }

  return user;
}

Future<bool> testeInternet() async {
  bool res;
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      res = true;
    }
  } on SocketException catch (_) {
    res = false;
  }
  return res;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Database.initHiveDatabase();
  HttpOverrides.global = new MyHttpOverrides();
  runApp(
      ModularApp(module: AppModule(await readUser(), await testeInternet())));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
