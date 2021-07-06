import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'inside_magazine_controller.g.dart';

@Injectable()
class InsideMagazineController = _InsideMagazineControllerBase
    with _$InsideMagazineController;

abstract class _InsideMagazineControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
