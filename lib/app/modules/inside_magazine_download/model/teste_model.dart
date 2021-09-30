class Materias {
  Materias({
    this.id,
    this.data,
    this.categoriaId,
    this.categoriaNome,
    this.categoriaChapeu,
    this.chapeuExtra,
    this.gravata,
    this.titulo,
    this.autores,
    // this.imagemcapa,
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
  // final Imagemcapa imagemcapa;

  factory Materias.fromJson(dynamic json) {
    return Materias(
      id: json['id'] as int,
      data: json['data'] as String,
      categoriaId: json['categoriaId'] as int,
      categoriaNome: json['categoriaNome'] as String,
      categoriaChapeu: json['categoriaChapeu'] as String,
      chapeuExtra: json['chapeuExtra'] as String,
      gravata: json['gravata'] as String,
      titulo: json['titulo'] as String,
      autores: List<String>.from(json["autores"].map((x) => x)),
      // imagemcapa: Imagemcapa.fromJson(json["imagemcapa"]),
    );
  }

  static List<Materias> materiasfromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Materias.fromJson(data);
    }).toList();
  }
}
