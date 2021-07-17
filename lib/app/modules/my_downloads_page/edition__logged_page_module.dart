import 'package:flutter_modular/flutter_modular.dart';

import 'view/edition_logged_page.dart';

class EditionLoggedPageModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => EditionLoggedPage()),
      ];

  static Inject get to => Inject<EditionLoggedPageModule>.of();
}
