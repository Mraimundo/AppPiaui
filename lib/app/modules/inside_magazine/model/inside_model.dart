// To parse this JSON data, do
//
//     final materiamodel = materiamodelFromMap(jsonString);

import 'dart:convert';

Materiamodel materiamodelFromMap(String str) =>
    Materiamodel.fromMap(json.decode(str));

String materiamodelToMap(Materiamodel data) => json.encode(data.toMap());

class Materiamodel {
  Materiamodel({
    this.id,
    this.data,
    this.categoriaId,
    this.categoriaNome,
    this.categoriaChapeu,
    this.chapeuExtra,
    this.gravata,
    this.titulo,
    this.autores,
    this.imagemcapa,
  });

  final int id;
  final String data;
  final int categoriaId;
  final String categoriaNome;
  final String categoriaChapeu;
  final String chapeuExtra;
  final String gravata;
  final String titulo;
  final List<String> autores;
  final Imagemcapa imagemcapa;

  Materias.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'];
    categoriaId = json['categoria_id'];
    categoriaNome = json['categoria_nome'];
    categoriaChapeu = json['categoria_chapeu'];
    chapeuExtra = json['chapeu_extra'];
    gravata = json['gravata'];
    titulo = json['titulo'];
    autores = json['autores'].cast<String>();
    imagemcapa = json['imagemcapa'] != null ? json['imagemcapa'] : null;
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "data": data,
        "categoria_id": categoriaId,
        "categoria_nome": categoriaNome,
        "categoria_chapeu": categoriaChapeu,
        "chapeu_extra": chapeuExtra,
        "gravata": gravata,
        "titulo": titulo,
        "autores": List<dynamic>.from(autores.map((x) => x)),
        "imagemcapa": imagemcapa.toMap(),
      };
}

class Imagemcapa {
  Imagemcapa({
    this.url,
    this.alt,
  });

  final String url;
  final String alt;

  factory Imagemcapa.fromMap(Map<String, dynamic> json) => Imagemcapa(
        url: json["url"],
        alt: json["alt"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "alt": alt,
      };
}
