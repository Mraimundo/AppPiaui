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
    return Row(
      children: [
        Expanded(
          child: Container(
              height: 630,
              color: AppColors.appBackground,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Container(
                  color: Colors.white,
                  child: Observer(builder: (ctx) {
                    if (!controller.isLoading) {
                      return Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                            child: Container(
                              color: Colors.red,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  Image.network(
                                    controller.firstEdition.acf.capa.url,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Container(
                              color: Colors.white,
                              height: 60,
                              child: Align(
                                child: Text(
                                    'Edição #${controller.firstEdition.acf.numberEdition}: ${controller.firstEdition.acf.mes} de ${controller.firstEdition.acf.ano}'),
                                alignment: Alignment.centerLeft,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                            child: Container(
                              color: AppColors.bottomAppBar,
                              height: 60,
                              child: Align(
                                child: Text(
                                  'Ler revista agora',
                                  style: TextStyle(color: Colors.white),
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
