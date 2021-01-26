import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/edition_page/components/image_shimmer.dart';
import 'package:piaui_app/app/modules/edition_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/edition_page/model/edition_model.dart';

class RowGridDoubleWidget extends StatefulWidget {
  final int index;

  const RowGridDoubleWidget({Key key, this.index}) : super(key: key);

  @override
  _RowGridDoubleWidgetState createState() => _RowGridDoubleWidgetState();
}

class _RowGridDoubleWidgetState
    extends ModularState<RowGridDoubleWidget, EditionPageController> {
  @override
  Widget build(BuildContext context) {
    final double rowHeight = 250;
    final double rowWidth = MediaQuery.of(context).size.width / 2.2;
    final double rowFontsize = 11;
    const framePadding = EdgeInsets.fromLTRB(0, 8, 0, 8);
    CrossAxisAlignment columAlignH = CrossAxisAlignment.center;
    MainAxisAlignment columAlignV = MainAxisAlignment.end;
    CrossAxisAlignment rowAlignV = CrossAxisAlignment.center;
    MainAxisAlignment rowAlignH = MainAxisAlignment.spaceEvenly;
    Acf editionPair = controller.editions[widget.index].acf;
    Acf editionOdd = controller.editions[widget.index+1].acf;
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.blue,
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: rowAlignV,
                mainAxisAlignment: rowAlignH,
                children: [
                  Padding(
                    padding: framePadding,
                    child: Container(
                      color: Colors.white,
                      height: rowHeight,
                      width: rowWidth,
                      child: Column(
                        crossAxisAlignment: columAlignH,
                        mainAxisAlignment: columAlignV,
                        children: [
                          Container(
                            color: Colors.grey,
                            height: rowHeight * 0.80,
                            width: rowWidth * 0.85,
                            child: ImageShimmer(url: editionPair.capa.url),
                          ),
                          Container(
                            color: Colors.white,
                            height: rowHeight * 0.15,
                            width: rowWidth * 0.85,
                            child: Align(
                              child: Text(
                                'Edição ${editionPair.numberEdition}: ${editionPair.mes} de ${editionPair.ano}',
                                style: TextStyle(fontSize: rowFontsize),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: framePadding,
                    child: Container(
                      color: Colors.white,
                      height: rowHeight,
                      width: rowWidth,
                      child: Column(
                        crossAxisAlignment: columAlignH,
                        mainAxisAlignment: columAlignV,
                        children: [
                          Container(
                            color: Colors.grey,
                            height: rowHeight * 0.80,
                            width: rowWidth * 0.85,
                            child: ImageShimmer(url: editionOdd.capa.url),
                          ),
                          Container(
                            color: Colors.white,
                            height: rowHeight * 0.15,
                            width: rowWidth * 0.85,
                            child: Align(
                              child: Text(
                                'Edição ${editionOdd.numberEdition}: ${editionOdd.mes} de ${editionOdd.ano}',
                                style: TextStyle(fontSize: rowFontsize),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
