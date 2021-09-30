import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:piaui_app/app/shared/downloads/model/revist_download.dart';

import 'inside_article_button.dart';

class ListInsideArticles extends StatefulWidget {
  final RevistDownload revist;

  const ListInsideArticles({Key key, this.revist}) : super(key: key);

  @override
  _ListInsideArticlesState createState() => _ListInsideArticlesState();
}

class _ListInsideArticlesState extends State<ListInsideArticles> {
  @override
  Widget build(context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 13),
      itemCount: 1,
      itemBuilder: (_, index) =>
          InsideArticleButton(index: index, revist: widget.revist),
    );
  }
}
