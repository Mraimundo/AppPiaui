import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/all_editions_page/components/image_shimmer.dart';
import 'package:piaui_app/app/modules/all_editions_page/components/skeleton_row_grid.dart';
import 'package:piaui_app/app/modules/all_editions_page/model/edition_model.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/bottom_download_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/bottom_orange_widget.dart';
import 'package:piaui_app/app/modules/download_editions_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/editions_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/row_grid_double_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/row_grid_single_widget.dart';
import 'package:piaui_app/app/shared/core/custom_dio.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class RowGridWidget extends StatefulWidget {
  @override
  _RowGridWidgetState createState() => _RowGridWidgetState();
}

class _RowGridWidgetState extends State<RowGridWidget> {
  Future<List<EditionModel>> _editions;

  @override
  void initState() {
    super.initState();
    _editions = findByPage(0);
  }

  void _add() async {
    setState(() {
      _editions = findByPage(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FutureBuilder<List<EditionModel>>(
          future: _editions,
          builder: (BuildContext context,
              AsyncSnapshot<List<EditionModel>> snapshot) {
            List<Widget> content = <Widget>[];
            final double rowHeight = 255;
            final double rowWidth = MediaQuery.of(context).size.width / 2.2;
            final double rowFontsize = 12;
            const framePadding = EdgeInsets.fromLTRB(0, 8, 0, 8);
            CrossAxisAlignment columAlignH = CrossAxisAlignment.center;
            MainAxisAlignment columAlignV = MainAxisAlignment.end;
            CrossAxisAlignment rowAlignV = CrossAxisAlignment.center;
            MainAxisAlignment rowAlignH = MainAxisAlignment.spaceEvenly;
            if (snapshot.hasData) {
              int items = snapshot.data.length;
              print(snapshot.data[0].acf.numberEdition);
              if (items % 2 == 0) {
                for (var i = 0; i < items; i += 2) {
                  content.add(Row(
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
                                          child: ImageShimmer(
                                              url: snapshot
                                                  .data[i].acf.capa.url),
                                        ),
                                        Container(
                                          height: rowHeight * 0.15,
                                          width: rowWidth * 0.92,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Edição  #${snapshot.data[i].acf.numberEdition}: ${snapshot.data[i].acf.mes} de ${snapshot.data[i].acf.ano}',
                                              style: TextStyle(
                                                  fontFamily: 'Piaui',
                                                  fontSize: rowFontsize,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            ButtomOrangeWidget(
                                                id: snapshot.data[i].id
                                                    .toString(),
                                                edicao: snapshot
                                                    .data[i].acf.numberEdition,
                                                data:
                                                    '${snapshot.data[i].acf.mes} de ${snapshot.data[i].acf.ano}'),
                                            ButtomDownLoadWidget(
                                                id: snapshot.data[i].id,
                                                capa: snapshot
                                                    .data[i].acf.capa.url,
                                                numberEdition: snapshot
                                                    .data[i].acf.numberEdition,
                                                mes: snapshot.data[i].acf.mes,
                                                ano: snapshot.data[i].acf.ano)
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
                                          child: ImageShimmer(
                                              url: snapshot
                                                  .data[i + 1].acf.capa.url),
                                        ),
                                        Container(
                                          height: rowHeight * 0.15,
                                          width: rowWidth * 0.92,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Edição #${snapshot.data[i + 1].acf.numberEdition}: ${snapshot.data[i + 1].acf.mes} de ${snapshot.data[i + 1].acf.ano}',
                                              style: TextStyle(
                                                  fontFamily: 'Piaui',
                                                  fontSize: rowFontsize,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            ButtomOrangeWidget(
                                              id: snapshot.data[i + 1].id
                                                  .toString(),
                                              edicao: snapshot.data[i + 1].acf
                                                  .numberEdition,
                                              data:
                                                  '${snapshot.data[i + 1].acf.mes} de ${snapshot.data[i + 1].acf.ano}',
                                            ),
                                            ButtomDownLoadWidget(
                                                id: snapshot.data[i + 1].id,
                                                capa: snapshot
                                                    .data[i + 1].acf.capa.url,
                                                numberEdition: snapshot
                                                    .data[i + 1]
                                                    .acf
                                                    .numberEdition,
                                                mes: snapshot
                                                    .data[i + 1].acf.mes,
                                                ano: snapshot
                                                    .data[i + 1].acf.ano)
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
                  ));
                }
              } else {
                for (var i = 1; i < items - 1; i += 2) {
                  content.add(Row(
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
                                          child: ImageShimmer(
                                              url: snapshot
                                                  .data[i].acf.capa.url),
                                        ),
                                        Container(
                                          height: rowHeight * 0.15,
                                          width: rowWidth * 0.92,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Edição  #${snapshot.data[i].acf.numberEdition}: ${snapshot.data[i].acf.mes} de ${snapshot.data[i].acf.ano}',
                                              style: TextStyle(
                                                  fontFamily: 'Piaui',
                                                  fontSize: rowFontsize,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            ButtomOrangeWidget(
                                                id: snapshot.data[i].id
                                                    .toString(),
                                                edicao: snapshot
                                                    .data[i].acf.numberEdition,
                                                data:
                                                    '${snapshot.data[i].acf.mes} de ${snapshot.data[i].acf.ano}'),
                                            ButtomDownLoadWidget(
                                                id: snapshot.data[i].id,
                                                capa: snapshot
                                                    .data[i].acf.capa.url,
                                                numberEdition: snapshot
                                                    .data[i].acf.numberEdition,
                                                mes: snapshot.data[i].acf.mes,
                                                ano: snapshot.data[i].acf.ano)
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
                                          child: ImageShimmer(
                                              url: snapshot
                                                  .data[i + 1].acf.capa.url),
                                        ),
                                        Container(
                                          height: rowHeight * 0.15,
                                          width: rowWidth * 0.92,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Edição #${snapshot.data[i + 1].acf.numberEdition}: ${snapshot.data[i + 1].acf.mes} de ${snapshot.data[i + 1].acf.ano}',
                                              style: TextStyle(
                                                  fontFamily: 'Piaui',
                                                  fontSize: rowFontsize,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            ButtomOrangeWidget(
                                              id: snapshot.data[i + 1].id
                                                  .toString(),
                                              edicao: snapshot.data[i + 1].acf
                                                  .numberEdition,
                                              data:
                                                  '${snapshot.data[i + 1].acf.mes} de ${snapshot.data[i + 1].acf.ano}',
                                            ),
                                            ButtomDownLoadWidget(
                                                id: snapshot.data[i + 1].id,
                                                capa: snapshot
                                                    .data[i + 1].acf.capa.url,
                                                numberEdition: snapshot
                                                    .data[i + 1]
                                                    .acf
                                                    .numberEdition,
                                                mes: snapshot
                                                    .data[i + 1].acf.mes,
                                                ano: snapshot
                                                    .data[i + 1].acf.ano)
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
                  ));
                }
                content.add(Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: AppColors.appBackground,
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
                                        child: ImageShimmer(
                                            url: snapshot
                                                .data[items].acf.capa.url),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        height: rowHeight * 0.15,
                                        width: rowWidth * 0.85,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Edição #${snapshot.data[items].acf.numberEdition}: ${snapshot.data[items].acf.mes} de ${snapshot.data[items].acf.ano}',
                                            style: TextStyle(
                                                fontSize: rowFontsize),
                                          ),
                                        ),
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
                ));
              }

              return Column(children: content);
            } else {
              return SkeletonRowGrid();
            }
          },
        ),
      ],
    );
  }

  Future<List<EditionModel>> findByPage(int page) async {
    List<EditionModel> editions = <EditionModel>[];
    final _url = '/wp-json/acf/v3/edicao?page=$page';
    var dio = CustomDio().instance;
    try {
      var response = await dio.get(_url);

      if (response.statusCode == 200) {
        for (var json in response.data) {
          final singleEdition = EditionModel.fromJson(json);
          editions.add(singleEdition);
        }
      }
    } catch (error) {
      print("Error: " + error.toString());
    }
    return editions;
  }
}
