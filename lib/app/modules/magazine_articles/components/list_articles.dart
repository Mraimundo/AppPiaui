import 'package:flutter/material.dart';

import 'article_button.dart';

class ListArticles extends StatefulWidget {
  @override
  _ListArticlesState createState() => _ListArticlesState();
}

class _ListArticlesState extends State<ListArticles> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 20),
      itemCount: 20,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ArticleButton(),
      ),
    );
  }
}
