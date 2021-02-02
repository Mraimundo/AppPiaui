import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/edition_page/components/image_shimmer.dart';
import 'package:piaui_app/app/modules/edition_page/components/skeleton_last_edition.dart';
import 'package:piaui_app/app/modules/edition_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/edition_page/model/edition_model.dart';
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
              color: AppColors.appBackground,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Container(
                  color: Colors.white,
                  child: Observer(builder: (ctx) {
                    if (!controller.isLoading) {
                      Acf edicoes = controller.lastEdition.acf;
                      return Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                            child: Container(
                              color: Colors.grey,
                              height: vHeight * 0.6,
                              width: vWidth,
                              child: ImageShimmer(url: edicoes.capa.url),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                            child: Container(
                              color: Colors.white,
                              child: Align(
                                child: Text(
                                  'Edição #${edicoes.numberEdition}: ${edicoes.mes} de ${edicoes.ano}',
                                  style: TextStyle(fontSize: 25),
                                ),
                                alignment: Alignment.centerLeft,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FlatButton(
                                  onPressed: () {},
                                  padding: EdgeInsets.zero,
                                  child: Container(
                                    color: AppColors.bottomAppBar,
                                    height: vHeight * 0.08,
                                    width: vWidth / 2.7,
                                    child: Align(
                                      child: Text(
                                        'Comprar R\$28',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),
                                FlatButton(
                                  onPressed: () {},
                                  padding: EdgeInsets.zero,
                                  child: Container(
                                    color: AppColors.darkButton,
                                    height: vHeight * 0.08,
                                    width: vWidth / 2.7,
                                    child: Align(
                                      child: Text(
                                        'Ler prévia',
                                        style: TextStyle(
                                            color: Colors.white,
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
                ),
              )),
        ),
      ],
    );
  }
}
