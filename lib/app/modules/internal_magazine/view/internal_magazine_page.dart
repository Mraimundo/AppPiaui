import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/internal_magazine/components/list_internal_articles.dart';
import 'package:piaui_app/app/modules/internal_magazine/components/text_internal_magazine.dart';
import 'package:piaui_app/app/modules/internal_magazine/controller/internal_magazine_controller.dart';
import 'package:piaui_app/app/modules/tts/tts.dart';
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';
import 'package:piaui_app/app/shared/core/custom_dio.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
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
  final String title;
  final String idMateria;
  final String edition;
  final String imagemUrl;
  final String imagemAlt;
  final String data;

  const InternalMagazinePage(
      {Key key,
      this.title = "InternalMagazine",
      this.idMateria = "",
      this.edition = "",
      this.imagemUrl = "",
      this.imagemAlt = "",
      this.data = ""})
      : super(key: key);

  @override
  _InternalMagazinePageState createState() => _InternalMagazinePageState(
      idMateria, edition, imagemUrl, imagemAlt, data);
}

class _InternalMagazinePageState
    extends ModularState<InternalMagazinePage, InternalMagazineController> {
  //use 'controller' variable to access controller

  String idMateria;
  String edition;
  String imagemUrl;
  String imagemAlt;
  String data;

  _InternalMagazinePageState(
      this.idMateria, this.edition, this.imagemUrl, this.imagemAlt, this.data);

  @override
  Widget build(context) {
    Tts tts = new Tts();
    print(idMateria);

    return FutureBuilder<String>(
        future: conteudo(idMateria),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            return Scaffold(
              appBar: PreferredAppBarWidget(height: 56),
              body: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: LayoutBuilder(
                        builder: (BuildContext context,
                            BoxConstraints viewportConstraints) {
                          return SingleChildScrollView(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: viewportConstraints.maxHeight,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  TextInternalMagazine(
                                    onClickAction: () => {tts.stop()},
                                    data: data,
                                    edition: edition,
                                    title: _parseHtmlString(
                                            jsonDecode(snapshot.data)["title"]
                                                    ["rendered"]
                                                .toString())
                                        .toUpperCase(),
                                  ),
                                  imagemUrl != "false"
                                      ? Image.network(imagemUrl,
                                          fit: BoxFit.fill)
                                      : Text(""),
                                  SizedBox(height: 7),
                                  Text(
                                    _parseHtmlString(imagemAlt),
                                    style: TextStyle(
                                      fontFamily: 'Piaui',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 22),
                                  ListInternalArticles(
                                    rendered:
                                        jsonDecode(snapshot.data)['content']
                                            ['rendered'],
                                    idMateria: idMateria,
                                  ),
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
          } else {
            return Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[CircularProgressIndicator()],
              ),
            );
          }
        });
  }
}
