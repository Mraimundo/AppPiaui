import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/edition_page/edition_page.dart';

class EditionPageModule extends ChildModule {
  @override
  List<Bind> get binds => [
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => EditionPage()),
      ];

  static Inject get to => Inject<EditionPageModule>.of();
}
