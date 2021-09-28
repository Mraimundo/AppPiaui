import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/inside_magazine/model/materia_model.dart';
import 'package:piaui_app/app/modules/inside_magazine/model/subjects_model.dart';
import 'package:piaui_app/app/modules/inside_magazine/repository/inside_repository.dart';

part 'inside_magazine_controller.g.dart';

@Injectable()
class InsideMagazineController = _InsideMagazineControllerBase
    with _$InsideMagazineController;

abstract class _InsideMagazineControllerBase with Store {
  InsideMagazineRepository insideMagazineRepository;
  _InsideMagazineControllerBase(this.insideMagazineRepository);

  @observable
  List<materiaModel> _editionsSiglePage;

  @observable
  bool loadPage = false;

  _InsideMagazineControllerBase(this._repository) {
    init();
  }

  init() async {
    isLoading = true;
    // _listMateriaLocal = await _repository.findByPage(_pageCount);
    _editionsSiglePage = _listMateriaLocal.asObservable();
    isLoading = false;
  }

  List<materiaModel> get editionsSinglePage {
    return _editionsSiglePage;
  }

  @action
  nextPage() async {
    loadPage = true;
    editionsSinglePage.addAll(_listMateriaLocal.asObservable());
    loadPage = false;
  }
}
