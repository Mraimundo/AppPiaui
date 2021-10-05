// import 'package:dio/dio.dart';
// import 'package:flutter/widgets.dart';
// import 'package:piaui_app/app/modules/editions_page/model/edition_model.dart';
// import 'package:piaui_app/app/modules/inside_magazine_download/model/materia_model.dart';
// import 'package:piaui_app/app/shared/repositories/interfaces/repository_interface.dart';

// class MateriaApi implements IRepository {
//   final Dio dio;

//   MateriaApi(this.dio);

//   List<EditionModel> materias = <EditionModel>[];

//   @override
//   Future<List<EditionModel>> findAll() async {
//     try {
//       var response = await dio.get('/wp-json/acf/v3/edicao/');

//       if (response.statusCode == 200) {
//         for (var json in response.data) {
//           final singleEdition = EditionModel.fromJson(json);
//           editions.add(singleEdition);
//         }
//       }
//     } catch (error) {
//       print("Error: " + error.toString());
//     }
//     return editions;
//   }
// }
