import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:piaui_app/app/modules/all_editions_page/components/image_shimmer.dart';
import 'package:piaui_app/app/modules/all_editions_page/components/skeleton_row_grid.dart';
import 'package:piaui_app/app/modules/all_editions_page/model/edition_model.dart';
import 'package:piaui_app/app/modules/all_editions_page/utils/utils.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/border_top_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/bottom_download_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/bottom_orange_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/filter_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/last_edition_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/load_more_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/row_grid_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/select_Year_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/select_edition_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/select_month_widget.dart';
import 'package:piaui_app/app/shared/components/app_bar/login/model/auth_user.dart';
import 'package:piaui_app/app/shared/core/custom_dio.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'package:piaui_app/app/shared/providers/ThemeChanger.dart';
import 'package:provider/provider.dart';

class ListMagazine extends StatefulWidget {
  final Dados user;
  ThemeChanger themeChanger;
  bool systemIsDark;

  ListMagazine({Key key, this.user}) : super(key: key);

  @override
  _ListMagazine createState() => _ListMagazine(this.user);
}

class _ListMagazine extends State<ListMagazine> {
  int page = 1;
  int first = 1;
  Dados user;
  _ListMagazine(this.user);
  Future<List<EditionModel>> _editions;
  List<Widget> content = <Widget>[];
  List<EditionModel> allEditions = [];
  String m = "0";
  String y = "0";
  String mes = "Mês";
  String ano = "Ano";
  bool isDark = false;

  @override
  void initState() {
    super.initState();
    /* WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.themeChanger.setDarkStatus(widget.systemIsDark);
    }); */
    content = <Widget>[];
    _editions = findByPage(page);
  }

  void _addPage() async {
    setState(() {
      page++;
      _editions = findByPage(page);
    });
  }

  void _selectMonthAndYear(String month, String year) async {
    setState(() {
      if (month != "0") {
        m = month;
      }
      if (year != "0") {
        y = year;
      }

      content = <Widget>[];
      _editions = findByMonthAndYear(m, y);
    });
  }

  void _selectEdition() async {
    setState(() {
      content = <Widget>[];
      page = 1;
      _editions = findByPage(page);
      y = "0";
      m = "0";
      ano = "Ano";
      mes = "Mês";
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.themeChanger = Provider.of<ThemeChanger>(context, listen: false);
    widget.systemIsDark =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    int cont = 0;

    if (isDark != widget.themeChanger.isDark()) {
      isDark = widget.themeChanger.isDark();
      _selectEdition();
    }

    return Container(
      child: Stack(
        children: [
          LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 23),
                          child: Center(
                            child: Text(
                              'Bem-vindo à piauí,  ' + user.nome,
                              style: TextStyle(
                                height: 1.3,
                                fontFamily: 'Piaui',
                                fontSize: 17.5,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 21, right: 25, left: 25, bottom: 25),
                        child: BorderTopWidget(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 25,
                          right: 25,
                        ),
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.internalBorderColor,
                            ),
                          ),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: SelectEditionWidget(
                                    onTap: () {
                                      _selectEdition();
                                    },
                                  ),
                                ),
                                Container(
                                    child: Expanded(
                                  flex: 2,
                                  child: InkWell(
                                    onTap: () {
                                      int selectedMonth;
                                      List<String> values = [
                                        'Selecione o Mês',
                                        'Janeiro',
                                        'Fevereiro',
                                        'Março',
                                        'Abril',
                                        'Maio',
                                        'Junho',
                                        'Julho',
                                        'Agosto',
                                        'Setembro',
                                        'Outubro',
                                        'Novembro',
                                        'Dezembro'
                                      ];
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext bc) {
                                            return Container(
                                              child: Container(
                                                height: 360,
                                                color:
                                                    AppColors.backgroundColor,
                                                child: Column(
                                                  children: <Widget>[
                                                    Container(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 10,
                                                                right: 24,
                                                                bottom: 12,
                                                                left: 24),
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                  'Fechar',
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        ' Piaui',
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: AppColors
                                                                        .orangePiaui,
                                                                  ),
                                                                ),
                                                              ),
                                                              TextButton(
                                                                onPressed:
                                                                    () async {
                                                                  if (selectedMonth !=
                                                                          null &&
                                                                      selectedMonth >
                                                                          0) {
                                                                    String
                                                                        month =
                                                                        "";
                                                                    String
                                                                        year =
                                                                        "0";
                                                                    if (selectedMonth <
                                                                        9) {
                                                                      month = "0" +
                                                                          selectedMonth
                                                                              .toString();
                                                                    } else {
                                                                      month = selectedMonth
                                                                          .toString();
                                                                    }
                                                                    _selectMonthAndYear(
                                                                        month,
                                                                        year);
                                                                    setState(
                                                                        () {
                                                                      if (selectedMonth >
                                                                          0) {
                                                                        mes = selectedMonth
                                                                            .toString();
                                                                      }
                                                                    });
                                                                    Navigator.pop(
                                                                        context);
                                                                  }
                                                                },
                                                                child: Text(
                                                                  'Filtrar',
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Piaui',
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: AppColors
                                                                        .orangePiaui,
                                                                  ),
                                                                ),
                                                              ),
                                                            ]),
                                                      ),
                                                    ),
                                                    BorderTopWidget(),
                                                    Align(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 16,
                                                                right: 19,
                                                                bottom: 9),
                                                        child: Text(
                                                          'Todos os meses',
                                                          style: TextStyle(
                                                            fontFamily: 'Piaui',
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color: AppColors
                                                                .textColorModal,
                                                          ),
                                                        ),
                                                      ),
                                                      alignment:
                                                          Alignment.bottomRight,
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child: Container(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            SingleChildScrollView(
                                                              child: SizedBox(
                                                                height: 100,
                                                                child:
                                                                    CupertinoPicker(
                                                                  itemExtent:
                                                                      40,
                                                                  // looping: true,
                                                                  onSelectedItemChanged:
                                                                      (index) {
                                                                    selectedMonth =
                                                                        index;
                                                                  },
                                                                  children: Utils
                                                                      .modelBuilder<
                                                                          String>(
                                                                    values,
                                                                    (index,
                                                                        value) {
                                                                      return Center(
                                                                        child: Text(
                                                                            value,
                                                                            style:
                                                                                TextStyle(fontSize: 14)),
                                                                      );
                                                                    },
                                                                  ),
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
                                            );
                                          });
                                    },
                                    child: Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                            color:
                                                AppColors.internalBorderColor,
                                            width: 0.9,
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 17,
                                        ),
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                mes,
                                                style: TextStyle(
                                                  fontFamily: 'TradeGothic',
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_down,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                size: 22,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                                Container(
                                    child: Expanded(
                                  flex: 2,
                                  child: InkWell(
                                    onTap: () {
                                      int yearSelected;
                                      List<String> values = [
                                        'Selecione o Ano',
                                        '2021',
                                        '2020',
                                        '2019',
                                        '2018',
                                        '2017',
                                        '2016',
                                        '2015',
                                        '2014',
                                        '2013',
                                        '2012',
                                        '2011',
                                        '2010'
                                      ];
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext bc) {
                                            return Container(
                                              child: Container(
                                                height: 360,
                                                color:
                                                    AppColors.backgroundColor,
                                                child: Column(
                                                  children: <Widget>[
                                                    Container(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 10,
                                                                right: 24,
                                                                bottom: 12,
                                                                left: 24),
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                  'Fechar',
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        ' Piaui',
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: AppColors
                                                                        .orangePiaui,
                                                                  ),
                                                                ),
                                                              ),
                                                              TextButton(
                                                                onPressed: () {
                                                                  if (yearSelected !=
                                                                      null) {
                                                                    String
                                                                        month =
                                                                        "0";
                                                                    String
                                                                        year =
                                                                        "";
                                                                    year = values[
                                                                            yearSelected]
                                                                        .toString();
                                                                    _selectMonthAndYear(
                                                                        month,
                                                                        year);
                                                                    Navigator.pop(
                                                                        context);
                                                                    setState(
                                                                        () {
                                                                      if (yearSelected >
                                                                          0) {
                                                                        ano = values[
                                                                            yearSelected];
                                                                      }
                                                                    });
                                                                  }
                                                                },
                                                                child: Text(
                                                                  'Filtrar',
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        ' Piaui',
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: AppColors
                                                                        .orangePiaui,
                                                                  ),
                                                                ),
                                                              ),
                                                            ]),
                                                      ),
                                                    ),
                                                    BorderTopWidget(),
                                                    Align(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 16,
                                                                right: 19,
                                                                bottom: 9),
                                                        child: Text(
                                                          'Todos os anos',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                ' Piaui',
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color: AppColors
                                                                .textColorModal,
                                                          ),
                                                        ),
                                                      ),
                                                      alignment:
                                                          Alignment.bottomRight,
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child: Container(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            SingleChildScrollView(
                                                              child: SizedBox(
                                                                height: 100,
                                                                child:
                                                                    CupertinoPicker(
                                                                  itemExtent:
                                                                      40,
                                                                  // looping: true,
                                                                  onSelectedItemChanged:
                                                                      (index) {
                                                                    yearSelected =
                                                                        index;
                                                                  },
                                                                  children: Utils
                                                                      .modelBuilder<
                                                                          String>(
                                                                    values,
                                                                    (index,
                                                                        value) {
                                                                      return Center(
                                                                        child: Text(
                                                                            value,
                                                                            style:
                                                                                TextStyle(fontSize: 14)),
                                                                      );
                                                                    },
                                                                  ),
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
                                            );
                                          });
                                    },
                                    child: Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                            color:
                                                AppColors.internalBorderColor,
                                            width: 0.9,
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 14),
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                ano,
                                                style: TextStyle(
                                                  fontFamily: 'TradeGothic',
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_down,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                size: 22,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      LastEditionWidget(),
                      Column(
                        children: <Widget>[
                          FutureBuilder<List<EditionModel>>(
                            future: _editions,
                            builder: (BuildContext context,
                                AsyncSnapshot<List<EditionModel>> snapshot) {
                              final double rowHeight = 255;
                              final double rowWidth =
                                  MediaQuery.of(context).size.width / 2.2;
                              final double rowFontsize = 12;
                              const framePadding =
                                  EdgeInsets.fromLTRB(0, 8, 0, 8);
                              CrossAxisAlignment columAlignH =
                                  CrossAxisAlignment.center;
                              MainAxisAlignment columAlignV =
                                  MainAxisAlignment.end;
                              CrossAxisAlignment rowAlignV =
                                  CrossAxisAlignment.center;
                              MainAxisAlignment rowAlignH =
                                  MainAxisAlignment.spaceEvenly;
                              cont++;

                              if (snapshot.hasData) {
                                int items = snapshot.data.length;
                                bool ok = false;
                                for (var item in snapshot.data) {
                                  if (!allEditions.contains(item)) {
                                    allEditions.add(item);
                                    ok = true;
                                  }
                                }

                                if (cont == 2 && ok) {
                                  if (items % 2 == 0) {
                                    for (var i = 0; i < items; i += 2) {
                                      content.add(Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Row(
                                                  crossAxisAlignment: rowAlignV,
                                                  mainAxisAlignment: rowAlignH,
                                                  children: [
                                                    Padding(
                                                      padding: framePadding,
                                                      child: Container(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              columAlignH,
                                                          mainAxisAlignment:
                                                              columAlignV,
                                                          children: [
                                                            Container(
                                                              color:
                                                                  Colors.grey,
                                                              height:
                                                                  rowHeight *
                                                                      0.80,
                                                              width: rowWidth *
                                                                  0.92,
                                                              child: ImageShimmer(
                                                                  url: snapshot
                                                                      .data[i]
                                                                      .acf
                                                                      .capa
                                                                      .url),
                                                            ),
                                                            Container(
                                                              height:
                                                                  rowHeight *
                                                                      0.15,
                                                              width: rowWidth *
                                                                  0.92,
                                                              child: Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                  'piauí_${snapshot.data[i].acf.numberEdition}: ${snapshot.data[i].acf.mes} de ${snapshot.data[i].acf.ano}',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Piaui',
                                                                      fontSize:
                                                                          rowFontsize,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Theme.of(
                                                                              context)
                                                                          .primaryColor),
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              children: [
                                                                ButtomOrangeWidget(
                                                                    id: snapshot
                                                                        .data[i]
                                                                        .id
                                                                        .toString(),
                                                                    edicao: snapshot
                                                                        .data[i]
                                                                        .acf
                                                                        .numberEdition,
                                                                    data:
                                                                        '${snapshot.data[i].acf.mes} de ${snapshot.data[i].acf.ano}'),
                                                                ButtomDownLoadWidget(
                                                                    id: snapshot
                                                                        .data[i]
                                                                        .id,
                                                                    capa: snapshot
                                                                        .data[i]
                                                                        .acf
                                                                        .capa
                                                                        .url,
                                                                    numberEdition:
                                                                        snapshot
                                                                            .data[
                                                                                i]
                                                                            .acf
                                                                            .numberEdition,
                                                                    mes: snapshot
                                                                        .data[i]
                                                                        .acf
                                                                        .mes,
                                                                    ano: snapshot
                                                                        .data[i]
                                                                        .acf
                                                                        .ano)
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
                                                          crossAxisAlignment:
                                                              columAlignH,
                                                          mainAxisAlignment:
                                                              columAlignV,
                                                          children: [
                                                            Container(
                                                              color:
                                                                  Colors.grey,
                                                              height:
                                                                  rowHeight *
                                                                      0.80,
                                                              width: rowWidth *
                                                                  0.92,
                                                              child: ImageShimmer(
                                                                  url: snapshot
                                                                      .data[
                                                                          i + 1]
                                                                      .acf
                                                                      .capa
                                                                      .url),
                                                            ),
                                                            Container(
                                                              height:
                                                                  rowHeight *
                                                                      0.15,
                                                              width: rowWidth *
                                                                  0.92,
                                                              child: Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                  'piauí_${snapshot.data[i + 1].acf.numberEdition}: ${snapshot.data[i + 1].acf.mes} de ${snapshot.data[i + 1].acf.ano}',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Piaui',
                                                                      fontSize:
                                                                          rowFontsize,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Theme.of(
                                                                              context)
                                                                          .primaryColor),
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              children: [
                                                                ButtomOrangeWidget(
                                                                  id: snapshot
                                                                      .data[
                                                                          i + 1]
                                                                      .id
                                                                      .toString(),
                                                                  edicao: snapshot
                                                                      .data[
                                                                          i + 1]
                                                                      .acf
                                                                      .numberEdition,
                                                                  data:
                                                                      '${snapshot.data[i + 1].acf.mes} de ${snapshot.data[i + 1].acf.ano}',
                                                                ),
                                                                ButtomDownLoadWidget(
                                                                    id: snapshot
                                                                        .data[i +
                                                                            1]
                                                                        .id,
                                                                    capa: snapshot
                                                                        .data[i +
                                                                            1]
                                                                        .acf
                                                                        .capa
                                                                        .url,
                                                                    numberEdition: snapshot
                                                                        .data[i +
                                                                            1]
                                                                        .acf
                                                                        .numberEdition,
                                                                    mes: snapshot
                                                                        .data[i +
                                                                            1]
                                                                        .acf
                                                                        .mes,
                                                                    ano: snapshot
                                                                        .data[i +
                                                                            1]
                                                                        .acf
                                                                        .ano)
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
                                    for (var i = 0; i < items - 1; i += 2) {
                                      content.add(Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Row(
                                                  crossAxisAlignment: rowAlignV,
                                                  mainAxisAlignment: rowAlignH,
                                                  children: [
                                                    Padding(
                                                      padding: framePadding,
                                                      child: Container(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              columAlignH,
                                                          mainAxisAlignment:
                                                              columAlignV,
                                                          children: [
                                                            Container(
                                                              color:
                                                                  Colors.grey,
                                                              height:
                                                                  rowHeight *
                                                                      0.80,
                                                              width: rowWidth *
                                                                  0.92,
                                                              child: ImageShimmer(
                                                                  url: snapshot
                                                                      .data[i]
                                                                      .acf
                                                                      .capa
                                                                      .url),
                                                            ),
                                                            Container(
                                                              height:
                                                                  rowHeight *
                                                                      0.15,
                                                              width: rowWidth *
                                                                  0.92,
                                                              child: Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                  'piauí_${snapshot.data[i].acf.numberEdition}: ${snapshot.data[i].acf.mes} de ${snapshot.data[i].acf.ano}',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Piaui',
                                                                      fontSize:
                                                                          rowFontsize,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Theme.of(
                                                                              context)
                                                                          .primaryColor),
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              children: [
                                                                ButtomOrangeWidget(
                                                                    id: snapshot
                                                                        .data[i]
                                                                        .id
                                                                        .toString(),
                                                                    edicao: snapshot
                                                                        .data[i]
                                                                        .acf
                                                                        .numberEdition,
                                                                    data:
                                                                        '${snapshot.data[i].acf.mes} de ${snapshot.data[i].acf.ano}'),
                                                                ButtomDownLoadWidget(
                                                                    id: snapshot
                                                                        .data[i]
                                                                        .id,
                                                                    capa: snapshot
                                                                        .data[i]
                                                                        .acf
                                                                        .capa
                                                                        .url,
                                                                    numberEdition:
                                                                        snapshot
                                                                            .data[
                                                                                i]
                                                                            .acf
                                                                            .numberEdition,
                                                                    mes: snapshot
                                                                        .data[i]
                                                                        .acf
                                                                        .mes,
                                                                    ano: snapshot
                                                                        .data[i]
                                                                        .acf
                                                                        .ano)
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
                                                          crossAxisAlignment:
                                                              columAlignH,
                                                          mainAxisAlignment:
                                                              columAlignV,
                                                          children: [
                                                            Container(
                                                              color:
                                                                  Colors.grey,
                                                              height:
                                                                  rowHeight *
                                                                      0.80,
                                                              width: rowWidth *
                                                                  0.92,
                                                              child: ImageShimmer(
                                                                  url: snapshot
                                                                      .data[
                                                                          i + 1]
                                                                      .acf
                                                                      .capa
                                                                      .url),
                                                            ),
                                                            Container(
                                                              height:
                                                                  rowHeight *
                                                                      0.15,
                                                              width: rowWidth *
                                                                  0.92,
                                                              child: Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                  'piauí_${snapshot.data[i + 1].acf.numberEdition}: ${snapshot.data[i + 1].acf.mes} de ${snapshot.data[i + 1].acf.ano}',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Piaui',
                                                                      fontSize:
                                                                          rowFontsize,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Theme.of(
                                                                              context)
                                                                          .primaryColor),
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              children: [
                                                                ButtomOrangeWidget(
                                                                  id: snapshot
                                                                      .data[
                                                                          i + 1]
                                                                      .id
                                                                      .toString(),
                                                                  edicao: snapshot
                                                                      .data[
                                                                          i + 1]
                                                                      .acf
                                                                      .numberEdition,
                                                                  data:
                                                                      '${snapshot.data[i + 1].acf.mes} de ${snapshot.data[i + 1].acf.ano}',
                                                                ),
                                                                ButtomDownLoadWidget(
                                                                    id: snapshot
                                                                        .data[i +
                                                                            1]
                                                                        .id,
                                                                    capa: snapshot
                                                                        .data[i +
                                                                            1]
                                                                        .acf
                                                                        .capa
                                                                        .url,
                                                                    numberEdition: snapshot
                                                                        .data[i +
                                                                            1]
                                                                        .acf
                                                                        .numberEdition,
                                                                    mes: snapshot
                                                                        .data[i +
                                                                            1]
                                                                        .acf
                                                                        .mes,
                                                                    ano: snapshot
                                                                        .data[i +
                                                                            1]
                                                                        .acf
                                                                        .ano)
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Row(
                                                crossAxisAlignment: rowAlignV,
                                                mainAxisAlignment: rowAlignH,
                                                children: [
                                                  Padding(
                                                    padding: framePadding,
                                                    child: Container(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            columAlignH,
                                                        mainAxisAlignment:
                                                            columAlignV,
                                                        children: [
                                                          Container(
                                                            color: Colors.grey,
                                                            height: rowHeight *
                                                                0.80,
                                                            width:
                                                                rowWidth * 0.92,
                                                            child: ImageShimmer(
                                                                url: snapshot
                                                                    .data[
                                                                        items -
                                                                            1]
                                                                    .acf
                                                                    .capa
                                                                    .url),
                                                          ),
                                                          Container(
                                                            height: rowHeight *
                                                                0.15,
                                                            width:
                                                                rowWidth * 0.92,
                                                            child: Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                'piauí_${snapshot.data[items - 1].acf.numberEdition}: ${snapshot.data[items - 1].acf.mes} de ${snapshot.data[items - 1].acf.ano}',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Piaui',
                                                                    fontSize:
                                                                        rowFontsize,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Theme.of(
                                                                            context)
                                                                        .primaryColor),
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              ButtomOrangeWidget(
                                                                id: snapshot
                                                                    .data[
                                                                        items -
                                                                            1]
                                                                    .id
                                                                    .toString(),
                                                                edicao: snapshot
                                                                    .data[
                                                                        items -
                                                                            1]
                                                                    .acf
                                                                    .numberEdition,
                                                                data:
                                                                    '${snapshot.data[items - 1].acf.mes} de ${snapshot.data[items - 1].acf.ano}',
                                                              ),
                                                              ButtomDownLoadWidget(
                                                                  id: snapshot
                                                                      .data[
                                                                          items -
                                                                              1]
                                                                      .id,
                                                                  capa: snapshot
                                                                      .data[
                                                                          items -
                                                                              1]
                                                                      .acf
                                                                      .capa
                                                                      .url,
                                                                  numberEdition: snapshot
                                                                      .data[
                                                                          items -
                                                                              1]
                                                                      .acf
                                                                      .numberEdition,
                                                                  mes: snapshot
                                                                      .data[
                                                                          items -
                                                                              1]
                                                                      .acf
                                                                      .mes,
                                                                  ano: snapshot
                                                                      .data[
                                                                          items -
                                                                              1]
                                                                      .acf
                                                                      .ano)
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
                                }

                                return Column(children: content);
                              } else {
                                return SkeletonRowGrid();
                              }
                            },
                          ),
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 25, left: 25, right: 25),
                          child: BorderTopWidget()),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_circle,
                                    color: Theme.of(context).primaryColorDark,
                                    size: 55,
                                  )
                                ],
                              ),
                              onPressed: () {
                                _addPage();
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

Future<List<EditionModel>> findByPage(int page) async {
  List<EditionModel> editions = <EditionModel>[];
  final _url = '/wp-json/acf/v3/edicao?page=$page';
  var dio = CustomDio().instance;
  try {
    var response = await dio.get(_url);
    /* print("aq" + response.data.length.toString()); */
    if (response.statusCode == 200) {
      for (var i = page == 1 ? 1 : 0; i < response.data.length; i++) {
        final singleEdition = EditionModel.fromJson(response.data[i]);

        editions.add(singleEdition);
      }
    }
  } catch (error) {
    print("Error: " + error.toString());
  }
  return editions;
}

Future<List<EditionModel>> findByMonthAndYear(String month, String year) async {
  List<EditionModel> editions = <EditionModel>[];
  var _url;

  if (year == "0") {
    _url = '/wp-json/acf/v3/edicao?mes=$month';
  } else if (month == "0") {
    _url = '/wp-json/acf/v3/edicao?ano=$year';
  } else {
    _url = '/wp-json/acf/v3/edicao?ano=$year&mes=$month';
  }
  print(_url);
  var dio = CustomDio().instance;
  try {
    var response = await dio.get(_url);

    if (response.statusCode == 200) {
      for (var i = 0; i < response.data.length; i++) {
        final singleEdition = EditionModel.fromJson(response.data[i]);

        editions.add(singleEdition);
      }
      /* for (var json in response.data) {
        final singleEdition = EditionModel.fromJson(json);

        editions.add(singleEdition);
      } */
    }
  } catch (error) {
    print("Error: " + error.toString());
  }
  return editions;
}
