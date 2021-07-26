import 'package:flutter/material.dart';
import 'dart:convert';

// class AuthUser {
//   UserModel user;
//   String token;
//   AuthUser({@required this.user, @required this.token});
// }

class UserModel {
  // final String cadaIdCadastro;
  final String cadaTxNome;
  // final String cadaDsEmail;
  // final String cadaInAcesso;
  // final int id;
  // final String name;
  // final String email;
  // final int created;

  UserModel({
    // @required this.cadaIdCadastro,
    @required this.cadaTxNome,
    // @required this.cadaDsEmail,
    // @required this.cadaInAcesso,
    // @required this.id,
    // @required this.name,
    // @required this.email,
    // @required this.created,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      // cadaIdCadastro: map['cadaIdCadastro'],
      cadaTxNome: map['cadaTxNome'],
      // cadaDsEmail: map['cadaDsEmail'],
      // cadaInAcesso: map['cadaInAcesso'],
      // id: map['id'],
      // name: map['name'],
      // email: map['email'],
      // created: map['created'],
    );
  }

  factory UserModel.fromJson(String json) =>
      UserModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        // "cadaIdCadastro": this.cadaIdCadastro,
        "cadaTxNome": this.cadaTxNome,
        // "cadaDsEmail": this.cadaDsEmail,
        // "cadaInAcesso": this.cadaInAcesso,
        // "id": this.id,
        // "name": this.name,
        // "email": this.email,
        // "created": this.created,
      };
  String toJson() => jsonEncode(toMap());
}
