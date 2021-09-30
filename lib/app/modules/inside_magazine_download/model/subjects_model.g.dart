// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subjects_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectModel _$SubjectModelFromJson(Map<String, dynamic> json) {
  return SubjectModel(
    id: json['id'] as String,
    data: json['data'] as String,
    categoriaId: json['categoriaId'] as String,
    categoriaNome: json['categoriaNome'] as String,
    categoriaChapeu: json['categoriaChapeu'] as String,
    gravata: json['gravata'] as String,
    titulo: json['titulo'] as String,
    autores: json['autores'] as String,
    imagemCapa: (json['imagemCapa'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$SubjectModelToJson(SubjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'data': instance.data,
      'categoriaId': instance.categoriaId,
      'categoriaNome': instance.categoriaNome,
      'categoriaChapeu': instance.categoriaChapeu,
      'gravata': instance.gravata,
      'titulo': instance.titulo,
      'autores': instance.autores,
      'imagemCapa': instance.imagemCapa,
    };
