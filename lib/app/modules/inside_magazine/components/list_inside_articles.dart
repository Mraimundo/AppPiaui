import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

import 'inside_article_button.dart';

Future<String> readUser() async {
  return await FlutterSession().get("user");
}

class ListInsideArticles extends StatefulWidget {
  final String user;
  final String url;
  const ListInsideArticles({Key key, this.user = "", this.url = ""})
      : super(key: key);

  @override
  _ListInsideArticlesState createState() => _ListInsideArticlesState(url);
}

class _ListInsideArticlesState extends State<ListInsideArticles> {
  String user;
  String url;

  _ListInsideArticlesState(this.url);

  /*  @override
  Widget build(BuildContext context) {
    readUser().then((data) {
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => SizedBox(height: 13),
        itemCount: 3,
        itemBuilder: (_, index) =>
            InsideArticleButton(idMateria: index.toString(), user: 'Teste'),
      ); // doesn't work
    });
  } */

  @override
  Widget build(context) {
    return FutureBuilder<String>(
        future: readUser(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(height: 13),
              itemCount: 1,
              itemBuilder: (_, index) => InsideArticleButton(
                idMateria: index.toString(),
                user: snapshot.data,
                url: this.url,
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
