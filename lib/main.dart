import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:piaui_app/app/app_module.dart';
import 'package:piaui_app/app/shared/components/app_bar/login/model/auth_user.dart';
import 'package:piaui_app/app/shared/database/database.dart';

Future<Dados> readUser() async {
  var response = await FlutterSession().get("user");
  Dados user;
  if (response == "") {
    user = new Dados();
  } else {
    user = Dados.fromJson(response);
  }

  print(user.nome);
  return user;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Database.initHiveDatabase();
  HttpOverrides.global = new MyHttpOverrides();
  runApp(ModularApp(module: AppModule(await readUser())));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
