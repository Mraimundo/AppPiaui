import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/inside_magazine_download/controller/inside_magazine_controller.dart';
import 'package:piaui_app/app/modules/inside_magazine_download/repository/inside_repository.dart';
import 'package:piaui_app/app/modules/inside_magazine_download/view/inside_magazine_page.dart';

// import 'controller/magazine_articles_controller.dart';
class InsideMagazineDownloadModule extends ChildModule {
  @override
  List<Bind> get binds => [
        /* Bind(
            (i) => InsideMagazineController(i.get<InsideMagazineRepository>())), */
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => InsideMagazinePage(
                  revist: args.data["revist"],
                )),
      ];

  /* static Inject get to => Inject<InsideMagazineDownloadModule>.of(); */
}
