import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/shared/components/app_bar_default_widget.dart';
import 'package:piaui_app/app/shared/components/bottom_app_bar_widget.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'edition_page_controller.dart';

class EditionPagePage extends StatefulWidget {
  final String title;
  const EditionPagePage({Key key, this.title = "EditionPage"})
      : super(key: key);

  @override
  _EditionPagePageState createState() => _EditionPagePageState();
}

class _EditionPagePageState
    extends ModularState<EditionPagePage, EditionPageController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarDefaultWidget(),
        body: Stack(
          children: [
            LayoutBuilder(
              builder:
                  (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight,
                    ),
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: [
                            Container(
                              height: 80,
                              color: Colors.white,
                              child: Text(
                                  'Dummie text, heigh of BottomAppBarWidget'),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 60,
                                    color: AppColors.appBackground,
                                    child: Align(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                            'Voltar para a biblioteca de revistas'),
                                      ),
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      height: 630,
                                      color: AppColors.appBackground,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 0, 16, 0),
                                        child: Container(
                                          color: Colors.white,
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        32, 32, 32, 0),
                                                child: Container(
                                                  color: Colors.red,
                                                  height: 420,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 32),
                                                child: Container(
                                                  color: Colors.white,
                                                  height: 60,
                                                  child: Align(
                                                    child: Text(
                                                        'Edição #172: Janeiro de 2021'),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        32, 0, 32, 16),
                                                child: Container(
                                                  color: AppColors.bottomAppBar,
                                                  height: 60,
                                                  child: Align(
                                                    child: Text(
                                                      'Ler revista agora',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    alignment: Alignment.center,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 80,
                                    color: AppColors.appBackground,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Align(
                                        child: Text('Mais edições'),
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 600,
                                    color: Colors.red,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Align(
                                        child: Text('Mais edições'),
                                        alignment: Alignment.centerLeft,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 80,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Align(
                                        child: Text('Carregar mais'),
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.topCenter,
              child: BottomAppBarWidget(),
            ),
          ],
        ));
  }
}
