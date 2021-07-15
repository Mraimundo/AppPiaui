import 'package:dio/dio.dart';
import 'package:piaui_app/app/modules/editions_page/model/edition_model.dart';
import 'package:piaui_app/app/shared/repositories/interfaces/repository_interface.dart';

class EditionRepository implements IRepository {
  final Dio dio;

  EditionRepository(this.dio);

  List<EditionModel> editions = <EditionModel>[];

  @override
  Future<List<EditionModel>> findAll() async {
    try {
      var response = await dio.get('wp-json/acf/v3/edicao/');

      if (response.statusCode == 200) {
        for (var json in response.data) {
          final singleEdition = EditionModel.fromJson(json);
          editions.add(singleEdition);
        }
      }
    } catch (error) {
      print("Error: " + error.toString());
    }
    return editions;
  }

  @override
  Future<List<EditionModel>> findByPage(int page) async {
    try {
      var response = await dio.get('wp-json/acf/v3/edicao?page=$page');
      print('response');
      if (response.statusCode == 200) {
        for (var json in response.data) {
          final singleEdition = EditionModel.fromJson(json);
          editions.add(singleEdition);
        }
      }
    } catch (error) {
      print("Error: " + error.toString());
    }
    return editions;
  }
}
