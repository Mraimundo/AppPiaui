import 'package:flutter_modular/flutter_modular.dart';
// import 'package:piaui_app/app/modules/inside_magazine/controller/inside_magazine_controller.dart';
// import 'package:piaui_app/app/modules/inside_magazine_logged/controller/inside_magazine_logged_controller.dart';
import 'package:piaui_app/app/modules/inside_magazine_logged/view/inside_magazine_page.dart';
// import 'controller/magazine_articles_controller.dart';

class InsideMagazineLoggedModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => InsideMagazineLoggedPage()),
      ];

  static Inject get to => Inject<InsideMagazineLoggedModule>.of();
}
