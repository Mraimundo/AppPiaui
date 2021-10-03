import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class TextMagazine extends StatefulWidget {
  final String title;
  final String edicao;
  TextMagazine({Key key, this.title = "Teste NULL", this.edicao = ""})
      : super(key: key);

  @override
  _TextMagazineState createState() => _TextMagazineState(title, edicao);
}

class _TextMagazineState extends State<TextMagazine> {
  String title;
  String edicao;
  _TextMagazineState(this.title, this.edicao);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 36),
      child: Align(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Por dentro da Revista",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 17),
              Padding(
                padding: const EdgeInsets.only(right: 35, bottom: 17),
                child: Text(
                  'Índice Edição #' + title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
          alignment: Alignment.centerLeft),
    );
  }
}
