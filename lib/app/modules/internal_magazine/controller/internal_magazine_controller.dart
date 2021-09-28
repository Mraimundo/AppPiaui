// import 'package:mobx/mobx.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:piaui_app/app/modules/editions_page/model/edition_model.dart';
// import 'package:piaui_app/app/modules/internal_magazine/repository/internal_repository.dart';

// part 'internal_magazine_controller.g.dart';

// @Injectable()
// class InternalMagazineController = _InternalMagazineControllerBase
//     with _$InternalMagazineController;

// abstract class _InternalMagazineControllerBase with Store {
//   IntenalMagazineRepository _repository;
//   List<EditionModel> _listEditonLocal = <EditionModel>[];
//   List<EditionModel> _pages = [];

//   @observable
//   bool isLoading = false;

//   @observable
//   List<EditionModel> _editionsSiglePage;

//   @observable
//   int itemCount = 6;

//   @observable
//   int _pageCount = 1;

//   bool loadPage = false;

//   _InternalMagazineControllerBase(this._repository) {
//     init();
//   }

//   init() async {
//     isLoading = true;
//     // _listEditonLocal = await _repository.findByPage(_pageCount);
//     _editionsSiglePage = _listEditonLocal.asObservable();
//     isLoading = false;
//   }

//   List<EditionModel> get editionsSinglePage {
//     return _editionsSiglePage;
//   }

//   EditionModel get lastEdition {
//     return _editionsSiglePage.first;
//   }

//   List<EditionModel> get editionsMultiPage {
//     _pages = editionsSinglePage;
//     return _pages;
//   }

//   @action
//   nextPage() async {
//     _pageCount += 1;
//     _listEditonLocal.clear();
//     loadPage = true;
//     // _listEditonLocal = await _repository.findByPage(_pageCount);
//     editionsSinglePage.addAll(_listEditonLocal.asObservable());
//     loadPage = false;
//   }
// }
