import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'configuration_controller.g.dart';

@Injectable()
class ConfigurationController = _ConfigurationControllerBase
    with _$ConfigurationController;

abstract class _ConfigurationControllerBase with Store {
  @observable
  bool checkedPressed = false;

  @computed
  bool get checkedStatus => checkedPressed;

  @action
  checked() {
    checkedPressed = !checkedPressed;
  }
}
