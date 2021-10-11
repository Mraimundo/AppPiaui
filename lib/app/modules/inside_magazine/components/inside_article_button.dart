import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:piaui_app/app/shared/core/custom_dio.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'package:piaui_app/app/modules/inside_magazine/controller/inside_magazine_controller.dart';
import 'package:html/parser.dart';

Future<dynamic> readUser() async {
  return await FlutterSession().get("user");
}

Future<String> materias(url) async {
  final _url = url;
  var dio = CustomDio().instance;
  var response = await dio.get(_url + "&perpage=0");
  return response.toString();
}

String _parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body.text).documentElement.text;

  return parsedString;
}

class InsideArticleButton extends StatefulWidget {
  final String url;
  final String id;
  final String idMateria;
  final String user;
  final String data;

  const InsideArticleButton(
      {Key key,
      this.url = "",
      this.id,
      this.idMateria = "",
      this.user = "",
      this.data = ""})
      : super(key: key);
  @override
  _InsideArticleButtonState createState() =>
      _InsideArticleButtonState(idMateria, user, url, data);
}

class _InsideArticleButtonState
    extends ModularState<InsideArticleButton, InsideMagazineController> {
  String idMateria;
  var user;
  var teste;
  String url;
  String data;

  _InsideArticleButtonState(this.idMateria, this.user, this.url, this.data);

  @override
  void initState() {
    super.initState();
    controller.findAll();
  }

  @override
  Widget build(context) {
    return FutureBuilder<String>(
        future: materias(url),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(height: 13),
              itemCount: jsonDecode(snapshot.data)["materias"].length,
              itemBuilder: (_, index) => TextButton(
                onPressed: () async {
                  if (user == "" && index > 4) {
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
                  }
                },
                child: _makeListSubjects(user, snapshot.data, index),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircularProgressIndicator(),
                ],
              ),
            );
          }
        });
  }

  Card _makeListSubjects(String user, String data, int pos) {
    var jsonData = jsonDecode(data)["materias"];

    return Card(
      elevation: 0,
      child: Container(
        color: Theme.of(context).bottomAppBarColor,
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
                  child: jsonData[(pos + 1).toString()]["imagemcapa"]["url"] !=
                          false
                      ? Image.network(
                          jsonData[(pos + 1).toString()]["imagemcapa"]["url"]
                              .toString(),
                          fit: BoxFit.fill)
                      : Text(""),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                child: user == "" && pos > 4
                    ? Image.asset("assets/images/fechado.png")
                    : Text(""),
              )
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
                            jsonData[(pos + 1).toString()]["titulo"]
                                        .toString()
                                        .length <
                                    25
                                ? _parseHtmlString(
                                    jsonData[(pos + 1).toString()]["titulo"]
                                        .toString()
                                        .toUpperCase())
                                : _parseHtmlString(
                                        jsonData[(pos + 1).toString()]["titulo"]
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
                    Text(
                        _parseHtmlString(jsonData[(pos + 1).toString()]
                                ["gravata"]
                            .toString()),
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).cardColor,
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
}
