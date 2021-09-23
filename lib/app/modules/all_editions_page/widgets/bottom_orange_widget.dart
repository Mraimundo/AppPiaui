import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class ButtomOrangeWidget extends StatefulWidget {
  final String id;
  final String edicao;

  const ButtomOrangeWidget({Key key, this.id = "123", this.edicao = "174"})
      : super(key: key);

  @override
  _ButtomOrangeWidgetState createState() =>
      _ButtomOrangeWidgetState(id, edicao);
}

class _ButtomOrangeWidgetState extends State<ButtomOrangeWidget> {
  String id;
  String edicao;

  _ButtomOrangeWidgetState(this.id, this.edicao);

  @override
  Widget build(BuildContext context) {
    double vHeight = MediaQuery.of(context).size.height;
    double vWidth = MediaQuery.of(context).size.width;
    return TextButton(
      onPressed: () {
        Modular.to.pushNamed('/magazine', arguments: {
          "url":
              'https://piaui.homolog.inf.br/wp-json/customRest/v1/materias-revista?edicao=' +
                  id,
          "title": edicao
        });
      },
      // padding: EdgeInsets.zero,
      child: Container(
        color: AppColors.orangePiaui,
        height: vHeight * 0.06,
        width: vWidth / 4,
        child: Align(
          child: Text(
            'Ler agora',
            style: TextStyle(
              fontFamily: 'Piaui',
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
