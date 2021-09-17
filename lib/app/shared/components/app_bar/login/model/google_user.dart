// // class LoginModel {
// //   String url;
// //   String hash;
// //   Dados dados;

// //   LoginModel({this.url, this.hash, this.dados});

// //   LoginModel.fromJson(Map<String, dynamic> json) {
// //     url = json['url'];
// //     hash = json['hash'];
// //     dados = json['dados'] != null ? new Dados.fromJson(json['dados']) : null;
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['url'] = this.url;
// //     data['hash'] = this.hash;
// //     if (this.dados != null) {
// //       data['dados'] = this.dados.toJson();
// //     }
// //     return data;
// //   }
// // }

// // class Dados {
// //   String id;
// //   String nome;
// //   String email;
// //   Null celular;
// //   String senha;
// //   String data;
// //   String login;
// //   String status;
// //   String origem;
// //   Null abril;
// //   Null google;
// //   List<Null> compras;
// //   String assinante;

// //   Dados(
// //       {this.id,
// //       this.nome,
// //       this.email,
// //       this.celular,
// //       this.senha,
// //       this.data,
// //       this.login,
// //       this.status,
// //       this.origem,
// //       this.abril,
// //       this.google,
// //       this.compras,
// //       this.assinante});

// //   Dados.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     nome = json['nome'];
// //     email = json['email'];
// //     celular = json['celular'];
// //     senha = json['senha'];
// //     data = json['data'];
// //     login = json['login'];
// //     status = json['status'];
// //     origem = json['origem'];
// //     abril = json['abril'];
// //     google = json['google'];
// //     // if (json['compras'] != null) {
// //     //   compras = new List<Null>();
// //     //   json['compras'].forEach((v) {
// //     //     compras.add(new Null.fromJson(v));
// //     //   });
// //     // }
// //     assinante = json['assinante'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['nome'] = this.nome;
// //     data['email'] = this.email;
// //     data['celular'] = this.celular;
// //     data['senha'] = this.senha;
// //     data['data'] = this.data;
// //     data['login'] = this.login;
// //     data['status'] = this.status;
// //     data['origem'] = this.origem;
// //     data['abril'] = this.abril;
// //     data['google'] = this.google;
// //     // if (this.compras != null) {
// //     //   data['compras'] = this.compras.map((v) => v.toJson()).toList();
// //     // }
// //     data['assinante'] = this.assinante;
// //     return data;
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'dart:convert';

// class AuthUser {
//   UserModel user;
//   AuthUser({@required this.user});
// }

// class UserModel {
//   String url;
//   String hash;
//   Dados dados;

//   UserModel({this.url, this.hash, this.dados});

//    LoginModel.fromJson(Map<String, dynamic> json) {
// //     url = json['url'];
// //     hash = json['hash'];
// //     dados = json['dados'] != null ? new Dados.fromJson(json['dados']) : null;
// //   }

//   factory UserModel.fromMap(Map<String, dynamic> map) {
//     return UserModel(
//       url: map['url'],
//       hash: map['hash'],
//       dados: map['dados'] != null ? new Dados.fromJson(json['dados']) : null,
//     );
//   }

//   factory UserModel.fromJson(String json) =>
//       UserModel.fromMap(jsonDecode(json));

//   Map<String, dynamic> toMap() => {
//         // "cadaIdCadastro": this.cadaIdCadastro,
//         "cadaTxNome": this.cadaTxNome,
//         // "cadaDsEmail": this.cadaDsEmail,
//         // "cadaInAcesso": this.cadaInAcesso,
//         // "id": this.id,
//         // "name": this.name,
//         // "email": this.email,
//         // "created": this.created,
//       };
//   String toJson() => jsonEncode(toMap());
// }
