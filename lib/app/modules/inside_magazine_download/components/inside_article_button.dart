import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:piaui_app/app/shared/downloads/model/materia.dart';
import 'package:piaui_app/app/shared/downloads/model/revist_download.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'package:piaui_app/app/modules/inside_magazine_download/controller/inside_magazine_controller.dart';
import 'package:html/parser.dart';

String _parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body.text).documentElement.text;

  return parsedString;
}

class InsideArticleButton extends StatefulWidget {
  RevistDownload revist;
  int index;
  InsideArticleButton({Key key, this.index, this.revist}) : super(key: key);
  @override
  _InsideArticleButtonState createState() => _InsideArticleButtonState();
}

class _InsideArticleButtonState extends State<InsideArticleButton> {
  _InsideArticleButtonState();

  @override
  Widget build(context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 13),
      itemCount: widget.revist.materias.length,
      itemBuilder: (_, index) => TextButton(
        onPressed: () async {
          /*  if (user == "" && index > 4) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Usuário não está logado')));
                    Modular.to.pushNamed('/login');
                  } else {
                    Modular.to.pushNamed('/internal', arguments: {
                      "idMateria": jsonDecode(snapshot.data)["materias"]
                          [(index + 1).toString()]["id"],
                      "edition": jsonDecode(snapshot.data)["edicoes"]["1"]
                          ["titulo"],
                      "imagemUrl": jsonDecode(snapshot.data)["materias"]
                          [(index + 1).toString()]["imagemcapa"]["url"],
                      "imagemAlt": jsonDecode(snapshot.data)["materias"]
                          [(index + 1).toString()]["imagemcapa"]["alt"],
                      "data": data
                    });
                  } */
        },
        child: _makeListSubjects(widget.revist, index),
      ),
    );
  }
}

Card _makeListSubjects(RevistDownload revist, int pos) {
  List<dynamic> jsonData = revist.materias;
  Map<String, dynamic> materiaMap = jsonData[pos];

  return Card(
    elevation: 0,
    child: Container(
      color: AppColors.cardColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.black.withOpacity(1),
              child: Container(
                child: Image.network(materiaMap['image'], fit: BoxFit.fill),
              ),
            ),
            /* Positioned(
                left: 0,
                right: 0,
                child: user == "" && pos > 4
                    ? Image.asset("assets/images/fechado.png")
                    : Text(""),
              ) */
          ]),
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          materiaMap['title'].toString().length < 25
                              ? _parseHtmlString(
                                  materiaMap['title'].toString().toUpperCase())
                              : _parseHtmlString(materiaMap['title']
                                      .toString()
                                      .substring(0, 25)
                                      .toUpperCase()) +
                                  "...",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.orangePiaui,
                          ),
                          // maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      Image.asset(
                        'assets/images/arrow.png',
                        // fit: BoxFit.fill,
                      ),
                    ],
                  ),
                  SizedBox(height: 3),
                  Text(_parseHtmlString(materiaMap['subTitle']),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: AppColors.textColorArticle,
                      ),
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
