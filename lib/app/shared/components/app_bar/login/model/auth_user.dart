import 'dart:convert';

class UserModel {
  String url;
  String hash;
  Dados dados;

  UserModel({this.url, this.hash, this.dados});
}

class Dados {
  String id;
  String nome;
  String email;
  String celular;
  String senha;
  String data;
  String login;
  String status;
  String origem;
  String abril;
  String google;
  List<String> compras;
  String assinante;

  Dados(
      {this.id,
      this.nome,
      this.email,
      this.celular,
      this.senha,
      this.data,
      this.login,
      this.status,
      this.origem,
      this.abril,
      this.google,
      this.compras,
      this.assinante});

  factory Dados.fromMap(Map<String, dynamic> map) {
    return new Dados(
      id: map['id'] != null ? map['id'] : '',
      nome: map['nome'] != null ? map['nome'] : '',
      email: map['email'] != null ? map['email'] : '',
      celular: map['celular'] != null ? map['celular'] : '',
      senha: map['senha'] != null ? map['senha'] : '',
      data: map['data'] != null ? map['data'] : '',
      login: map['login'] != null ? map['login'] : '',
      status: map['status'] != null ? map['status'] : '',
      origem: map['origem'] != null ? map['origem'] : '',
      abril: map['abril'] != null ? map['abril'] : '',
      google: map['google'] != null ? map['google'] : '',
      assinante: map['assinante'] != null ? map['assinante'] : '',
    );
  }

  factory Dados.fromJson(String json) => Dados.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        'id': this.id,
        'nome': this.nome,
        'email': this.email,
        'celular': this.celular,
        'senha': this.senha,
        'data': this.data,
        'login': this.login,
        'status': this.status,
        'origem': this.origem,
        'abril': this.abril,
        'google': this.google,
        // if (this.compras != null) {
        //   data['compras'] = this.compras.map((v) => v.toJson()).toList();
        // }
        'assinante': this.assinante,
      };
  String toJson() => jsonEncode(toMap());
}
