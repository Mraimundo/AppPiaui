import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/internal_magazine/components/list_internal_articles.dart';
import 'package:piaui_app/app/modules/internal_magazine/components/text_internal_magazine.dart';
import 'package:piaui_app/app/modules/internal_magazine/controller/internal_magazine_controller.dart';
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

Future<String> conteudo(idMateria) async {
  final _url =
      "https://piaui.homolog.inf.br/wp-json/wp/v2/materia/" + idMateria;
  var dio = Dio();
  var response = await dio.get(_url);
  return response.toString();
}

class InternalMagazinePage extends StatefulWidget {
  final String title;
  final String idMateria;
  final String edition;
  final String imagemUrl;
  final String imagemAlt;
  const InternalMagazinePage(
      {Key key,
      this.title = "InternalMagazine",
      this.idMateria = "",
      this.edition = "",
      this.imagemUrl = "",
      this.imagemAlt = ""})
      : super(key: key);

  @override
  _InternalMagazinePageState createState() =>
      _InternalMagazinePageState(idMateria, edition, imagemUrl, imagemAlt);
}

class _InternalMagazinePageState
    extends ModularState<InternalMagazinePage, InternalMagazineController> {
  //use 'controller' variable to access controller

  String idMateria;
  String edition;
  String imagemUrl;
  String imagemAlt;

  _InternalMagazinePageState(
      this.idMateria, this.edition, this.imagemUrl, this.imagemAlt);

  @override
  Widget build(context) {
    print(imagemUrl);
    print(imagemAlt);
    return FutureBuilder<String>(
        future: conteudo(idMateria),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: PreferredAppBarWidget(height: 56),
              backgroundColor: AppColors.backgroundColor,
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
                                    edition: edition,
                                    title: jsonDecode(snapshot.data)["title"]
                                            ["rendered"]
                                        .toString()
                                        .toUpperCase(),
                                  ),
                                  Image.network(
                                    imagemUrl,
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(height: 7),
                                  Text(
                                    imagemAlt,
                                    style: TextStyle(
                                      fontFamily: 'Piaui',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textColorNormal,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 22),
                                  ListInternalArticles(),
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
            return CircularProgressIndicator();
          }
        });
  }
}
