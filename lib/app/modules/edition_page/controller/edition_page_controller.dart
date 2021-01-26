import 'package:flutter/widgets.dart';
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

  @observable
  bool isLoading = false;

  @observable
  List<EditionModel> _editions;

  @observable
  int itemCount = 6;

  _EditionPageControllerBase(this._repository) {
    init();
  }

  init() async {
    isLoading = true;
    _listEditonLocal = await _repository.findAll();
    _editions = _listEditonLocal.asObservable();
    loadImages();
    isLoading = false;
  }

  List<EditionModel> get editions {
    return _editions;
  }

  EditionModel get lastEdition {
    return _editions.first;
  }

  List<Image> images = <Image>[];

  List<Image> loadImages() {
    for (var i = 0; i < _editions.length; i++) {
      bool imgLoaded = false;
      Image img;
      img = Image.network(
        _editions[i].acf.capa.url,
        fit: BoxFit.fill,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent loadingProgress) {
          if (loadingProgress == null) {
            imgLoaded = true;
            return child;
          }
          return Container();
        },
      );
      if (imgLoaded) {
        images.add(img);
      }
    }
    return images;
  }
}
