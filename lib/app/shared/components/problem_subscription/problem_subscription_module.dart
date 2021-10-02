import 'package:flutter_modular/flutter_modular.dart';

import 'controller/configuration_controller.dart';
import 'view/problem_subscription_page.dart';

class ProblemSubscriptionModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ConfigController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ProblemSubscriptionPage()),
      ];

  static Inject get to => Inject<ProblemSubscriptionModule>.of();
}
