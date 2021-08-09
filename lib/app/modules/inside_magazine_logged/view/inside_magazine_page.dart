import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/inside_magazine_logged/components/list_inside_articles_closed.dart';
import 'package:piaui_app/app/modules/inside_magazine_logged/components/list_inside_logged_articles.dart';
import 'package:piaui_app/app/modules/inside_magazine_logged/components/text_magazine.dart';
import 'package:piaui_app/app/modules/inside_magazine_logged/controller/inside_magazine_logged_controller.dart';
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class InsideMagazineLoggedPage extends StatefulWidget {
  final String title;
  const InsideMagazineLoggedPage({Key key, this.title = "InsideMagazine"})
      : super(key: key);

  @override
  _InsideMagazineLoggedPageState createState() =>
      _InsideMagazineLoggedPageState();
}

class _InsideMagazineLoggedPageState extends ModularState<
    InsideMagazineLoggedPage, InsideMagazineLoggeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredAppBarWidget(height: 56),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: LayoutBuilder(
                builder:
                    (BuildContext context, BoxConstraints viewportConstraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextMagazine(),
                          ListInsideArticles(),
                          ListInsideArticlesClosed(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
