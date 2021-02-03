import 'package:dio/dio.dart';
import 'package:piaui_app/app/modules/edition_page/edition_page_module.dart';
import 'package:piaui_app/app/modules/edition_page/repository/edition_repository.dart';
import 'package:piaui_app/app/modules/home/home_controller.dart';
import 'package:piaui_app/app/modules/menu/controller/menu_controller.dart';
import 'package:piaui_app/app/modules/menu/menu_module.dart';
import 'package:piaui_app/app/shared/utils/constants.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:piaui_app/app/app_widget.dart';

import 'modules/edition_page/controller/edition_page_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => HomeController()),
        Bind((i) => MenuController()),
        Bind((i) => EditionPageController(i.get<EditionRepository>())),
        Bind((i) => EditionRepository(i.get<Dio>())),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: EditionPageModule()),
        ModularRouter('/menu', module: MenuModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
