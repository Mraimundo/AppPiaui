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
  final String data;
  const ListInsideArticles(
      {Key key, this.user = "", this.url = "", this.data = ""})
      : super(key: key);

  @override
  _ListInsideArticlesState createState() => _ListInsideArticlesState(url, data);
}

class _ListInsideArticlesState extends State<ListInsideArticles> {
  String user;
  String url;
  String data;

  _ListInsideArticlesState(this.url, this.data);

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
                data: data,
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
