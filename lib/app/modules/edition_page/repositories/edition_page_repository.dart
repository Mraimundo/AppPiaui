import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interfaces/edition_page_repository_interface.dart';

part 'edition_page_repository.g.dart';

@Injectable()
class EditionPageRepository implements IEditionPageRepository {
  final DioForNative client;

  EditionPageRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
