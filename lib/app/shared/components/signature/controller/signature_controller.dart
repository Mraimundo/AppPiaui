import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'signature_controller.g.dart';

@Injectable()
class SignatureController = _SignatureControllerBase with _$SignatureController;

abstract class _SignatureControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
