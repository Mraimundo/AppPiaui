import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/internal_magazine/view/internal_magazine_page.dart';
import 'package:piaui_app/app/modules/internal_magazine/controller/internal_magazine_controller.dart';
// import 'controller/magazine_articles_controller.dart';

class InternalMagazineModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Bind((i) => InternalMagazineController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => InternalMagazinePage()),
      ];

  static Inject get to => Inject<InternalMagazineModule>.of();
}
