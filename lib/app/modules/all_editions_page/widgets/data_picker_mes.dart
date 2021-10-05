import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piaui_app/app/modules/all_editions_page/utils/utils.dart';

class DataPickerMes extends StatefulWidget {
  const DataPickerMes({Key key}) : super(key: key);

  @override
  _DataPickerMesState createState() => _DataPickerMesState();
}

class _DataPickerMesState extends State<DataPickerMes> {
  int index = 0;
  static List<String> values = [
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

  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 260,
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
          ],
        ),
      );
}
