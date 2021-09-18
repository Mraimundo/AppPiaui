import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/app_module.dart';

void main() async {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(ModularApp(module: AppModule()));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
