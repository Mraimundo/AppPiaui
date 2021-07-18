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
                print('vHeight $vHeight');
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
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
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Modular.to.pushNamed('/downloads');
                            },
                            child: Container(
                              color: AppColors.orangePiaui,
                              height: vHeight * 0.06,
                              width: vWidth / 2.5,
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
                              Modular.to.pushNamed('/magazine');
                            },
                            child: Container(
                              height: vHeight * 0.06,
                              width: vWidth / 2.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.orangePiaui,
                                ),
                              ),
                              child: Align(
                                child: Text(
                                  'Já sou assinante',
                                  style: TextStyle(
                                      color: AppColors.orangePiaui,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                alignment: Alignment.center,
                              ),
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
