import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/editions_page/model/edition_model.dart';
import 'package:piaui_app/app/modules/editions_page/repository/edition_repository.dart';
import 'package:piaui_app/app/shared/downloads/downloads_controller.dart';
import 'package:piaui_app/app/shared/downloads/model/revist_download.dart';

part 'edition_page_controller.g.dart';

@Injectable()
class DownLoadEditionPageController = _DownLoadEditionPageControllerBase
    with _$DownLoadEditionPageController;

abstract class _DownLoadEditionPageControllerBase with Store {
  DownloadsController _downloadsController = DownloadsController();
  EditionRepository _repository;
  List<EditionModel> _listEditonLocal = <EditionModel>[];
  List<EditionModel> _pages = [];

  @observable
  bool isLoading = false;

  @observable
  List<EditionModel> _editionsSiglePage;

  @observable
  List<RevistDownload> _revistsDownloads;

  @observable
  int itemCount = 6;

  @observable
  int _pageCount = 1;

  bool loadPage = false;

  _DownLoadEditionPageControllerBase(this._repository) {
    init();
  }

  init() async {
    isLoading = true;
    /* _listEditonLocal = await _repository.findByPage(_pageCount); */
    _editionsSiglePage = _listEditonLocal.asObservable();
    _revistsDownloads = await _downloadsController.populateList();

    isLoading = false;
  }

  List<EditionModel> get editionsSinglePage {
    return _editionsSiglePage;
  }

  List<RevistDownload> get revistDownloads {
    return _revistsDownloads;
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
