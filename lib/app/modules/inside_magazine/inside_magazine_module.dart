import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/inside_magazine/controller/inside_magazine_controller.dart';
import 'package:piaui_app/app/modules/inside_magazine/repository/inside_repository.dart';
import 'package:piaui_app/app/modules/inside_magazine/view/inside_magazine_page.dart';
// import 'controller/magazine_articles_controller.dart';

class InsideMagazineModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => InsideMagazineController(i.get<MateriaRepository>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => InsideMagazinePage(url: args.data['url'])),
      ];

  static Inject get to => Inject<InsideMagazineModule>.of();
}
