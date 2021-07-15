import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'internal_magazine_controller.g.dart';

@Injectable()
class InternalMagazineController = _InternalMagazineControllerBase
    with _$InternalMagazineController;

abstract class _InternalMagazineControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
