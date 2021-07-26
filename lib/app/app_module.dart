import 'package:dio/dio.dart';
import 'package:piaui_app/app/modules/editions_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/editions_page/edition_page_module.dart';
import 'package:piaui_app/app/modules/editions_page/repository/edition_repository.dart';
import 'package:piaui_app/app/modules/home/home_controller.dart';
import 'package:piaui_app/app/modules/inside_magazine/controller/inside_magazine_controller.dart';
import 'package:piaui_app/app/modules/inside_magazine/inside_magazine_module.dart';
import 'package:piaui_app/app/modules/internal_magazine/controller/internal_magazine_controller.dart';
import 'package:piaui_app/app/modules/internal_magazine/internal_magazine_module.dart';
import 'package:piaui_app/app/modules/internal_magazine/repository/internal_repository.dart';
import 'package:piaui_app/app/modules/magazine_articles/controller/magazine_articles_controller.dart';
import 'package:piaui_app/app/modules/magazine_articles/magazine_articles_module.dart';
import 'package:piaui_app/app/modules/subscribe_now/controller/subscribe_now_controller.dart';
import 'package:piaui_app/app/modules/subscribe_now/subscribe_now_module.dart';
import 'package:piaui_app/app/shared/components/app_bar/login/controller/login_controller.dart';
import 'package:piaui_app/app/shared/components/app_bar/login/login_module.dart';
import 'package:piaui_app/app/shared/components/app_bar/menu/controller/menu_controller.dart';
import 'package:piaui_app/app/shared/components/app_bar/configuration/controller/configuration_controller.dart';
import 'package:piaui_app/app/shared/components/app_bar/menu/menu_module.dart';
import 'package:piaui_app/app/shared/components/app_bar/configuration/configuration_module.dart';
import 'package:piaui_app/app/shared/components/app_bar/search/controller/search_controller.dart';
import 'package:piaui_app/app/shared/components/signature/controller/signature_controller.dart';
import 'package:piaui_app/app/shared/components/signature/signature_module.dart';
import 'package:piaui_app/app/shared/utils/constants.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:piaui_app/app/app_widget.dart';

import 'modules/all_editions_page/controller/edition_page_controller.dart';
import 'modules/all_editions_page/all_edition_page_module.dart';
import 'modules/download_editions_page/controller/edition_page_controller.dart';
import 'modules/download_editions_page/download_edition_page_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => MenuController()),
        Bind((i) => LoginController()),
        Bind((i) => SignatureController()),
        Bind((i) => ConfigController()),
        Bind((i) => SearchController()),
        Bind((i) => SubscribeNowController()),
        Bind((i) => HomeController()),
        Bind((i) => EditionPageController(i.get<EditionRepository>())),
        Bind((i) => AllEditionPageController(i.get<EditionRepository>())),
        Bind((i) => DownLoadEditionPageController(i.get<EditionRepository>())),
        Bind((i) => EditionRepository(i.get<Dio>())),
        Bind((i) => MagazineArticlesController()),
        Bind((i) => InsideMagazineController()),
        Bind((i) =>
            InternalMagazineController(i.get<IntenalMagazineRepository>())),
        Bind((i) => IntenalMagazineRepository(i.get<Dio>())),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: EditionPageModule()),
        ModularRouter('/menu', module: MenuModule()),
        ModularRouter('/login', module: LoginModule()),
        ModularRouter('/signature', module: SignatureModule()),
        ModularRouter('/config', module: ConfigModule()),
        ModularRouter('/editions', module: EditionPageModule()),
        ModularRouter('/logged', module: AllEditionPageModule()),
        ModularRouter('/downloads', module: DownLoadEditionPageModule()),
        ModularRouter('/articles', module: MagazineArticlesModule()),
        ModularRouter('/magazine', module: InsideMagazineModule()),
        ModularRouter('/internal', module: InternalMagazineModule()),
        ModularRouter('/subscribe', module: SubscribeNowModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
