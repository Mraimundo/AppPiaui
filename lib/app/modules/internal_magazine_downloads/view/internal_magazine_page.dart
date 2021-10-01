import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/internal_magazine_downloads/components/list_internal_articles.dart';
import 'package:piaui_app/app/modules/internal_magazine_downloads/components/text_internal_magazine.dart';
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';
import 'package:piaui_app/app/shared/downloads/model/revist_download.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'package:html/parser.dart';

Future<String> conteudo(idMateria) async {
  final _url =
      "https://piaui.homolog.inf.br/wp-json/wp/v2/materia/" + idMateria;
  var dio = Dio();
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
    // TODO: implement createState
    return _InternalMagazinePageState();
  }
}

class _InternalMagazinePageState extends State<InternalMagazinePage> {
  //use 'controller' variable to access controller

  _InternalMagazinePageState();

  @override
  Widget build(context) {
    List<dynamic> jsonData = widget.revist.materias;

    Map<String, dynamic> materiaMap = jsonData[widget.index];
    Map<String, dynamic> conteudo = materiaMap['conteudo'];
    List<dynamic> autors = conteudo['Colaboradores'];
    return Scaffold(
      appBar: PreferredAppBarWidget(height: 56),
      backgroundColor: AppColors.backgroundColor,
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
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextInternalMagazine(
                            data: widget.revist.mes + '-' + widget.revist.ano,
                            autor: autors,
                            edition: widget.revist.numberEdition.toString(),
                            title:
                                _parseHtmlString(conteudo['title'].toString())
                                    .toUpperCase(),
                          ),
                          Image.network(
                            materiaMap['image'],
                            fit: BoxFit.fill,
                          ),
                          SizedBox(height: 7),
                          Text(
                            _parseHtmlString(materiaMap['imageAlt']),
                            style: TextStyle(
                              fontFamily: 'Piaui',
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColorNormal,
                            ),
                            textAlign: TextAlign.center,
                          ),
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
