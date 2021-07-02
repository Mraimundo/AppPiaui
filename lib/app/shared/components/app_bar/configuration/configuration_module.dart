import 'package:flutter_modular/flutter_modular.dart';

import 'controller/configuration_controller.dart';
import 'view/configuration_page.dart';

class ConfigModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ConfigController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => ConfigPage()),
      ];

  static Inject get to => Inject<ConfigModule>.of();
}
