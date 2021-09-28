import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:piaui_app/app/modules/inside_magazine/model/teste_model.dart';

class MateriaApi {
  static Future<List<Materias>> getMateria() async {
    final dio = Dio();
    var url =
        'https://piaui.folha.uol.com.br/customRest/v1/esquinasEdicao/?edicao=392835';

    final response = await dio.get(url);
    Map data = jsonDecode(response.data.toString());
    List _temp = [];

    for (var i in data['edicoes']) {
      _temp.add(i['materias']);
    }

    return Materias.materiasfromSnapshot(_temp);
  }
}
