import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class ButtomOrangeWidget extends StatefulWidget {
  final String id;
  final String edicao;
  final String data;

  const ButtomOrangeWidget(
      {Key key, this.id = "", this.edicao = "", this.data = ""})
      : super(key: key);

  @override
  _ButtomOrangeWidgetState createState() =>
      _ButtomOrangeWidgetState(id, edicao, data);
}

class _ButtomOrangeWidgetState extends State<ButtomOrangeWidget> {
  String id;
  String edicao;
  String data;

  _ButtomOrangeWidgetState(this.id, this.edicao, this.data);

  @override
  Widget build(BuildContext context) {
    double vHeight = MediaQuery.of(context).size.height;
    double vWidth = MediaQuery.of(context).size.width;
    return TextButton(
      onPressed: () {
        Modular.to.pushNamed('/magazine', arguments: {
          "url": '/wp-json/customRest/v1/materias-revista?edicao=' + id,
          "title": edicao,
          "data": data
        });
      },
      // padding: EdgeInsets.zero,
      child: Container(
        color: Theme.of(context).primaryColorDark,
        height: vHeight * 0.06,
        width: vWidth / 4,
        child: Align(
          child: Text(
            'Ler agora',
            style: TextStyle(
              fontFamily: 'TradeGothic',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
