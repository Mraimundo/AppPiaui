import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:piaui_app/app/modules/inside_magazine/model/inside_model.dart';
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

  Future<List<Materias>> findByID(String id) async {
    var dio = Dio();
    var response = await dio.get(
        'https://piaui.folha.uol.com.br/customRest/v1/esquinasEdicao/?edicao=$id');
    List<Materias> materias = [];
    print(response.data + "chegou");
    Map<String, dynamic> json = jsonDecode(await response.data);
    print(json);
    return materias;
  }
}
