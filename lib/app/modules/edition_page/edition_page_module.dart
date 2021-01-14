import 'repositories/edition_page_repository.dart';
import 'edition_page_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'edition_page_page.dart';

class EditionPageModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $EditionPageRepository,
        $EditionPageController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => EditionPagePage()),
      ];

  static Inject get to => Inject<EditionPageModule>.of();
}
