class RevistDownload {
  final int edicao;
  final String capa;
  final String numberEdition;
  final String mes;
  final String ano;
  final List<dynamic> materias;

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
