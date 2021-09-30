import 'package:piaui_app/app/modules/inside_magazine/model/inside_model.dart';

class RevistDownload {
  final int edicao;
  final String capa;
  final String numberEdition;
  final String mes;
  final String ano;
  final String materias;

  RevistDownload(this.edicao, this.capa, this.numberEdition, this.mes, this.ano,
      this.materias);

  Map toJson() {
    return {
      'edicao': edicao,
      'capa': capa,
      'numberEdition': numberEdition,
      'mes': mes,
      'ano': ano,
      'materias': materias
    };
  }
}
