import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:piaui_app/app/modules/internal_magazine/components/autor_internal_article.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'package:html/parser.dart';

import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;

String _parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body.text).documentElement.text;

  return parsedString;
}

Future<String> post(idMateria) async {
  final _url = "https://piaui.homolog.inf.br/wp-json/acf/v3/posts/" + idMateria;
  var dio = Dio();
  var response = await dio.get(_url);
  return response.toString();
}

class ListInternalArticles extends StatefulWidget {
  final String rendered;
  final String idMateria;

  const ListInternalArticles({Key key, this.rendered, this.idMateria})
      : super(key: key);

  @override
  _ListInternalArticlesState createState() =>
      _ListInternalArticlesState(rendered, idMateria);
}

class _ListInternalArticlesState extends State<ListInternalArticles> {
  String rendered;
  String idMateria;
  double _tamFonte = 13;
  _ListInternalArticlesState(this.rendered, this.idMateria);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: post(idMateria),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(left: 26, right: 29),
              child: Column(
                children: [
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      setState(() {
                        _tamFonte++;
                      });
                    },
                    child: Text('+'),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      setState(() {
                        _tamFonte--;
                      });
                    },
                    child: Text('-'),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(height: 0),
                    itemCount: rendered.split("\n").length,
                    itemBuilder: (_, index) => rendered
                            .split("\n")[index]
                            .contains('<span class="capitalize">')
                        ? Container(
                            margin: new EdgeInsets.symmetric(horizontal: 9.0),
                            child: DropCapText(
                              _parseHtmlString(rendered.split("\n")[index]),
                              style: TextStyle(
                                height: 1.3,
                                fontFamily: 'Palatino',
                                fontSize: _tamFonte,
                                fontWeight: FontWeight.normal,
                                color: AppColors.textColorNormal,
                              ),
                              dropCapChars: 1,
                            ))
                        : Html(
                            data: rendered.split("\n")[index],
                            style: {
                              "p": Style(
                                  fontFamily: 'Palatino',
                                  fontSize: FontSize(_tamFonte),
                                  fontWeight: FontWeight.normal),
                            },
                          ),
                  ),
                  AutorInternalArticle(
                      autor: jsonDecode(snapshot.data)["acf"]["autor"]),
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
