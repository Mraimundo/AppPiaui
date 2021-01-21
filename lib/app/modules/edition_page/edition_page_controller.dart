import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/edition_page/repository/edition_repository.dart';

part 'edition_page_controller.g.dart';

@Injectable()
class EditionPageController = _EditionPageControllerBase
    with _$EditionPageController;

abstract class _EditionPageControllerBase with Store {

  EditionRepository repository;

  @observable
  ObservableFuture editions;

  _EditionPageControllerBase(this.repository);

  init() {
    editions = repository.findAll().asObservable();
  }

  
}
