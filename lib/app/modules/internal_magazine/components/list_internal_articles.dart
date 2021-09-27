import 'package:flutter/material.dart';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:piaui_app/app/modules/internal_magazine/components/autor_internal_article.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'package:html/parser.dart';

String _parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body.text).documentElement.text;

  return parsedString;
}

class ListInternalArticles extends StatefulWidget {
  final String rendered;

  const ListInternalArticles({
    Key key,
    this.rendered,
  }) : super(key: key);

  @override
  _ListInternalArticlesState createState() =>
      _ListInternalArticlesState(rendered);
}

class _ListInternalArticlesState extends State<ListInternalArticles> {
  String rendered;
  _ListInternalArticlesState(this.rendered);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26, right: 29),
      child: Column(
        children: [
          DropCapText(
            rendered,
            style: TextStyle(
              height: 1.3,
              fontFamily: 'Palatino',
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: AppColors.textColorNormal,
            ),
            dropCapChars: 1,
          ),
          AutorInternalArticle(),
        ],
      ),
    );
  }
}
