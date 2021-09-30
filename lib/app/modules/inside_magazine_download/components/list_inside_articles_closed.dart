import 'package:flutter/material.dart';
import 'package:piaui_app/app/modules/inside_magazine_download/components/inside_article_button_closed.dart';

class ListInsideArticlesClosed extends StatefulWidget {
  @override
  _ListInsideArticlesClosedState createState() =>
      _ListInsideArticlesClosedState();
}

class _ListInsideArticlesClosedState extends State<ListInsideArticlesClosed> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 13),
      itemCount: 3,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: InsideArticleButtonClosed(),
      ),
    );
  }
}
