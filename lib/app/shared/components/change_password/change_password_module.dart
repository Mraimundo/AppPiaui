import 'package:flutter_modular/flutter_modular.dart';

import 'controller/configuration_controller.dart';
import 'view/change_password_page.dart';

class ChangePasswordModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ConfigController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ChangePasswordPage()),
      ];

  static Inject get to => Inject<ChangePasswordModule>.of();
}
