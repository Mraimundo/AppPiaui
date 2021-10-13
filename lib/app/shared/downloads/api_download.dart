import 'package:dio/dio.dart';
import 'package:piaui_app/app/shared/core/custom_dio.dart';

class ApiDownload {
  Future<String> imageBase64(id) async {
    final _url = '/wp-json/customRest/v1/imgcode?postid=' + id.toString();

    var dio = CustomDio().instance;
    var response = await dio.get(_url);
    return response.toString();
  }

  Future<String> materias(id) async {
    final _url = '/wp-json/customRest/v1/materias-revista?edicao=' +
        id.toString() +
        '&perpage=0';

    var dio = CustomDio().instance;
    var response = await dio.get(_url);
    return response.toString();
  }

  Future<String> conteudo(idMateria) async {
    final _url = "/wp-json/wp/v2/materia/" + idMateria.toString();
    var dio = CustomDio().instance;
    var response = await dio.get(_url);
    return response.toString();
  }

  Future<String> colaborador(id) async {
    final _url = "/wp-json/acf/v3/colaborador/" + id.toString();
    var dio = CustomDio().instance;
    var response = await dio.get(_url);
    return response.toString();
  }
}
