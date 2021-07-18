import 'package:flutter_modular/flutter_modular.dart';

import 'view/download_edition_page.dart';

class DownLoadEditionPageModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => DownLoadEditionPage()),
      ];

  static Inject get to => Inject<DownLoadEditionPageModule>.of();
}
