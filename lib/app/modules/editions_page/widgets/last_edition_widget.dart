import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_session/flutter_session.dart';
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
    extends ModularState<LastEditionWidget, EditionPageController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // double vHeight = MediaQuery.of(context).size.height;
    // double vWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Expanded(
          child: Container(child: Container(
            child: Observer(builder: (ctx) {
              if (!controller.isLoading) {
                Acf edicoes = controller.lastEdition.acf;

                return Stack(children: [
                  Container(
                    margin: const EdgeInsets.only(top: 100, bottom: 25),
                    width: size.width,
                    height: size.height * 0.36,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  Positioned(
                    left: 15,
                    child: Column(
                      children: [
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
                                    color: Theme.of(context).primaryColor,
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
                              TextButton(
                                onPressed: () async {
                                  Modular.to.pushNamed('/magazine', arguments: {
                                    "url":
                                        'https://piaui.homolog.inf.br/wp-json/customRest/v1/materias-revista?edicao=' +
                                            (controller.lastEdition.id)
                                                .toString(),
                                    "title": edicoes.numberEdition,
                                    "data": '${edicoes.mes} de ${edicoes.ano}'
                                  });
                                },
                                child: Container(
                                  color: AppColors.backgroundColorLastEdition,
                                  height: size.height * 0.06,
                                  width: size.width / 2.5,
                                  child: Align(
                                    child: Text(
                                      'Experimente',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Modular.to.pushNamed('/login');
                                },
                                child: Container(
                                  height: size.height * 0.06,
                                  width: size.width / 2.5,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.textColorWhite,
                                    ),
                                  ),
                                  child: Align(
                                    child: Text(
                                      'Já sou assinante',
                                      style: TextStyle(
                                        color: AppColors.textColorWhite,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]);
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
