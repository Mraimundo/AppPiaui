import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'app_controller.g.dart';

@Injectable()
class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  @observable
  bool menuPressed = false;

  @computed
  bool get menuStatus => menuPressed;

  @action
  menu() {
    menuPressed = !menuPressed;
  }
}
