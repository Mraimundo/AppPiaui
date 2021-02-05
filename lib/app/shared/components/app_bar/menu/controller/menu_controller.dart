import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'menu_controller.g.dart';

@Injectable()
class MenuController = _MenuControllerBase with _$MenuController;

abstract class _MenuControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
