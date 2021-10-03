import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/download_editions_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/download_editions_page/widgets/bottom_download_widget.dart';
import 'package:piaui_app/app/modules/download_editions_page/components/image_shimmer.dart';
import 'package:piaui_app/app/modules/download_editions_page/widgets/bottom_orange_widget.dart';
import 'package:piaui_app/app/shared/downloads/model/revist_download.dart';

class RowGridDoubleWidget extends StatefulWidget {
  final int index;

  const RowGridDoubleWidget({Key key, this.index}) : super(key: key);

  @override
  _RowGridDoubleWidgetState createState() => _RowGridDoubleWidgetState();
}

class _RowGridDoubleWidgetState
    extends ModularState<RowGridDoubleWidget, DownLoadEditionPageController> {
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
    RevistDownload editionPair = controller.revistDownloads[widget.index];
    RevistDownload editionOdd = controller.revistDownloads[widget.index + 1];
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
                  Material(
                    child: InkWell(
                      onTap: () {
                        Modular.to.pushNamed('/magazine_downloads',
                            arguments: {"revist": editionPair});
                        /*   Navigator.of(context).push(MaterialPageRoute(builder: (builder) {
          return InsideMagazinePage(controller.revistDownloads[widget.index]);
        })); */
                      },
                      child: Padding(
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
                                child: ImageShimmer(url: editionPair.capa),
                              ),
                              Container(
                                height: rowHeight * 0.15,
                                width: rowWidth * 0.92,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 7),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          /* 'Edição  #${editionPair.numberEdition}: ${editionPair.mes} de ${editionPair.ano}' */ editionPair
                                              .toString(),
                                          style: TextStyle(
                                            fontFamily: 'Piaui',
                                            fontSize: rowFontsize,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Baixado (36 MB)',
                                          style: TextStyle(
                                            fontFamily: 'Palatino',
                                            fontSize: 11.5,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: ButtomOrangeWidget(
                                      revist: editionPair,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: ButtomDownLoadWidget(
                                      id: editionPair.edicao.toString(),
                                      numberEdition:
                                          editionPair.numberEdition.toString(),
                                      month: editionPair.mes.toString(),
                                      year: editionPair.mes,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    child: InkWell(
                      onTap: () {
                        Modular.to.pushNamed('/magazine_downloads',
                            arguments: {"revist": editionOdd});
                        /*   Navigator.of(context).push(MaterialPageRoute(builder: (builder) {
          return InsideMagazinePage(controller.revistDownloads[widget.index]);
        })); */
                      },
                      child: Padding(
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
                                child: ImageShimmer(url: editionOdd.capa),
                              ),
                              Container(
                                color: Colors.white,
                                height: rowHeight * 0.15,
                                width: rowWidth * 0.92,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 7),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Ediçãoo #${editionOdd.numberEdition}: ${editionOdd.mes} de ${editionOdd.ano}',
                                            style: TextStyle(
                                                fontFamily: 'Piaui',
                                                fontSize: rowFontsize,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Baixado (36 MB)',
                                          style: TextStyle(
                                            fontFamily: 'Palatino',
                                            fontSize: 11.5,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  ButtomOrangeWidget(revist: editionOdd),
                                  ButtomDownLoadWidget(
                                    id: editionOdd.edicao.toString(),
                                    numberEdition:
                                        editionOdd.numberEdition.toString(),
                                    month: editionOdd.mes.toString(),
                                    year: editionOdd.mes,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
