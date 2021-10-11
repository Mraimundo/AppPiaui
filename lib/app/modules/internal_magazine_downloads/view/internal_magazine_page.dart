import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:piaui_app/app/modules/internal_magazine_downloads/components/list_internal_articles.dart';
import 'package:piaui_app/app/modules/internal_magazine_downloads/components/text_internal_magazine.dart';
import 'package:piaui_app/app/modules/tts/tts.dart';
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';
import 'package:piaui_app/app/shared/core/custom_dio.dart';
import 'package:piaui_app/app/shared/downloads/model/revist_download.dart';
import 'package:html/parser.dart';

Future<String> conteudo(idMateria) async {
  final _url = "/wp-json/wp/v2/materia/" + idMateria;
  var dio = CustomDio().instance;
  var response = await dio.get(_url);
  return response.toString();
}

String _parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body.text).documentElement.text;

  return parsedString;
}

class InternalMagazinePage extends StatefulWidget {
  RevistDownload revist;
  int index;
  InternalMagazinePage({Key key, this.revist, this.index}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _InternalMagazinePageState();
  }
}

class _InternalMagazinePageState extends State<InternalMagazinePage> {
  //use 'controller' variable to access controller

  _InternalMagazinePageState();

  @override
  Widget build(context) {
    List<dynamic> jsonData = widget.revist.materias;
    Tts tts = new Tts();
    Map<String, dynamic> materiaMap = jsonData[widget.index];
    Map<String, dynamic> conteudo = materiaMap['conteudo'];
    List<dynamic> autors = conteudo['Colaboradores'];
    var _bytes = materiaMap["image"].split(',').last != "" ||
            materiaMap["image"].split(',').last != []
        ? base64.decode(materiaMap["image"].split(',').last)
        : "";

    return Scaffold(
      appBar: PreferredAppBarWidget(height: 56),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: LayoutBuilder(
                builder:
                    (BuildContext context, BoxConstraints viewportConstraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextInternalMagazine(
                            imagemAlt: _parseHtmlString(materiaMap['imageAlt']),
                            data: widget.revist.mes + '-' + widget.revist.ano,
                            autor: autors,
                            edition: widget.revist.numberEdition.toString(),
                            title:
                                _parseHtmlString(conteudo['title'].toString())
                                    .toUpperCase(),
                          ),
                          _bytes != ""
                              ? Image.memory(
                                  _bytes,
                                  fit: BoxFit.fill,
                                )
                              : Text(""),
                          SizedBox(height: 7),
                          SizedBox(height: 22),
                          ListInternalArticles(rendered: conteudo),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
