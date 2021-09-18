import 'package:dio/dio.dart';

class CustomDio {
  var _dio;

  BaseOptions _options = BaseOptions(
    baseUrl: 'https://piaui.homolog.inf.br',
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
