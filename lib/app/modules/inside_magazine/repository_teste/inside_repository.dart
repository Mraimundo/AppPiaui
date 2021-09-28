import 'package:dio/dio.dart';
import 'package:piaui_app/app/modules/inside_magazine/model/materia_model.dart';
import 'package:piaui_app/app/shared/core/custom_dio.dart';

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<materiaModel> fetchMateria() async {
  final response = await http.get(
    Uri.parse(
        'https://piaui.homolog.inf.br/customRest/v1/esquinasEdicao/?edicao=392835'),
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

// Future<materiaModel> getMateria({String id}) async {
//   var dio = CustomDio().instance;

//   materiaModel materia;
//   try {
//     Response materiaData =
//         await dio.get('/customRest/v1/esquinasEdicao/?edicao=$id');

//     print('Materia Info: $materiaData.data');
//     materia = materiaModel.fromJson(materiaData.data);
//   } on DioError catch (e) {
//     if (e.response != null) {
//       print("Dio Error");
//       print("STATUS: ${e.response?.statusCode}");
//       print("DATA: ${e.response?.data}");
//     } else {
//       print("Erro ao fazer a requisição!");
//       print(e.message);
//     }
//   }
//   return materia;
// }

// Future<materiaModel> getMateria({String id}) async {
//   var dio = CustomDio().instance;

//   materiaModel materia;
//   try {
//     Response materiaData =
//         await dio.get('/customRest/v1/esquinasEdicao/?edicao=$id');

//     print('Materia Info: $materiaData.data');
//     materia = materiaModel.fromJson(materiaData.data);
//   } on DioError catch (e) {
//     if (e.response != null) {
//       print("Dio Error");
//       print("STATUS: ${e.response?.statusCode}");
//       print("DATA: ${e.response?.data}");
//     } else {
//       print("Erro ao fazer a requisição!");
//       print(e.message);
//     }
//   }
//   return materia;
// }
