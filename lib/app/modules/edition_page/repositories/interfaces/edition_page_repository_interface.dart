import 'package:flutter_modular/flutter_modular.dart';

abstract class IEditionPageRepository implements Disposable {
  Future fetchPost();
}
