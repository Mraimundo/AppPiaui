import 'package:flutter/material.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/border_top_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/select_Year_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/select_edition_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/select_month_widget.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key key}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

void _modalBottomYear(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: 220,
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
                            Navigator.of(context).pop();
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
                        Text(
                          'Filtrar',
                          style: TextStyle(
                            fontFamily: ' Piaui',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.orangePiaui,
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
                    'Todos os anos',
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
              Padding(
                padding: const EdgeInsets.only(left: 13, right: 12),
                child: Container(
                    height: 32,
                    color: AppColors.boxColorModal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Selecione o ano'),
                          Text('2021'),
                        ],
                      ),
                    )),
              )
            ],
          ),
        );
      });
}

void _modalBottomMonth(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: 220,
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
                            Navigator.of(context).pop();
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
                        Text(
                          'Filtrar',
                          style: TextStyle(
                            fontFamily: ' Piaui',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.orangePiaui,
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
              Padding(
                padding: const EdgeInsets.only(left: 13, right: 12),
                child: Container(
                    height: 32,
                    color: AppColors.boxColorModal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Selecione o mês'),
                          Text('Janeiro'),
                        ],
                      ),
                    )),
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
            Container(child: SelectYearWidget(
              onTap: () {
                _modalBottomYear(context);
              },
            )),
            Container(child: SelectMonthWidget(
              onTap: () {
                _modalBottomMonth(context);
              },
            ))
          ],
        ),
      ),
    );
  }
}
