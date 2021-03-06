import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/download_editions_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/editions_page/components/image_shimmer.dart';
import 'package:piaui_app/app/modules/editions_page/components/skeleton_last_edition.dart';
import 'package:piaui_app/app/modules/editions_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/editions_page/model/edition_model.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class LastEditionWidget extends StatefulWidget {
  @override
  _LastEditionWidgetState createState() => _LastEditionWidgetState();
}

class _LastEditionWidgetState
    extends ModularState<LastEditionWidget, DownLoadEditionPageController> {
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
                          'Edi????o #${edicoes.numberEdition}: ${edicoes.mes} de ${edicoes.ano}',
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
                                    '/wp-json/customRest/v1/materias-revista?edicao=' +
                                        (controller.lastEdition.id).toString(),
                                "title": edicoes.numberEdition
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
                            onPressed: () {
                              Modular.to.pushNamed('/magazine');
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
