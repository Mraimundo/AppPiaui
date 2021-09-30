import 'package:dio/dio.dart';
import 'package:piaui_app/app/modules/internal_magazine/model/internal_model.dart';
import 'package:piaui_app/app/shared/repositories/interfaces/repository_interface.dart';

class IntenalMagazineRepository implements IntenalRepository {
  final Dio dio;

  IntenalMagazineRepository(this.dio);

  List<InternalModel> editions = <InternalModel>[];

  @override
  Future<List<InternalModel>> findByTitle(int title) async {
    try {
      var response = await dio.get('wp-json/acf/v3/edicao?title=$title');
      print('response');
      if (response.statusCode == 200) {
        for (var json in response.data) {
          final singleEdition = InternalModel.fromJson(json);
          editions.add(singleEdition);
        }
      }
    } catch (error) {
      print("Error: " + error.toString());
    }
    return editions;
  }
}
