// import 'package:dio/dio.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class UserRepository {
//   static String mainUrl = "http://piaui.folha.uol.com.br";
//   var loginUrl =
//       '$mainUrl/actions/?acao=loginrest&email=mel@revistapiaui.com.br&senha=pinguim';

//   final FlutterSecureStorage storage = FlutterSecureStorage();
//   final Dio _dio = Dio();

//   Future<bool> hasToken() async {
//     var value = await storage.read(key: 'token');
//     if (value != null) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   Future<void> persistToken(String token) async {
//     await storage.write(key: 'token', value: token);
//   }

//   Future<void> deleteToken() async {
//     storage.delete(key: 'token');
//     storage.deleteAll();
//   }

//   Future<String> login(String phone, String password) async {
//     Response response = await _dio.post(loginUrl, data: {
//       "email": phone,
//       "password": password,
//     });
//     return response.data["token"];
//   }
// }
