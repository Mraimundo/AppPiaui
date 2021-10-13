import 'package:dio/dio.dart';
import 'package:piaui_app/app/shared/utils/constants.dart';

class CustomDio {
  var _dio;

  BaseOptions _options = BaseOptions(
    baseUrl: URL_BASE,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  CustomDio() {
    _dio = Dio(_options);
  }

  CustomDio.withAuthentication() {
    _dio = Dio(_options);
  }

  dynamic requestInterceptor(RequestOptions options) async {
    return options;
  }

  Dio get instance => _dio;
}
