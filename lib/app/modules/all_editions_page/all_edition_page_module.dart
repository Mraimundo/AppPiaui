import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/shared/components/app_bar/login/model/auth_user.dart';

import 'view/all_edition_page.dart';

class AllEditionPageModule extends ChildModule {
  final Dados user;
  final bool conected;

  AllEditionPageModule(this.user, this.conected);

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => AllEditionPage(user: user, conected: conected)),
      ];

  static Inject get to => Inject<AllEditionPageModule>.of();
}
