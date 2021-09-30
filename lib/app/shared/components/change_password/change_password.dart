import 'package:flutter_modular/flutter_modular.dart';

import 'controller/menu_controller.dart';
import 'view/change_password.dart';

class ChangePassWordModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MenuController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ChangePasswordPage()),
      ];

  static Inject get to => Inject<ChangePassWordModule>.of();
}
