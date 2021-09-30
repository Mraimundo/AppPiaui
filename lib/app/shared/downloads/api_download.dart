import 'package:dio/dio.dart';

class ApiDownload {
  Future<String> materias(id) async {
    final _url =
        'https://piaui.homolog.inf.br/wp-json/customRest/v1/materias-revista?edicao=' +
            id.toString();

    var dio = Dio();
    var response = await dio.get(_url);
    return response.toString();
  }

  Future<String> conteudo(idMateria) async {
    final _url = "https://piaui.homolog.inf.br/wp-json/wp/v2/materia/" +
        idMateria.toString();
    var dio = Dio();
    var response = await dio.get(_url);
    return response.toString();
  }

  Future<String> colaborador(id) async {
    final _url = "https://piaui.homolog.inf.br/wp-json/acf/v3/colaborador/" +
        id.toString();
    var dio = Dio();
    var response = await dio.get(_url);
    return response.toString();
  }
}
