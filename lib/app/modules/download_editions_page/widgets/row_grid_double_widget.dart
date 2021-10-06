import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/download_editions_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/download_editions_page/widgets/bottom_download_widget.dart';
import 'package:piaui_app/app/modules/download_editions_page/components/image_shimmer.dart';
import 'package:piaui_app/app/modules/download_editions_page/widgets/bottom_orange_widget.dart';
import 'package:piaui_app/app/shared/downloads/model/revist_download.dart';

class RowGridDoubleWidget extends StatefulWidget {
  final RevistDownload revist;
  final RevistDownload revist2;

  const RowGridDoubleWidget({Key key, this.revist, this.revist2})
      : super(key: key);

  @override
  _RowGridDoubleWidgetState createState() =>
      _RowGridDoubleWidgetState(revist, revist2);
}

class _RowGridDoubleWidgetState extends State<RowGridDoubleWidget> {
  final RevistDownload revist;
  final RevistDownload revist2;

  _RowGridDoubleWidgetState(this.revist, this.revist2);

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
/*     RevistDownload editionPair = controller.revistDownloads[widget.index];
    RevistDownload editionOdd = controller.revistDownloads[widget.index + 1]; */
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
                            arguments: {"revist": revist});
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
                                child: ImageShimmer(url: revist.capa),
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
                                          'Edição  #${revist.numberEdition}: ${revist.mes} de ${revist.ano}',
                                          style: TextStyle(
                                              fontFamily: 'Piaui',
                                              fontSize: rowFontsize,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Align(
                                        alignment: Alignment.centerLeft,
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
                                      revist: revist,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: ButtomDownLoadWidget(
                                      id: revist.edicao.toString(),
                                      numberEdition:
                                          revist.numberEdition.toString(),
                                      month: revist.mes.toString(),
                                      year: revist.mes,
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
                            arguments: {"revist": revist2});
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
                                child: ImageShimmer(url: revist2.capa),
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
                                          'Ediçãoo #${revist2.numberEdition}: ${revist2.mes} de ${revist2.ano}',
                                          style: TextStyle(
                                              fontFamily: 'Piaui',
                                              fontSize: rowFontsize,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .primaryColor),
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
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  ButtomOrangeWidget(revist: revist2),
                                  ButtomDownLoadWidget(
                                    id: revist2.edicao.toString(),
                                    numberEdition:
                                        revist2.numberEdition.toString(),
                                    month: revist2.mes.toString(),
                                    year: revist2.mes,
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
