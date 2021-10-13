/* import 'dart:html'; */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piaui_app/app/modules/all_editions_page/utils/utils.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/border_top_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/data_picker_year.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/select_Year_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/select_edition_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/select_month_widget.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

import 'data_picker_mes.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key key}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

void _modalBottomYear(context) {
  int yearSelected;
  List<String> values = [
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
            color: AppColors.backgroundColor,
            child: Column(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, right: 24, bottom: 12, left: 24),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Fechar',
                              style: TextStyle(
                                fontFamily: ' Piaui',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.orangePiaui,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              print(values[yearSelected]);
                            },
                            child: Text(
                              'Filtrar',
                              style: TextStyle(
                                fontFamily: ' Piaui',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.orangePiaui,
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
                        const EdgeInsets.only(top: 16, right: 19, bottom: 9),
                    child: Text(
                      'Todos os anos',
                      style: TextStyle(
                        fontFamily: 'Piaui',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: AppColors.textColorModal,
                      ),
                    ),
                  ),
                  alignment: Alignment.bottomRight,
                ),
                Text(
                  'Selecione o ano',
                  style: TextStyle(
                    fontFamily: 'Piaui',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColors.textColorModal,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SingleChildScrollView(
                          child: SizedBox(
                            height: 100,
                            child: CupertinoPicker(
                              itemExtent: 40,
                              // looping: true,
                              onSelectedItemChanged: (index) {
                                yearSelected = index;
                              },
                              children: Utils.modelBuilder<String>(
                                values,
                                (index, value) {
                                  return Center(
                                    child: Text(value,
                                        style: TextStyle(fontSize: 14)),
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
}

void _modalBottomMonth(context) {
  int selectedMonth;
  List<String> values = [
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
          height: 360,
          color: AppColors.backgroundColor,
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, right: 24, bottom: 12, left: 24),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Fechar',
                            style: TextStyle(
                              fontFamily: 'Piaui',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.orangePiaui,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            print(values[selectedMonth]);
                          },
                          child: Text(
                            'Filtrar',
                            style: TextStyle(
                              fontFamily: ' Piaui',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.orangePiaui,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              BorderTopWidget(),
              Align(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, right: 19, bottom: 9),
                  child: Text(
                    'Todos os meses',
                    style: TextStyle(
                      fontFamily: ' Piaui',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColorModal,
                    ),
                  ),
                ),
                alignment: Alignment.bottomRight,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 260,
                      child: CupertinoPicker(
                        itemExtent: 40,
                        // looping: true,
                        onSelectedItemChanged: (index) {
                          selectedMonth = index;
                        },
                        children: Utils.modelBuilder<String>(
                          values,
                          (index, value) {
                            return Center(
                              child:
                                  Text(value, style: TextStyle(fontSize: 14)),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      });
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                onTap: () {},
              ),
            ),
            Container(child: SelectMonthWidget(
              onTap: () {
                int selectedMonth;
                List<String> values = [
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
                          color: AppColors.backgroundColor,
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, right: 24, bottom: 12, left: 24),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Fechar',
                                            style: TextStyle(
                                              fontFamily: ' Piaui',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.orangePiaui,
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            print(values[selectedMonth]);
                                          },
                                          child: Text(
                                            'Filtrar',
                                            style: TextStyle(
                                              fontFamily: ' Piaui',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.orangePiaui,
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                              BorderTopWidget(),
                              Align(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16, right: 19, bottom: 9),
                                  child: Text(
                                    'Todos os anos',
                                    style: TextStyle(
                                      fontFamily: ' Piaui',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.textColorModal,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.bottomRight,
                              ),
                              Text(
                                'Selecione o ano',
                                style: TextStyle(
                                  fontFamily: ' Piaui',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.textColorModal,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SingleChildScrollView(
                                        child: SizedBox(
                                          height: 100,
                                          child: CupertinoPicker(
                                            itemExtent: 40,
                                            // looping: true,
                                            onSelectedItemChanged: (index) {
                                              selectedMonth = index;
                                            },
                                            children:
                                                Utils.modelBuilder<String>(
                                              values,
                                              (index, value) {
                                                return Center(
                                                  child: Text(value,
                                                      style: TextStyle(
                                                          fontSize: 14)),
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
            )),
            Container(child: SelectMonthWidget(
              onTap: () {
                int yearSelected;
                List<String> values = [
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
                          color: AppColors.backgroundColor,
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, right: 24, bottom: 12, left: 24),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Fechar',
                                            style: TextStyle(
                                              fontFamily: ' Piaui',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.orangePiaui,
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            print(values[yearSelected]);
                                          },
                                          child: Text(
                                            'Filtrar',
                                            style: TextStyle(
                                              fontFamily: ' Piaui',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.orangePiaui,
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                              BorderTopWidget(),
                              Align(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16, right: 19, bottom: 9),
                                  child: Text(
                                    'Todos os anos',
                                    style: TextStyle(
                                      fontFamily: ' Piaui',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.textColorModal,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.bottomRight,
                              ),
                              Text(
                                'Selecione o ano',
                                style: TextStyle(
                                  fontFamily: ' Piaui',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.textColorModal,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SingleChildScrollView(
                                        child: SizedBox(
                                          height: 100,
                                          child: CupertinoPicker(
                                            itemExtent: 40,
                                            // looping: true,
                                            onSelectedItemChanged: (index) {
                                              yearSelected = index;
                                            },
                                            children:
                                                Utils.modelBuilder<String>(
                                              values,
                                              (index, value) {
                                                return Center(
                                                  child: Text(value,
                                                      style: TextStyle(
                                                          fontSize: 14)),
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
            ))
          ],
        ),
      ),
    );
  }
}
