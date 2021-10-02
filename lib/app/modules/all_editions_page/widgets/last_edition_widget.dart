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
import 'package:piaui_app/app/shared/components/complete_download/complete_download.dart';
import 'package:piaui_app/app/shared/downloads/download_revist.dart';
import 'package:piaui_app/app/shared/downloads/downloads_controller.dart';
import 'package:piaui_app/app/shared/downloads/model/revist_download.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class LastEditionWidget extends StatefulWidget {
  @override
  _LastEditionWidgetState createState() => _LastEditionWidgetState();
  DownloadRevist downloadRevist = DownloadRevist();
  DownloadsController downloads = DownloadsController();
  final bool user;
  LastEditionWidget({Key key, this.user = false}) : super(key: key);
}

class _LastEditionWidgetState
    extends ModularState<LastEditionWidget, EditionPageController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // double vHeight = MediaQuery.of(context).size.height;
    // double vWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Expanded(
          child: Container(
              child: Container(
            color: Colors.white,
            child: Observer(builder: (ctx) {
              if (!controller.isLoading) {
                Acf edicoes = controller.lastEdition.acf;
                return Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 100, bottom: 25),
                      width: size.width,
                      height: size.height * 0.36,
                      color: AppColors.backgroundColorLastEdition,
                    ),
                    Positioned(
                      left: 0,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(top: 25),
                                width: 190,
                                height: 251.72,
                                child: ImageShimmer(
                                  url: edicoes.capa.url,
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18),
                                    child: Text(
                                      '-${edicoes.numberEdition}',
                                      style: TextStyle(
                                        fontFamily: 'TradeGothic',
                                        fontSize: 62,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textColorWhite,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${edicoes.mes}  ${edicoes.ano}',
                                    style: TextStyle(
                                      fontFamily: 'TradeGothic',
                                      fontSize: 25,
                                      // fontWeight: FontWeight.bold,
                                      color: AppColors.textColorWhite,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12, top: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, bottom: 12),
                                  child: TextButton(
                                    onPressed: () {
                                      Modular.to
                                          .pushNamed('/magazine', arguments: {
                                        "url":
                                            'https://piaui.homolog.inf.br/wp-json/customRest/v1/materias-revista?edicao=' +
                                                (controller.lastEdition.id)
                                                    .toString(),
                                        "title": edicoes.numberEdition,
                                        "data":
                                            '${edicoes.mes} de ${edicoes.ano}'
                                      });
                                    },
                                    child: Container(
                                      color: AppColors.textColorWhite,
                                      height: size.height * 0.06,
                                      width: size.width / 2.4,
                                      child: Align(
                                        child: Text(
                                          'Ler agora',
                                          style: TextStyle(
                                            fontFamily: 'Piaui',
                                            color: AppColors.textColorBold,
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
                                  padding: const EdgeInsets.only(
                                      right: 10, bottom: 12),
                                  child: TextButton(
                                    onPressed: () async {
                                      final List<String> listRevista =
                                          new List<String>.from(await widget
                                              .downloads
                                              .getMyList());

                                      if (((listRevista.where((element) =>
                                                  (element ==
                                                      'edicao_' +
                                                          controller
                                                              .lastEdition.id
                                                              .toString())))
                                              .length ==
                                          0)) {
                                        await widget.downloadRevist.download(
                                          controller.lastEdition.id,
                                          edicoes.capa.url,
                                          edicoes.numberEdition,
                                          edicoes.mes,
                                          edicoes.ano,
                                        );
                                        showDialog(
                                          context: context,
                                          builder: (_) => CompleteDownload(
                                              int.parse(controller
                                                  .lastEdition.acf.numberEdition
                                                  .toString()),
                                              edicoes.ano.toString(),
                                              edicoes.mes.toString()),
                                        );
                                      }
                                    },
                                    child: Container(
                                      height: size.height * 0.06,
                                      width: size.width / 2.4,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.textColorWhite,
                                        ),
                                      ),
                                      child: Align(
                                        child: Text(
                                          'Fazer download',
                                          style: TextStyle(
                                            fontFamily: 'Piaui',
                                            color: AppColors.textColorWhite,
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
                          ),
                        ],
                      ),
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
