import 'package:flutter_modular/flutter_modular.dart';
import 'controller/subscribe_now_controller.dart';
import 'view/subscribe_now_page.dart';

class SubscribeNowModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SubscribeNowController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => SubscribeNowPage()),
      ];

  static Inject get to => Inject<SubscribeNowModule>.of();
}
