import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/internal_magazine/view/internal_magazine_page.dart';
// import 'controller/magazine_articles_controller.dart';

class InternalMagazineModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Bind((i) => InternalMagazineController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => InternalMagazinePage(
                  idMateria: args.data['idMateria'].toString(),
                  edition: args.data['edition'].toString(),
                  imagemUrl: args.data['imagemUrl'].toString(),
                  imagemAlt: args.data['imagemAlt'].toString(),
                )),
      ];

  static Inject get to => Inject<InternalMagazineModule>.of();
}
