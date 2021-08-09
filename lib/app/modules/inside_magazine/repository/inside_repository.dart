import 'package:dio/dio.dart';
import 'package:piaui_app/app/modules/inside_magazine/model/subjects_model.dart';

class InsideMagazineRepository {
  Future<List<SubjectModel>> findAllSubjects() async {
    var dio = Dio();
    return dio
        .get(
            'https://piaui.folha.uol.com.br/customRest/v1/esquinasEdicao/?edicao=392835')
        .then((res) => res.data
            .map<SubjectModel>((b) => SubjectModel.fromJson(b))
            .toList());
  }

  Future<SubjectModel> findByID(String id) {
    return Dio()
        .get(
            'https://piaui.folha.uol.com.br/customRest/v1/esquinasEdicao/?edicao=$id')
        .then((res) => SubjectModel.fromJson(res.data));
  }
}
