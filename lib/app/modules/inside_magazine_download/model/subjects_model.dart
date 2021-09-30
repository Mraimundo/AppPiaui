import 'package:json_annotation/json_annotation.dart';

part 'subjects_model.g.dart';

@JsonSerializable()
class SubjectModel {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'data')
  String data;
  @JsonKey(name: 'categoriaId')
  String categoriaId;
  @JsonKey(name: 'categoriaNome')
  String categoriaNome;
  @JsonKey(name: 'categoriaChapeu')
  String categoriaChapeu;
  @JsonKey(name: 'gravata')
  String gravata;
  @JsonKey(name: 'titulo')
  String titulo;
  @JsonKey(name: 'autores')
  String autores;
  @JsonKey(name: 'imagemCapa')
  List<String> imagemCapa;
  SubjectModel({
    this.id,
    this.data,
    this.categoriaId,
    this.categoriaNome,
    this.categoriaChapeu,
    this.gravata,
    this.titulo,
    this.autores,
    this.imagemCapa,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectModelToJson(this);
}
