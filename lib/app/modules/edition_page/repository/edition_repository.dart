import 'package:dio/dio.dart';
import 'package:piaui_app/app/modules/edition_page/models/edition_model.dart';
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
}
