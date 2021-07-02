import 'package:flutter_modular/flutter_modular.dart';

import 'controller/signature_controller.dart';
import 'view/signature_page.dart';

class SignatureModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SignatureController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => SignaturePage()),
      ];

  static Inject get to => Inject<SignatureModule>.of();
}
