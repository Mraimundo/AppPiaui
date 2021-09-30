import 'package:flutter_modular/flutter_modular.dart';

import 'controller/menu_controller.dart';
import 'view/menu_user_logged_page.dart';

class MenuUserLoggedModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MenuController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => MenuUserLoggedPage()),
      ];

  static Inject get to => Inject<MenuUserLoggedModule>.of();
}
