/* import 'package:piaui_app/app/modules/inside_magazine_download/model/materia_model.dart';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<materiaModel> fetchMateria() async {
  final response = await http.get(
    Uri.parse(
        'customRest/v1/esquinasEdicao/?edicao=392835'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return materiaModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
 */