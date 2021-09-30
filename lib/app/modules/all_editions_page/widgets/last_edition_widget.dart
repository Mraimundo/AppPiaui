import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/download_editions_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/editions_page/components/image_shimmer.dart';
import 'package:piaui_app/app/modules/editions_page/components/skeleton_last_edition.dart';
import 'package:piaui_app/app/modules/editions_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/editions_page/model/edition_model.dart';
import 'package:piaui_app/app/shared/downloads/downloads_controller.dart';
import 'package:piaui_app/app/shared/downloads/model/revist_download.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

Future<String> materias(id) async {
  final _url =
      'https://piaui.homolog.inf.br/wp-json/customRest/v1/materias-revista?edicao=' +
          id.toString();

  var dio = Dio();
  var response = await dio.get(_url);
  return response.toString();
}

Future<String> conteudo(idMateria) async {
  final _url = "https://piaui.homolog.inf.br/wp-json/wp/v2/materia/" +
      idMateria.toString();
  var dio = Dio();
  var response = await dio.get(_url);
  return response.toString();
}

Future<String> colaborador(id) async {
  final _url = "https://piaui.homolog.inf.br/wp-json/acf/v3/colaborador/" +
      id.toString();
  var dio = Dio();
  var response = await dio.get(_url);
  return response.toString();
}

class LastEditionWidget extends StatefulWidget {
  @override
  _LastEditionWidgetState createState() => _LastEditionWidgetState();
  DownloadsController downloads = DownloadsController();
  final bool user;
  LastEditionWidget({Key key, this.user = false}) : super(key: key);
}

class _LastEditionWidgetState
    extends ModularState<LastEditionWidget, EditionPageController> {
  @override
  Widget build(BuildContext context) {
    double vHeight = MediaQuery.of(context).size.height;
    double vWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Expanded(
          child: Container(
              child: Container(
            color: Colors.white,
            child: Observer(builder: (ctx) {
              if (!controller.isLoading) {
                Acf edicoes = controller.lastEdition.acf;
                // print('vHeight $vHeight');
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 32, 20, 0),
                      child: Container(
                        color: Colors.grey,
                        height: vHeight < 764.5 ? vHeight * 0.6 : vHeight * 0.5,
                        width: vWidth,
                        child: ImageShimmer(url: edicoes.capa.url),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 23, top: 9, bottom: 8),
                      child: Align(
                        child: Text(
                          'Edição #${edicoes.numberEdition}: ${edicoes.mes} de ${edicoes.ano}',
                          style: TextStyle(
                            fontFamily: 'Piaui',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 12),
                          child: TextButton(
                            onPressed: () {
                              Modular.to.pushNamed('/magazine', arguments: {
                                "url":
                                    'https://piaui.homolog.inf.br/wp-json/customRest/v1/materias-revista?edicao=' +
                                        (controller.lastEdition.id).toString(),
                                "title": edicoes.numberEdition,
                                "data": '${edicoes.mes} de ${edicoes.ano}'
                              });
                            },
                            child: Container(
                              color: AppColors.orangePiaui,
                              height: vHeight * 0.06,
                              width: vWidth / 2.4,
                              child: Align(
                                child: Text(
                                  'Ler agora',
                                  style: TextStyle(
                                    fontFamily: 'Piaui',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10, bottom: 12),
                          child: TextButton(
                            onPressed: () async {
                              var m = await materias(
                                  controller.lastEdition.id.toString());

                              var posts = [];

                              for (var i = 1;
                                  i <= jsonDecode(m)["materias"].length;
                                  i++) {
                                posts.add(await conteudo(
                                    jsonDecode(m)["materias"][i.toString()]
                                            ["id"]
                                        .toString()));
                              }

                              var idColaboradores = [];

                              for (var i = 0; i < posts.length; i++) {
                                for (var j = 0;
                                    j <
                                        jsonDecode(posts[i])["acf"]["autor"]
                                            .length;
                                    j++) {
                                  if (!idColaboradores.contains(
                                      jsonDecode(posts[i])["acf"]["autor"][j]
                                          ["ID"])) {
                                    idColaboradores.add(
                                        jsonDecode(posts[i])["acf"]["autor"][j]
                                            ["ID"]);
                                  }
                                }
                              }

                              var colaboradores = [];

                              for (var item in idColaboradores) {
                                colaboradores.add(await colaborador(item));
                              }

                              final RevistDownload revist = RevistDownload(
                                  controller.lastEdition.id,
                                  edicoes.capa.url,
                                  edicoes.numberEdition,
                                  edicoes.mes,
                                  edicoes.ano,
                                  m);
                              await widget.downloads.addRevist(revist);
                            },
                            child: Container(
                              height: vHeight * 0.06,
                              width: vWidth / 2.4,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.orangePiaui,
                                ),
                              ),
                              child: Align(
                                child: Text(
                                  'Fazer download',
                                  style: TextStyle(
                                    fontFamily: 'Piaui',
                                    color: AppColors.orangePiaui,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                //You'll put a shimmer here!
                return SkeletonLastEdition();
              }
            }),
          )),
        ),
      ],
    );
  }
}
