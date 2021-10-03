import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/editions_page/model/edition_model.dart';
import 'package:piaui_app/app/modules/editions_page/repository/edition_repository.dart';
import 'package:piaui_app/app/shared/downloads/downloads_controller.dart';
import 'package:piaui_app/app/shared/downloads/model/revist_download.dart';

part 'edition_page_controller.g.dart';

/* @Injectable() */
class DownLoadEditionPageController = _DownLoadEditionPageControllerBase
    with _$DownLoadEditionPageControllerBase;

abstract class _DownLoadEditionPageControllerBase with Store {
  DownloadsController _downloadsController = DownloadsController();

  @observable
  bool isLoading = false;

  @observable
  List<RevistDownload> _revistsDownloads;

  bool loadPage = false;

  _DownLoadEditionPageControllerBase() {
    init();
  }

  init() async {
    isLoading = true;

    _revistsDownloads = await _downloadsController.populateList();

    isLoading = false;
  }

  List<RevistDownload> get revistDownloads {
    return _revistsDownloads;
  }

  realaod() async {
    loadPage = true;
    _revistsDownloads = await _downloadsController.populateList();
    loadPage = false;
  }
}
