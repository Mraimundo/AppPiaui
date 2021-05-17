import 'package:dio/dio.dart';
import 'package:piaui_app/app/modules/editions_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/editions_page/edition_page_module.dart';
import 'package:piaui_app/app/modules/editions_page/repository/edition_repository.dart';
import 'package:piaui_app/app/modules/home/home_controller.dart';
import 'package:piaui_app/app/modules/magazine_articles/controller/magazine_articles_controller.dart';
import 'package:piaui_app/app/modules/magazine_articles/magazine_articles_module.dart';
import 'package:piaui_app/app/modules/subscribe_now/controller/subscribe_now_controller.dart';
import 'package:piaui_app/app/modules/subscribe_now/subscribe_now_module.dart';
import 'package:piaui_app/app/shared/components/app_bar/menu/controller/menu_controller.dart';
import 'package:piaui_app/app/shared/components/app_bar/menu/menu_module.dart';
import 'package:piaui_app/app/shared/components/app_bar/search/controller/search_controller.dart';
import 'package:piaui_app/app/shared/utils/constants.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:piaui_app/app/app_widget.dart';


class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => MenuController()),
        Bind((i) => SearchController()),
        Bind((i) => SubscribeNowController()),
        Bind((i) => HomeController()),
        Bind((i) => EditionPageController(i.get<EditionRepository>())),
        Bind((i) => EditionRepository(i.get<Dio>())),
        Bind((i) => MagazineArticlesController()),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: EditionPageModule()),
        ModularRouter('/menu', module: MenuModule()),
        ModularRouter('/editions', module: EditionPageModule()),
        ModularRouter('/articles', module: MagazineArticlesModule()),
        ModularRouter('/subscribe', module: SubscribeNowModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
