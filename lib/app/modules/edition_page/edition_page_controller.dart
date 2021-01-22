import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/edition_page/models/edition_model.dart';
import 'package:piaui_app/app/modules/edition_page/repository/edition_repository.dart';

part 'edition_page_controller.g.dart';

@Injectable()
class EditionPageController = _EditionPageControllerBase
    with _$EditionPageController;

abstract class _EditionPageControllerBase with Store {
  EditionRepository repository;
  List<EditionModel> _listEditonLocal = <EditionModel>[];

  @observable
  bool isLoading = false;

  @observable
  List<EditionModel> _editions;

  _EditionPageControllerBase(this.repository) {
    init();
  }

  init() async {
    isLoading = true;
    _listEditonLocal = await repository.findAll();
    _editions = _listEditonLocal.asObservable();
    isLoading = false;
  }

  List<EditionModel> get editions {
    return _editions;
  }

  EditionModel get firstEdition {
    return _editions.first;
  }
}
