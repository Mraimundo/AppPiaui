import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/internal_magazine_downloads/view/internal_magazine_page.dart';
// import 'controller/magazine_articles_controller.dart';

class InternalMagazineDownloadsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Bind((i) => InternalMagazineController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => InternalMagazinePage(
                  revist: args.data['revist'],
                  index: args.data['index'],
                )),
      ];

  static Inject get to => Inject<InternalMagazineDownloadsModule>.of();
}
