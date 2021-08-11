import 'dart:html';

import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/inside_magazine/model/inside_model.dart';
// import 'package:piaui_app/app/modules/inside_magazine/model/subjects_model.dart';
import 'package:piaui_app/app/modules/inside_magazine/repository/inside_repository.dart';

part 'inside_magazine_teste_controller.g.dart';

@Injectable()
class InsideMagazineTeste = _InsideMagazineTesteBase with _$InsideMagazineTeste;

abstract class _InsideMagazineTesteBase with Store {
  final InsideMagazineRepository insideMagazineRepository;
  _InsideMagazineTesteBase(this.insideMagazineRepository);

  @observable
  ObservableFuture<List<Materias>> subjectsFuture;

  @action
  void findAll() {
    subjectsFuture = ObservableFuture(
        insideMagazineRepository.findByID(hashCode.toString()));
  }
}
