import 'package:flutter_modular/flutter_modular.dart';
import 'controller/magazine_articles_controller.dart';
import 'view/magazine_articles_page.dart';


class MagazineArticlesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MagazineArticlesController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => MagazineArticlesPage()),
      ];

  static Inject get to => Inject<MagazineArticlesModule>.of();
}
