import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'magazine_articles_controller.g.dart';

@Injectable()
class MagazineArticlesController = _MagazineArticlesControllerBase
    with _$MagazineArticlesController;

abstract class _MagazineArticlesControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
