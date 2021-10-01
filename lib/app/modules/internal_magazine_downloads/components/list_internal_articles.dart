import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:piaui_app/app/modules/internal_magazine_downloads/components/autor_internal_article.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'package:html/parser.dart';

import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;

String _parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body.text).documentElement.text;

  return parsedString;
}

class ListInternalArticles extends StatefulWidget {
  Map<String, dynamic> rendered;

  ListInternalArticles({Key key, this.rendered}) : super(key: key);

  @override
  _ListInternalArticlesState createState() => _ListInternalArticlesState();
}

class _ListInternalArticlesState extends State<ListInternalArticles> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26, right: 29),
      child: Column(
        children: [
          Html(data: widget.rendered['content']),
          AutorInternalArticle(autor: widget.rendered['Colaboradores']),
        ],
      ),
    );
  }
}
