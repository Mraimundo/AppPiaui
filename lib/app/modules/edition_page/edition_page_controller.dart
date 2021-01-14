import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'edition_page_controller.g.dart';

@Injectable()
class EditionPageController = _EditionPageControllerBase
    with _$EditionPageController;

abstract class _EditionPageControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
