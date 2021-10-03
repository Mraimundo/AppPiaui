import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:piaui_app/app/modules/internal_magazine/components/autor_internal_article.dart';
import 'package:piaui_app/app/modules/tts/tts.dart';
import 'package:piaui_app/app/modules/internal_magazine/components/border_top_widget.dart';
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
  Tts tts = new Tts();
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
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: TextButton(
                          child: Text(
                            "A+",
                            style: TextStyle(
                              fontFamily: 'TradeGothic',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              if (_tamFonte >= 20) {
                                _tamFonte = 20;
                              } else {
                                _tamFonte++;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: TextButton(
                          child: Text(
                            "A-",
                            style: TextStyle(
                              fontFamily: 'TradeGothic',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              if (_tamFonte <= 8) {
                                _tamFonte = 8;
                              } else {
                                _tamFonte--;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: TextButton(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Text(
                              "A",
                              style: TextStyle(
                                fontFamily: 'TradeGothic',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              _tamFonte = 13;
                            });
                          },
                        ),
                      ),
                    ),
                    TextButton(
                      child: Text(
                        "Play",
                        style: TextStyle(
                          fontFamily: 'TradeGothic',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      onPressed: () => tts.speak(rendered),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 32),
                    child: BorderTopWidget(),
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
