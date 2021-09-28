import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:piaui_app/app/modules/inside_magazine/model/inside_model.dart';
import 'package:piaui_app/app/modules/inside_magazine/model/materia_model.dart';
import 'package:piaui_app/app/modules/inside_magazine/model/subjects_model.dart';
import 'package:piaui_app/app/shared/repositories/interfaces/repository_interface.dart';

class MateriaRepository implements IMateriaRepository {
  final Dio dio;
  MateriaRepository(this.dio);

  List<materiaModel> materias = <materiaModel>[];

  Future<List<materiaModel>> findAllMateria() async {
    try {
      var response = await dio.get(
          'https://piaui.folha.uol.com.br/customRest/v1/esquinasEdicao/?edicao=392835');

      if (response.statusCode == 200) {
        for (var json in response.data) {
          final sigleMateria = materiaModel.fromJson(json);
          materias.add(sigleMateria);
        }
      }
    } catch (error) {
      print("Error: " + error.toString());
    }
    return materias;
  }
}
