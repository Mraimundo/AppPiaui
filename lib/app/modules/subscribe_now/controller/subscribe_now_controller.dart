import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'subscribe_now_controller.g.dart';

@Injectable()
class SubscribeNowController = _SubscribeNowControllerBase
    with _$SubscribeNowController;

abstract class _SubscribeNowControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
