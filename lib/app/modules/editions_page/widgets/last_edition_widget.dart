import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
                                      fontSize: 58,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textColorWhite,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 22),
                                  child: Text(
                                    '${edicoes.mes}  ${edicoes.ano}',
                                    style: TextStyle(
                                      fontFamily: 'TradeGothic',
                                      fontSize: 20,
                                      color: AppColors.textColorWhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () async {
                                  Modular.to.pushNamed('/magazine', arguments: {
                                    "url":
                                        '/wp-json/customRest/v1/materias-revista?edicao=' +
                                            (controller.lastEdition.id)
                                                .toString(),
                                    "title": edicoes.numberEdition,
                                    "data": '${edicoes.mes} de ${edicoes.ano}'
                                  });
                                },
                                child: Container(
                                  color: AppColors.textColorWhite,

                                  // color: Theme.of(context).primaryColor,
                                  height: size.height * 0.06,
                                  width: size.width / 2.5,
                                  child: Align(
                                    child: Text(
                                      'Experimente',
                                      style: TextStyle(
                                        fontFamily: 'TradeGothic',
                                        fontSize: 18,
                                        color: AppColors
                                            .backgroundColorLastEdition,
                                        // color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: TextButton(
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
                                        'J?? sou assinante',
                                        style: TextStyle(
                                          fontFamily: 'TradeGothic',
                                          fontSize: 18,
                                          color: AppColors.textColorWhite,
                                          fontWeight: FontWeight.bold,
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
