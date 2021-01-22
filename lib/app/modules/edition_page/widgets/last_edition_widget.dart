import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/edition_page/edition_page_controller.dart';
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
                      print('VHeight = ' + vHeight.toString());
                      return Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                            child: Container(
                              color: Colors.red,
                              height: vHeight * 0.6,
                              width: vWidth,
                              child: Image.network(
                                controller.lastEdition.acf.capa.url,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(32),
                            child: Container(
                              color: Colors.white,
                              child: Align(
                                child: Text(
                                  'Edição #${controller.lastEdition.acf.numberEdition}: ${controller.lastEdition.acf.mes} de ${controller.lastEdition.acf.ano}',
                                  style: TextStyle(fontSize: 20),
                                ),
                                alignment: Alignment.centerLeft,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                            child: Container(
                              color: AppColors.bottomAppBar,
                              height: vHeight * 0.08,
                              child: Align(
                                child: Text(
                                  'Ler revista agora',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      //You'll put a shimmer here!
                      return Text('');
                    }
                  }),
                ),
              )),
        ),
      ],
    );
  }
}
