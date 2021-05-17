import 'package:flutter_modular/flutter_modular.dart';

import 'view/edition_page.dart';

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
