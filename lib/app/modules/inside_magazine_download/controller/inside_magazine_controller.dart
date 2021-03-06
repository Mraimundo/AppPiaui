import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/inside_magazine_download/model/subjects_model.dart';
import 'package:piaui_app/app/modules/inside_magazine_download/repository/inside_repository.dart';

part 'inside_magazine_controller.g.dart';

@Injectable()
class InsideMagazineController = _InsideMagazineControllerBase
    with _$InsideMagazineController;

abstract class _InsideMagazineControllerBase with Store {
  InsideMagazineRepository insideMagazineRepository;
  _InsideMagazineControllerBase(this.insideMagazineRepository);

  @observable
  ObservableFuture<List<SubjectModel>> subjectsFuture;

  @action
  void findAll() {
    /* subjectsFuture =
        ObservableFuture(insideMagazineRepository.findAllSubjects()); */
  }
}
