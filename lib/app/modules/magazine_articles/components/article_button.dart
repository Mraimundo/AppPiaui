import 'package:flutter/material.dart';
import 'package:piaui_app/app/modules/magazine_articles/widgets/article_lock_tag.dart';

class ArticleButton extends StatefulWidget {
  @override
  _ArticleButtonState createState() => _ArticleButtonState();
}

class _ArticleButtonState extends State<ArticleButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Card(
        child: Container(
          color: Colors.white,
          height: 300,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              color: Colors.black,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Container(
                            color: Colors.green,
                          ),
                          ArticleLockTag(),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
