import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/editions_page/repository/edition_repository.dart';
import 'package:piaui_app/app/modules/inside_magazine_logged/model/inside_magazine_logged.dart';

part 'inside_magazine_logged_controller.g.dart';

@Injectable()
class InsideMagazineLoggeController = _InsideMagazineControllerBase
    with _$InsideMagazineLoggeController;

abstract class _InsideMagazineControllerBase with Store {
  EditionRepository _repository;
  List<InsideMagazineLoggedModel> _listEditonLocal =
      <InsideMagazineLoggedModel>[];
  List<InsideMagazineLoggedModel> _pages = [];

  @observable
  bool isLoading = false;

  @observable
  List<InsideMagazineLoggedModel> _editionsSiglePage;

  @observable
  int itemCount = 6;

  @observable
  int _pageCount = 1;

  bool loadPage = false;

  _InsideMagazineControllerBase(this._repository) {
    init();
  }

  init() async {
    isLoading = true;
    // _listEditonLocal = await _repository.findByPage(_pageCount);
    _editionsSiglePage = _listEditonLocal.asObservable();
    isLoading = false;
  }

  List<InsideMagazineLoggedModel> get editionsSinglePage {
    return _editionsSiglePage;
  }

  InsideMagazineLoggedModel get lastEdition {
    return _editionsSiglePage.first;
  }

  List<InsideMagazineLoggedModel> get editionsMultiPage {
    _pages = editionsSinglePage;
    return _pages;
  }

  @action
  nextPage() async {
    _pageCount += 1;
    _listEditonLocal.clear();
    loadPage = true;
    // _listEditonLocal = await _repository.findByPage(_pageCount);
    editionsSinglePage.addAll(_listEditonLocal.asObservable());
    loadPage = false;
  }
}
