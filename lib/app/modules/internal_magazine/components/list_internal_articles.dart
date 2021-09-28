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
  _ListInternalArticlesState(this.rendered, this.idMateria);

  @override
  Widget build(BuildContext context) {
    String htmlData = """<div>
  <h1>Demo Page</h1>
  <p>This is a fantastic product that you should buy!</p>
  <h3>Features</h3>
  <ul>
    <li>It actually works</li>
    <li>It exists</li>
    <li>It doesn't cost much!</li>
  </ul>
  <!--You can pretty much put any html in here!-->
</div>""";

    dom.Document document = htmlparser.parse(htmlData);
    return FutureBuilder<String>(
        future: post(idMateria),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(left: 26, right: 29),
              child: Column(
                children: [
                  Html(
                      data: rendered.replaceAll('class=\"capitalize\"',
                          'style="text-transform: capitalize; display: inline-block; margin-top: 12px; margin-right: 5px; margin-bottom: 0px;  float: left; font-family: Piaui, Tahoma, sans-serif !important; color: #2b2b2b; font-size: 100px; line-height: 60px; font-weight: 700; text-transform: uppercase;"')),
                  /*  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(height: 0),
                    itemCount:
                        rendered.split("<span class=\"capitalize\">").length,
                    itemBuilder: (_,
                            index) => /*  DropCapText(
                            _parseHtmlString(rendered
                                .split("<span class=\"capitalize\">")[index]),
                            style: TextStyle(
                              height: 1.3,
                              fontFamily: 'Palatino',
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: AppColors.textColorNormal,
                            ),
                            dropCapChars: 1,
                          ) */

                        Html(
                            data: rendered
                                .split("<span class=\"capitalize\">")[index]),
                  ), */
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
