import 'package:flutter/material.dart';
import 'package:piaui_app/app/modules/inside_magazine_logged/components/inside_article_logged_button.dart';

// import 'inside_article_button.dart';

class ListInsideArticles extends StatefulWidget {
  @override
  _ListInsideArticlesState createState() => _ListInsideArticlesState();
}

class _ListInsideArticlesState extends State<ListInsideArticles> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 13),
      itemCount: 3,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: InsideArticleLoggedButton(),
      ),
    );
  }
}
