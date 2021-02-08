import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/magazine_articles/components/back_to_magazine.dart';
import 'package:piaui_app/app/modules/magazine_articles/components/list_articles.dart';
import 'package:piaui_app/app/modules/magazine_articles/controller/magazine_articles_controller.dart';
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';
import 'package:piaui_app/app/shared/components/bottom_app_bar_widget.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class MagazineArticlesPage extends StatefulWidget {
  final String title;
  const MagazineArticlesPage({Key key, this.title = "MagazineArticles"})
      : super(key: key);

  @override
  _MagazineArticlesPageState createState() => _MagazineArticlesPageState();
}

class _MagazineArticlesPageState
    extends ModularState<MagazineArticlesPage, MagazineArticlesController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredAppBarWidget(height: 60),
      body: Column(
        children: [
          BottomAppBarWidget(),
          Expanded(
            child: Container(
              color: AppColors.appBackground,
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
                          BackToMagazine(),
                          ListArticles(),
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
