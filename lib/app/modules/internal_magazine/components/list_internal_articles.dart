import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:piaui_app/app/modules/internal_magazine/components/autor_internal_article.dart';
import 'package:piaui_app/app/modules/tts/tts.dart';
import 'package:piaui_app/app/modules/internal_magazine/components/border_top_widget.dart';
import 'package:piaui_app/app/shared/core/custom_dio.dart';
import 'package:html/parser.dart';

String _parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body.text).documentElement.text;

  return parsedString;
}

Future<String> post(idMateria) async {
  final _url = "/wp-json/acf/v3/posts/" + idMateria;
  var dio = CustomDio().instance;
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
  double _tamFonte = 15;
  bool isPlay = true;
  _ListInternalArticlesState(this.rendered, this.idMateria);

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async {
          setState(() {
            if (!isPlay) {
              tts.stop();
              isPlay = true;
            }
          });
          // You can do some work here.
          // Returning true allows the pop to happen, returning false prevents it.
          return true;
        },
        child: new FutureBuilder<String>(
        future: post(idMateria),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(left: 26, right: 29),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Text(
                              'Ou??a essa mat??ria!',
                              style: TextStyle(
                                fontFamily: 'TradeGothic',
                                color: Theme.of(context).primaryColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 14),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                    width: 52,
                                    height: 52,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      icon: Container(
                                        padding: EdgeInsets.only(right: 12),
                                        child: Image.asset(
                                            'assets/images/Play.png',
                                            fit: BoxFit.contain),
                                        //color: Theme.of(context).primaryColor,
                                        height: MediaQuery.of(context)
                                                    .orientation ==
                                                Orientation.portrait
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                33
                                            : MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                14,
                                      ),
                                      alignment: Alignment.centerRight,
                                      onPressed: () {
                                        setState(() {
                                          if (isPlay) {
                                            tts.speak(rendered);
                                            isPlay = false;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 52,
                                  height: 52,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Container(
                                      padding: EdgeInsets.only(
                                          right: 15,
                                          bottom: 6,
                                          top: 6,
                                          left: 6),
                                      child: Image.asset(
                                          'assets/images/Stop.png',
                                          fit: BoxFit.contain),
                                      //color: Theme.of(context).primaryColor,
                                      height: MediaQuery.of(context)
                                                  .orientation ==
                                              Orientation.portrait
                                          ? MediaQuery.of(context).size.height /
                                              28
                                          : MediaQuery.of(context).size.height /
                                              14,
                                    ),
                                    alignment: Alignment.centerRight,
                                    onPressed: () {
                                      setState(() {
                                        if (!isPlay) {
                                          tts.stop();
                                          isPlay = true;
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 45, bottom: 14),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              child: TextButton(
                                child: Text(
                                  "A+",
                                  style: TextStyle(
                                    fontFamily: 'TradeGothic',
                                    color: Theme.of(context).primaryColor,
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
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              child: TextButton(
                                child: Text(
                                  "A-",
                                  style: TextStyle(
                                    height: 1.6,
                                    fontFamily: 'Palatino',
                                    fontSize: _tamFonte,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                    /* fontWeight: FontWeight.bold,
                                    fontSize: 14, */
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
                                  color: Theme.of(context).primaryColor,
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
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _tamFonte = 13;
                                        });
                                      }))),
                        ]),
                      ),
                    ],
                  ),
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
                                color: Theme.of(context).primaryColor,
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
                  jsonDecode(snapshot.data)["acf"]["autor"] != ""
                      ? AutorInternalArticle(
                          autor: jsonDecode(snapshot.data)["acf"]["autor"])
                      : Text(""),
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        }));
  }
}
