import 'package:piaui_app/app/shared/downloads/model/conteudo.dart';

class Materia {
  String id;
  Conteudo conteudo;
  String image;
  String subTitle;
  String title;
  String imageAlt;

  Materia(this.id, this.conteudo, this.image, this.subTitle, this.title,
      this.imageAlt);

  Map toJson() {
    return {
      'id': id,
      'conteudo': conteudo,
      'image': image,
      'subTitle': subTitle,
      'title': title,
      'imageAlt': imageAlt
    };
  }
}
