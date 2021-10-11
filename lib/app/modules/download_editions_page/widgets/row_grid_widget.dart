import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/download_editions_page/components/image_shimmer.dart';
import 'package:piaui_app/app/modules/download_editions_page/components/skeleton_row_grid.dart';
import 'package:piaui_app/app/modules/download_editions_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/download_editions_page/widgets/bottom_download_widget.dart';
import 'package:piaui_app/app/modules/download_editions_page/widgets/bottom_orange_widget.dart';
import 'package:piaui_app/app/modules/editions_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/download_editions_page/widgets/row_grid_double_widget.dart';
import 'package:piaui_app/app/modules/download_editions_page/widgets/row_grid_single_widget.dart';
import 'package:piaui_app/app/modules/inside_magazine/view/inside_magazine_page.dart';
import 'package:piaui_app/app/shared/components/complete_delete/complete_delete.dart';
import 'package:piaui_app/app/shared/downloads/downloads_controller.dart';
import 'package:piaui_app/app/shared/downloads/model/revist_download.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class RowGridWidget extends StatefulWidget {
  @override
  _RowGridWidgetState createState() => _RowGridWidgetState();
}

class _RowGridWidgetState extends State<RowGridWidget> {
  Future<List<RevistDownload>> _revistDownload;

  @override
  void initState() {
    super.initState();
    _revistDownload = listar();
  }

  void _retry() async {
    setState(() {
      _revistDownload = listar();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FutureBuilder<List<RevistDownload>>(
          future: _revistDownload,
          builder: (BuildContext context,
              AsyncSnapshot<List<RevistDownload>> snapshot) {
            if (snapshot.hasData) {
              List<Widget> content = <Widget>[];
              /* return Text('The answer to everything is ${snapshot.data}'); */
              int items = snapshot.data.length;
              if (items % 2 == 0) {
                for (var i = 0; i < items; i += 2) {
                  final double rowHeight = 255;
                  final double rowWidth =
                      MediaQuery.of(context).size.width / 2.2;
                  final double rowFontsize = 12;
                  const framePadding = EdgeInsets.fromLTRB(0, 8, 0, 8);
                  CrossAxisAlignment columAlignH = CrossAxisAlignment.center;
                  MainAxisAlignment columAlignV = MainAxisAlignment.end;
                  CrossAxisAlignment rowAlignV = CrossAxisAlignment.center;
                  MainAxisAlignment rowAlignH = MainAxisAlignment.spaceEvenly;
                  /* content.add(RowGridDoubleWidget(
                      revist: snapshot.data[i], revist2: snapshot.data[i + 1])); */
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
                                Material(
                                  child: InkWell(
                                    onTap: () {
                                      Modular.to.pushNamed(
                                          '/magazine_downloads',
                                          arguments: {
                                            "revist": snapshot.data[i]
                                          });
                                      /* Navigator.of(context).push(
                                          MaterialPageRoute(builder: (builder) {
                                        return InsideMagazinePage();
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
                                              child: ImageShimmer(
                                                  url: snapshot.data[i].capa),
                                            ),
                                            Container(
                                              height: rowHeight * 0.15,
                                              width: rowWidth * 0.92,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 7),
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        'piauí_${snapshot.data[i].numberEdition}: ${snapshot.data[i].mes} de ${snapshot.data[i].ano}',
                                                        style: TextStyle(
                                                            fontFamily: 'Piaui',
                                                            fontSize:
                                                                rowFontsize,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                      ),
                                                    ),
                                                    SizedBox(height: 4),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10),
                                                  child: ButtomOrangeWidget(
                                                    revist: snapshot.data[i],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10),
                                                  child: TextButton(
                                                    onPressed: () async {
                                                      Size size =
                                                          MediaQuery.of(context)
                                                              .size;
                                                      showDialog(
                                                          context: context,
                                                          builder: (contex) {
                                                            return /* CompleteDelete(
                                                                snapshot.data[i]
                                                                    .edicao
                                                                    .toString(),
                                                                snapshot.data[i]
                                                                    .numberEdition
                                                                    .toString(),
                                                                snapshot.data[i]
                                                                    .mes,
                                                                snapshot
                                                                    .data[i].mes
                                                                    .toString()) */
                                                                Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 100),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child:
                                                                    Container(
                                                                  height: size
                                                                      .height,
                                                                  width: size
                                                                      .width,
                                                                  color: Colors
                                                                      .black54,
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Center(
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                350,
                                                                            height:
                                                                                230,
                                                                            color:
                                                                                Theme.of(context).backgroundColor,
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(top: 15),
                                                                                  child: Text(
                                                                                    'Aviso',
                                                                                    style: TextStyle(
                                                                                      color: AppColors.orangePiaui,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontSize: 21,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(top: 20),
                                                                                  child: Container(
                                                                                    width: 300,
                                                                                    child: Column(
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: Alignment.center,
                                                                                          child: RichText(
                                                                                            text: TextSpan(
                                                                                              text: 'Deseja excluir a ',
                                                                                              style: TextStyle(
                                                                                                fontSize: 16,
                                                                                                color: Theme.of(context).primaryColor,
                                                                                              ),
                                                                                              children: <TextSpan>[
                                                                                                TextSpan(text: 'piauí_' + snapshot.data[i].numberEdition.toString() + ': ' + snapshot.data[i].mes.toString() + ' de ' + snapshot.data[i].ano.toString(), style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                                                                                                TextSpan(text: ' ?'),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(top: 20),
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      TextButton(
                                                                                        onPressed: () async {
                                                                                          DownloadsController downloads = DownloadsController();
                                                                                          await downloads.deleteRevist(snapshot.data[i].edicao.toString());
                                                                                          print("edicao_388210");
                                                                                          Navigator.of(context).pop();
                                                                                          _retry();
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 60,
                                                                                          width: 150,
                                                                                          color: AppColors.orangePiaui,
                                                                                          child: Align(
                                                                                            alignment: Alignment.center,
                                                                                            child: Text(
                                                                                              'Excluir',
                                                                                              style: TextStyle(
                                                                                                fontSize: 18,
                                                                                                fontWeight: FontWeight.bold,
                                                                                                color: AppColors.textColorWhite,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      TextButton(
                                                                                        onPressed: () {
                                                                                          Navigator.of(context).pop();
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 60,
                                                                                          width: 150,
                                                                                          decoration: BoxDecoration(
                                                                                            border: Border.all(
                                                                                              color: AppColors.orangePiaui,
                                                                                            ),
                                                                                          ),
                                                                                          child: Align(
                                                                                            alignment: Alignment.center,
                                                                                            child: Text(
                                                                                              'Cancelar',
                                                                                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.orangePiaui),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          });
                                                    },
                                                    // padding: EdgeInsets.zero,
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.06,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              8,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColorDark,
                                                        ),
                                                      ),
                                                      child: Align(
                                                        child: Image.asset(
                                                          'assets/images/config.png',
                                                        ),
                                                        alignment:
                                                            Alignment.center,
                                                      ),
                                                    ),
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
                                      Modular.to.pushNamed(
                                          '/magazine_downloads',
                                          arguments: {
                                            "revist": snapshot.data[i + 1]
                                          });
                                      /* Navigator.of(context).push(
                                          MaterialPageRoute(builder: (builder) {
                                        return InsideMagazinePage();
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
                                              child: ImageShimmer(
                                                  url: snapshot
                                                      .data[i + 1].capa),
                                            ),
                                            Container(
                                              height: rowHeight * 0.15,
                                              width: rowWidth * 0.92,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 7),
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        'piauí_${snapshot.data[i + 1].numberEdition}: ${snapshot.data[i + 1].mes} de ${snapshot.data[i + 1].ano}',
                                                        style: TextStyle(
                                                            fontFamily: 'Piaui',
                                                            fontSize:
                                                                rowFontsize,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                      ),
                                                    ),
                                                    SizedBox(height: 4),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10),
                                                  child: ButtomOrangeWidget(
                                                    revist:
                                                        snapshot.data[i + 1],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10),
                                                  child: TextButton(
                                                    onPressed: () async {
                                                      Size size =
                                                          MediaQuery.of(context)
                                                              .size;
                                                      showDialog(
                                                          context: context,
                                                          builder: (contex) {
                                                            return /* CompleteDelete(
                                                                snapshot.data[i + 1]
                                                                    .edicao
                                                                    .toString(),
                                                                snapshot.data[i + 1]
                                                                    .numberEdition
                                                                    .toString(),
                                                                snapshot.data[i + 1]
                                                                    .mes,
                                                                snapshot
                                                                    .data[i].mes
                                                                    .toString()) */
                                                                Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 100),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child:
                                                                    Container(
                                                                  height: size
                                                                      .height,
                                                                  width: size
                                                                      .width,
                                                                  color: Colors
                                                                      .black54,
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Center(
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                350,
                                                                            height:
                                                                                230,
                                                                            color:
                                                                                Theme.of(context).backgroundColor,
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(top: 15),
                                                                                  child: Text(
                                                                                    'Aviso',
                                                                                    style: TextStyle(
                                                                                      color: AppColors.orangePiaui,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontSize: 21,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(top: 20),
                                                                                  child: Container(
                                                                                    width: 300,
                                                                                    child: Column(
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: Alignment.center,
                                                                                          child: RichText(
                                                                                            text: TextSpan(
                                                                                              text: 'Deseja excluir a ',
                                                                                              style: TextStyle(
                                                                                                fontSize: 16,
                                                                                                color: Theme.of(context).primaryColor,
                                                                                              ),
                                                                                              children: <TextSpan>[
                                                                                                TextSpan(text: 'piauí_' + snapshot.data[i + 1].numberEdition.toString() + ': ' + snapshot.data[i + 1].mes.toString() + ' de ' + snapshot.data[i + 1].ano.toString(), style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                                                                                                TextSpan(text: ' ?'),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(top: 20),
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      TextButton(
                                                                                        onPressed: () async {
                                                                                          DownloadsController downloads = DownloadsController();
                                                                                          await downloads.deleteRevist(snapshot.data[i + 1].edicao.toString());

                                                                                          Navigator.of(context).pop();
                                                                                          _retry();
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 60,
                                                                                          width: 150,
                                                                                          color: AppColors.orangePiaui,
                                                                                          child: Align(
                                                                                            alignment: Alignment.center,
                                                                                            child: Text(
                                                                                              'Excluir',
                                                                                              style: TextStyle(
                                                                                                fontSize: 18,
                                                                                                fontWeight: FontWeight.bold,
                                                                                                color: AppColors.textColorWhite,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      TextButton(
                                                                                        onPressed: () {
                                                                                          Navigator.of(context).pop();
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 60,
                                                                                          width: 150,
                                                                                          decoration: BoxDecoration(
                                                                                            border: Border.all(
                                                                                              color: AppColors.orangePiaui,
                                                                                            ),
                                                                                          ),
                                                                                          child: Align(
                                                                                            alignment: Alignment.center,
                                                                                            child: Text(
                                                                                              'Cancelar',
                                                                                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.orangePiaui),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          });
                                                    },
                                                    // padding: EdgeInsets.zero,
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.06,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              8,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColorDark,
                                                        ),
                                                      ),
                                                      child: Align(
                                                        child: Image.asset(
                                                          'assets/images/config.png',
                                                        ),
                                                        alignment:
                                                            Alignment.center,
                                                      ),
                                                    ),
                                                  ),
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
                  ));
                }
              } else {
                final double rowHeight = 250;
                final double rowWidth = MediaQuery.of(context).size.width / 2.2;
                final double rowFontsize = 11;
                const framePadding = EdgeInsets.fromLTRB(0, 8, 0, 0);
                CrossAxisAlignment columAlignH = CrossAxisAlignment.center;
                MainAxisAlignment columAlignV = MainAxisAlignment.end;
                CrossAxisAlignment rowAlignV = CrossAxisAlignment.center;
                MainAxisAlignment rowAlignH = MainAxisAlignment.center;
                for (var i = 0; i < items - 1; i += 2) {
                  final double rowHeight = 255;
                  final double rowWidth =
                      MediaQuery.of(context).size.width / 2.2;
                  final double rowFontsize = 12;
                  const framePadding = EdgeInsets.fromLTRB(0, 8, 0, 8);
                  CrossAxisAlignment columAlignH = CrossAxisAlignment.center;
                  MainAxisAlignment columAlignV = MainAxisAlignment.end;
                  CrossAxisAlignment rowAlignV = CrossAxisAlignment.center;
                  MainAxisAlignment rowAlignH = MainAxisAlignment.spaceEvenly;
                  /* content.add(RowGridDoubleWidget(
                      revist: snapshot.data[i], revist2: snapshot.data[i + 1])); */
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
                                Material(
                                  child: InkWell(
                                    onTap: () {
                                      Modular.to.pushNamed(
                                          '/magazine_downloads',
                                          arguments: {
                                            "revist": snapshot.data[i]
                                          });
                                      /* Navigator.of(context).push(
                                          MaterialPageRoute(builder: (builder) {
                                        return InsideMagazinePage();
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
                                              child: ImageShimmer(
                                                  url: snapshot.data[i].capa),
                                            ),
                                            Container(
                                              height: rowHeight * 0.15,
                                              width: rowWidth * 0.92,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 7),
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        'piauí_${snapshot.data[i].numberEdition}: ${snapshot.data[i].mes} de ${snapshot.data[i].ano}',
                                                        style: TextStyle(
                                                            fontFamily: 'Piaui',
                                                            fontSize:
                                                                rowFontsize,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                      ),
                                                    ),
                                                    SizedBox(height: 4),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10),
                                                  child: ButtomOrangeWidget(
                                                    revist: snapshot.data[i],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10),
                                                  child: TextButton(
                                                    onPressed: () async {
                                                      Size size =
                                                          MediaQuery.of(context)
                                                              .size;
                                                      showDialog(
                                                          context: context,
                                                          builder: (contex) {
                                                            return /* CompleteDelete(
                                                                snapshot.data[i]
                                                                    .edicao
                                                                    .toString(),
                                                                snapshot.data[i]
                                                                    .numberEdition
                                                                    .toString(),
                                                                snapshot.data[i]
                                                                    .mes,
                                                                snapshot
                                                                    .data[i].mes
                                                                    .toString()) */
                                                                Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 100),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child:
                                                                    Container(
                                                                  height: size
                                                                      .height,
                                                                  width: size
                                                                      .width,
                                                                  color: Colors
                                                                      .black54,
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Center(
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                350,
                                                                            height:
                                                                                230,
                                                                            color:
                                                                                Theme.of(context).backgroundColor,
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(top: 15),
                                                                                  child: Text(
                                                                                    'Aviso',
                                                                                    style: TextStyle(
                                                                                      color: AppColors.orangePiaui,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontSize: 21,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(top: 20),
                                                                                  child: Container(
                                                                                    width: 300,
                                                                                    child: Column(
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: Alignment.center,
                                                                                          child: RichText(
                                                                                            text: TextSpan(
                                                                                              text: 'Deseja excluir a ',
                                                                                              style: TextStyle(
                                                                                                fontSize: 16,
                                                                                                color: Theme.of(context).primaryColor,
                                                                                              ),
                                                                                              children: <TextSpan>[
                                                                                                TextSpan(text: 'piauí_' + snapshot.data[i].numberEdition.toString() + ': ' + snapshot.data[i].mes.toString() + ' de ' + snapshot.data[i].ano.toString(), style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                                                                                                TextSpan(text: ' ?'),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(top: 20),
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      TextButton(
                                                                                        onPressed: () async {
                                                                                          DownloadsController downloads = DownloadsController();
                                                                                          await downloads.deleteRevist(snapshot.data[i].edicao.toString());
                                                                                          print("edicao_388210");
                                                                                          Navigator.of(context).pop();
                                                                                          _retry();
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 60,
                                                                                          width: 150,
                                                                                          color: AppColors.orangePiaui,
                                                                                          child: Align(
                                                                                            alignment: Alignment.center,
                                                                                            child: Text(
                                                                                              'Excluir',
                                                                                              style: TextStyle(
                                                                                                fontSize: 18,
                                                                                                fontWeight: FontWeight.bold,
                                                                                                color: AppColors.textColorWhite,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      TextButton(
                                                                                        onPressed: () {
                                                                                          Navigator.of(context).pop();
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 60,
                                                                                          width: 150,
                                                                                          decoration: BoxDecoration(
                                                                                            border: Border.all(
                                                                                              color: AppColors.orangePiaui,
                                                                                            ),
                                                                                          ),
                                                                                          child: Align(
                                                                                            alignment: Alignment.center,
                                                                                            child: Text(
                                                                                              'Cancelar',
                                                                                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.orangePiaui),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          });
                                                    },
                                                    // padding: EdgeInsets.zero,
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.06,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              8,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColorDark,
                                                        ),
                                                      ),
                                                      child: Align(
                                                        child: Image.asset(
                                                          'assets/images/config.png',
                                                        ),
                                                        alignment:
                                                            Alignment.center,
                                                      ),
                                                    ),
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
                                      Modular.to.pushNamed(
                                          '/magazine_downloads',
                                          arguments: {
                                            "revist": snapshot.data[i + 1]
                                          });
                                      /* Navigator.of(context).push(
                                          MaterialPageRoute(builder: (builder) {
                                        return InsideMagazinePage();
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
                                              child: ImageShimmer(
                                                  url: snapshot
                                                      .data[i + 1].capa),
                                            ),
                                            Container(
                                              height: rowHeight * 0.15,
                                              width: rowWidth * 0.92,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 7),
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        'piauí_${snapshot.data[i + 1].numberEdition}: ${snapshot.data[i + 1].mes} de ${snapshot.data[i + 1].ano}',
                                                        style: TextStyle(
                                                            fontFamily: 'Piaui',
                                                            fontSize:
                                                                rowFontsize,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                      ),
                                                    ),
                                                    SizedBox(height: 4),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10),
                                                  child: ButtomOrangeWidget(
                                                    revist:
                                                        snapshot.data[i + 1],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10),
                                                  child: TextButton(
                                                    onPressed: () async {
                                                      Size size =
                                                          MediaQuery.of(context)
                                                              .size;
                                                      showDialog(
                                                          context: context,
                                                          builder: (contex) {
                                                            return /* CompleteDelete(
                                                                snapshot.data[i + 1]
                                                                    .edicao
                                                                    .toString(),
                                                                snapshot.data[i + 1]
                                                                    .numberEdition
                                                                    .toString(),
                                                                snapshot.data[i + 1]
                                                                    .mes,
                                                                snapshot
                                                                    .data[i].mes
                                                                    .toString()) */
                                                                Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 100),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child:
                                                                    Container(
                                                                  height: size
                                                                      .height,
                                                                  width: size
                                                                      .width,
                                                                  color: Colors
                                                                      .black54,
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Center(
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                350,
                                                                            height:
                                                                                230,
                                                                            color:
                                                                                Theme.of(context).backgroundColor,
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(top: 15),
                                                                                  child: Text(
                                                                                    'Aviso',
                                                                                    style: TextStyle(
                                                                                      color: AppColors.orangePiaui,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontSize: 21,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(top: 20),
                                                                                  child: Container(
                                                                                    width: 300,
                                                                                    child: Column(
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: Alignment.center,
                                                                                          child: RichText(
                                                                                            text: TextSpan(
                                                                                              text: 'Deseja excluir a ',
                                                                                              style: TextStyle(
                                                                                                fontSize: 16,
                                                                                                color: Theme.of(context).primaryColor,
                                                                                              ),
                                                                                              children: <TextSpan>[
                                                                                                TextSpan(text: 'piauí_' + snapshot.data[i + 1].numberEdition.toString() + ': ' + snapshot.data[i + 1].mes.toString() + ' de ' + snapshot.data[i + 1].ano.toString(), style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                                                                                                TextSpan(text: ' ?'),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(top: 20),
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      TextButton(
                                                                                        onPressed: () async {
                                                                                          DownloadsController downloads = DownloadsController();
                                                                                          await downloads.deleteRevist(snapshot.data[i + 1].edicao.toString());

                                                                                          Navigator.of(context).pop();
                                                                                          _retry();
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 60,
                                                                                          width: 150,
                                                                                          color: AppColors.orangePiaui,
                                                                                          child: Align(
                                                                                            alignment: Alignment.center,
                                                                                            child: Text(
                                                                                              'Excluir',
                                                                                              style: TextStyle(
                                                                                                fontSize: 18,
                                                                                                fontWeight: FontWeight.bold,
                                                                                                color: AppColors.textColorWhite,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      TextButton(
                                                                                        onPressed: () {
                                                                                          Navigator.of(context).pop();
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 60,
                                                                                          width: 150,
                                                                                          decoration: BoxDecoration(
                                                                                            border: Border.all(
                                                                                              color: AppColors.orangePiaui,
                                                                                            ),
                                                                                          ),
                                                                                          child: Align(
                                                                                            alignment: Alignment.center,
                                                                                            child: Text(
                                                                                              'Cancelar',
                                                                                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.orangePiaui),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          });
                                                    },
                                                    // padding: EdgeInsets.zero,
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.06,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              8,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColorDark,
                                                        ),
                                                      ),
                                                      child: Align(
                                                        child: Image.asset(
                                                          'assets/images/config.png',
                                                        ),
                                                        alignment:
                                                            Alignment.center,
                                                      ),
                                                    ),
                                                  ),
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
                  ));
                }

                content.add(Material(
                  child: InkWell(
                    onTap: () {
                      Modular.to.pushNamed('/magazine_downloads',
                          arguments: {"revist": snapshot.data[items - 1]});
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
                              child: ImageShimmer(
                                  url: snapshot.data[items - 1].capa),
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
                                        'piauí_${snapshot.data[items - 1].numberEdition}: ${snapshot.data[items - 1].mes} de ${snapshot.data[items - 1].ano}',
                                        style: TextStyle(
                                            fontFamily: 'Piaui',
                                            fontSize: rowFontsize,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Theme.of(context).primaryColor),
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
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ButtomOrangeWidget(
                                    revist: snapshot.data[items - 1]),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: TextButton(
                                    onPressed: () async {
                                      Size size = MediaQuery.of(context).size;
                                      showDialog(
                                          context: context,
                                          builder: (contex) {
                                            return /* CompleteDelete(
                                                                snapshot.data[i]
                                                                    .edicao
                                                                    .toString(),
                                                                snapshot.data[i]
                                                                    .numberEdition
                                                                    .toString(),
                                                                snapshot.data[i]
                                                                    .mes,
                                                                snapshot
                                                                    .data[i].mes
                                                                    .toString()) */
                                                Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 100),
                                              child: SingleChildScrollView(
                                                child: Container(
                                                  height: size.height,
                                                  width: size.width,
                                                  color: Colors.black54,
                                                  child: Container(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Center(
                                                          child: Container(
                                                            width: 350,
                                                            height: 230,
                                                            color: Theme.of(
                                                                    context)
                                                                .backgroundColor,
                                                            child: Column(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 15),
                                                                  child: Text(
                                                                    'Aviso',
                                                                    style:
                                                                        TextStyle(
                                                                      color: AppColors
                                                                          .orangePiaui,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          21,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 20),
                                                                  child:
                                                                      Container(
                                                                    width: 300,
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Align(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          child:
                                                                              RichText(
                                                                            text:
                                                                                TextSpan(
                                                                              text: 'Deseja excluir a ',
                                                                              style: TextStyle(
                                                                                fontSize: 16,
                                                                                color: Theme.of(context).primaryColor,
                                                                              ),
                                                                              children: <TextSpan>[
                                                                                TextSpan(text: 'piauí_' + snapshot.data[items - 1].numberEdition.toString() + ': ' + snapshot.data[items - 1].mes.toString() + ' de ' + snapshot.data[items - 1].ano.toString(), style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                                                                                TextSpan(text: ' ?'),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 20),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () async {
                                                                          DownloadsController
                                                                              downloads =
                                                                              DownloadsController();
                                                                          await downloads.deleteRevist(snapshot
                                                                              .data[items - 1]
                                                                              .edicao
                                                                              .toString());
                                                                          print(
                                                                              "edicao_388210");
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                          _retry();
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              60,
                                                                          width:
                                                                              150,
                                                                          color:
                                                                              AppColors.orangePiaui,
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                Alignment.center,
                                                                            child:
                                                                                Text(
                                                                              'Excluir',
                                                                              style: TextStyle(
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.bold,
                                                                                color: AppColors.textColorWhite,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              60,
                                                                          width:
                                                                              150,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            border:
                                                                                Border.all(
                                                                              color: AppColors.orangePiaui,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                Alignment.center,
                                                                            child:
                                                                                Text(
                                                                              'Cancelar',
                                                                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.orangePiaui),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    // padding: EdgeInsets.zero,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      width:
                                          MediaQuery.of(context).size.width / 8,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                        ),
                                      ),
                                      child: Align(
                                        child: Image.asset(
                                          'assets/images/config.png',
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
}

Future<List<RevistDownload>> listar() async {
  DownloadsController downloads = DownloadsController();
  return await downloads.populateList();
}
