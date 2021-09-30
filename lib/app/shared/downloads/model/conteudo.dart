import 'package:piaui_app/app/shared/downloads/model/colaborador.dart';

class Conteudo {
  String title;
  String content;
  List<Colaborador> colaboradores;
  String gravata;

  Conteudo(this.title, this.content, this.colaboradores, this.gravata);
  Map toJson() {
    return {
      'title': title,
      'content': content,
      'Colaboradores': colaboradores,
      'gravata': gravata
    };
  }
}
