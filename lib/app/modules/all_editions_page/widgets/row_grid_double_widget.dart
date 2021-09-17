import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/bottom_download_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/components/image_shimmer.dart';
import 'package:piaui_app/app/modules/editions_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/editions_page/model/edition_model.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/bottom_orange_widget.dart';

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
    final double rowHeight = 255;
    final double rowWidth = MediaQuery.of(context).size.width / 2.2;
    final double rowFontsize = 12;
    const framePadding = EdgeInsets.fromLTRB(0, 8, 0, 8);
    CrossAxisAlignment columAlignH = CrossAxisAlignment.center;
    MainAxisAlignment columAlignV = MainAxisAlignment.end;
    CrossAxisAlignment rowAlignV = CrossAxisAlignment.center;
    MainAxisAlignment rowAlignH = MainAxisAlignment.spaceEvenly;
    Acf editionPair = controller.editionsSinglePage[widget.index].acf;
    Acf editionOdd = controller.editionsSinglePage[widget.index + 1].acf;
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: rowAlignV,
                mainAxisAlignment: rowAlignH,
                children: [
                  Padding(
                    padding: framePadding,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: columAlignH,
                        mainAxisAlignment: columAlignV,
                        children: [
                          Container(
                            color: Colors.grey,
                            height: rowHeight * 0.80,
                            width: rowWidth * 0.92,
                            child: ImageShimmer(url: editionPair.capa.url),
                          ),
                          Container(
                            height: rowHeight * 0.15,
                            width: rowWidth * 0.92,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Edição  #${editionPair.numberEdition}: ${editionPair.mes} de ${editionPair.ano}',
                                style: TextStyle(
                                    fontFamily: 'Piaui',
                                    fontSize: rowFontsize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              ButtomOrangeWidget(),
                              ButtomDownLoadWidget()
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: framePadding,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: columAlignH,
                        mainAxisAlignment: columAlignV,
                        children: [
                          Container(
                            color: Colors.grey,
                            height: rowHeight * 0.80,
                            width: rowWidth * 0.92,
                            child: ImageShimmer(url: editionOdd.capa.url),
                          ),
                          Container(
                            color: Colors.white,
                            height: rowHeight * 0.15,
                            width: rowWidth * 0.92,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Edição #${editionOdd.numberEdition}: ${editionOdd.mes} de ${editionOdd.ano}',
                                style: TextStyle(
                                    fontFamily: 'Piaui',
                                    fontSize: rowFontsize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              ButtomOrangeWidget(),
                              ButtomDownLoadWidget()
                            ],
                          ),
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
