import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/edition_page/model/edition_model.dart';
import 'package:piaui_app/app/modules/edition_page/repository/edition_repository.dart';

part 'edition_page_controller.g.dart';

@Injectable()
class EditionPageController = _EditionPageControllerBase
    with _$EditionPageController;

abstract class _EditionPageControllerBase with Store {
  EditionRepository _repository;
  List<EditionModel> _listEditonLocal = <EditionModel>[];
  List<EditionModel> _pages = [];

  @observable
  bool isLoading = false;

  @observable
  List<EditionModel> _editionsSiglePage;

  @observable
  int itemCount = 6;

  @observable
  int _pageCount = 1;

  bool loadPage = false;

  _EditionPageControllerBase(this._repository) {
    init();
  }

  init() async {
    isLoading = true;
    _listEditonLocal = await _repository.findByPage(_pageCount);
    _editionsSiglePage = _listEditonLocal.asObservable();
    isLoading = false;
  }

  List<EditionModel> get editionsSinglePage {
    return _editionsSiglePage;
  }

  EditionModel get lastEdition {
    return _editionsSiglePage.first;
  }

  List<EditionModel> get editionsMultiPage {
    _pages = editionsSinglePage;
    return _pages;
  }

  @action
  nextPage() async {
    _pageCount += 1;
    _listEditonLocal.clear();
    loadPage = true;
    _listEditonLocal = await _repository.findByPage(_pageCount);
    editionsSinglePage.addAll(_listEditonLocal.asObservable());
    loadPage = false;
  }
}
