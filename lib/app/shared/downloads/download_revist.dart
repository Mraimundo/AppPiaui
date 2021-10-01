import 'dart:convert';

import 'package:piaui_app/app/shared/downloads/api_download.dart';
import 'package:piaui_app/app/shared/downloads/downloads_controller.dart';
import 'package:piaui_app/app/shared/downloads/model/colaborador.dart';
import 'package:piaui_app/app/shared/downloads/model/conteudo.dart';
import 'package:piaui_app/app/shared/downloads/model/materia.dart';
import 'package:piaui_app/app/shared/downloads/model/revist_download.dart';

class DownloadRevist {
  final ApiDownload apiDownload = new ApiDownload();
  final DownloadsController downloads = new DownloadsController();

  download(id, capa, numberEdition, mes, ano) async {
    var m = await apiDownload.materias(id);
    var capaRevist = await apiDownload.imageBase64(id);
    final List<Materia> materias = [];
    for (var i = 1; i <= jsonDecode(m)["materias"].length; i++) {
      List<Colaborador> colaboradores = [];

      var conteudoReponse = await apiDownload
          .conteudo(jsonDecode(m)["materias"][(i).toString()]["id"].toString());
      var materiaImage = await apiDownload.imageBase64(
          jsonDecode(m)["materias"][(i).toString()]["id"].toString());
      //Colaboradores
      for (var cont = 0;
          jsonDecode(conteudoReponse)["acf"]["autor"].length > cont;
          cont++) {
        var colaboradorResponse = await apiDownload.colaborador(
            jsonDecode(conteudoReponse)["acf"]["autor"][cont]['ID']);

        Colaborador colaborador = new Colaborador(
            jsonDecode(colaboradorResponse)["acf"]
                ["twitter_colaborador_arroba"],
            jsonDecode(colaboradorResponse)["acf"]["bio_resumida"],
            jsonDecode(conteudoReponse)["acf"]["autor"][cont]["post_title"],
            "");

        colaboradores.add(colaborador);
      }

      Conteudo conteudo = new Conteudo(
          jsonDecode(conteudoReponse)['title']['rendered'],
          jsonDecode(conteudoReponse)['content']['rendered'],
          colaboradores,
          jsonDecode(conteudoReponse)['acf']['gravata']);

      Materia materia = new Materia(
          jsonDecode(m)["materias"][i.toString()]["id"].toString(),
          conteudo,
          jsonDecode(materiaImage)['imgcode'],
          jsonDecode(m)["materias"][i.toString()]['gravata'],
          jsonDecode(m)["materias"][i.toString()]['titulo'],
          jsonDecode(m)["materias"][i.toString()]['imagemcapa']['alt']);

      materias.add(materia);
    }

    final RevistDownload revist = RevistDownload(id,
        jsonDecode(capaRevist)['imgcode'], numberEdition, mes, ano, materias);

    await downloads.addRevist(revist);
  }
}
