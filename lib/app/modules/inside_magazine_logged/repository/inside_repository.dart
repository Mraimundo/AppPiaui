import 'package:dio/dio.dart';
import 'package:piaui_app/app/modules/inside_magazine_logged/model/inside_magazine_logged.dart';
import 'package:piaui_app/app/shared/repositories/interfaces/repository_interface.dart';

class InsideLoggedRepository implements IRepository {
  final Dio dio;

  InsideLoggedRepository(this.dio);

  List<InsideMagazineLoggedModel> editions = <InsideMagazineLoggedModel>[];

  @override
  Future<List<InsideMagazineLoggedModel>> findAll() async {
    try {
      var response = await dio.get('/wp-json/acf/v3/edicao/388210/?_embed/');
      if (response.statusCode == 200) {
        for (var json in response.data) {
          final singleEdition = InsideMagazineLoggedModel.fromJson(json);
          editions.add(singleEdition);
        }
      }
    } catch (error) {
      print("Error: " + error.toString());
    }
    return editions;
  }

  @override
  Future<List<InsideMagazineLoggedModel>> findByPage(int page) async {
    try {
      var response = await dio.get('/wp-json/acf/v3/edicao?page=$page');
      print('response');
      if (response.statusCode == 200) {
        for (var json in response.data) {
          final singleEdition = InsideMagazineLoggedModel.fromJson(json);
          editions.add(singleEdition);
        }
      }
    } catch (error) {
      print("Error: " + error.toString());
    }
    return editions;
  }
}
