class materiaModel {
  int id;
  String data;
  int categoriaId;
  String categoriaNome;
  String categoriaChapeu;
  String chapeuExtra;
  String gravata;
  String titulo;
  List<String> autores;
  Imagemcapa imagemcapa;

  materiaModel(
      {this.id,
      this.data,
      this.categoriaId,
      this.categoriaNome,
      this.categoriaChapeu,
      this.chapeuExtra,
      this.gravata,
      this.titulo,
      this.autores,
      this.imagemcapa});

  materiaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'];
    categoriaId = json['categoria_id'];
    categoriaNome = json['categoria_nome'];
    categoriaChapeu = json['categoria_chapeu'];
    chapeuExtra = json['chapeu_extra'];
    gravata = json['gravata'];
    titulo = json['titulo'];
    autores = json['autores'].cast<String>();
    imagemcapa = json['imagemcapa'] != null
        ? new Imagemcapa.fromJson(json['imagemcapa'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['data'] = this.data;
    data['categoria_id'] = this.categoriaId;
    data['categoria_nome'] = this.categoriaNome;
    data['categoria_chapeu'] = this.categoriaChapeu;
    data['chapeu_extra'] = this.chapeuExtra;
    data['gravata'] = this.gravata;
    data['titulo'] = this.titulo;
    data['autores'] = this.autores;
    if (this.imagemcapa != null) {
      data['imagemcapa'] = this.imagemcapa.toJson();
    }
    return data;
  }
}

class Imagemcapa {
  String url;
  String alt;

  Imagemcapa({this.url, this.alt});

  Imagemcapa.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    alt = json['alt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['alt'] = this.alt;
    return data;
  }
}
