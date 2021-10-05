import 'package:flutter_modular/flutter_modular.dart';

import 'controller/configuration_controller.dart';
import 'view/about_us_page.dart';

class AboutUsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ConfigController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => AboutUsPage()),
      ];

  static Inject get to => Inject<AboutUsModule>.of();
}
