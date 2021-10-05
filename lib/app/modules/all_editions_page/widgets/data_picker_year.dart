import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:piaui_app/app/modules/all_editions_page/utils/utils.dart';

class DatePickerYear extends StatefulWidget {
  DatePickerYear({Key key}) : super(key: key);

  @override
  _DatePickerYearState createState() => _DatePickerYearState();
}

class _DatePickerYearState extends State<DatePickerYear> {
  int index = 0;
  static List<String> values = [
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
  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            buildCustomPicker(),
          ],
        ),
      );

  Widget buildCustomPicker() => SingleChildScrollView(
        child: SizedBox(
          height: 100,
          child: CupertinoPicker(
            itemExtent: 40,
            // looping: true,
            onSelectedItemChanged: (index) =>
                setState(() => this.index = index),
            children: Utils.modelBuilder<String>(
              values,
              (index, value) {
                return Center(
                  child: Text(value, style: TextStyle(fontSize: 14)),
                );
              },
            ),
          ),
        ),
      );
}
