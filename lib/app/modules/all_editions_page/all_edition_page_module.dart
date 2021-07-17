import 'package:flutter_modular/flutter_modular.dart';

import 'view/all_edition_page.dart';

class AllEditionPageModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => AllEditionPage()),
      ];

  static Inject get to => Inject<AllEditionPageModule>.of();
}
