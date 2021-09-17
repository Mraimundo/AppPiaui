import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/inside_magazine/components/list_inside_articles.dart';
import 'package:piaui_app/app/modules/inside_magazine/components/list_inside_articles_closed.dart';
import 'package:piaui_app/app/modules/inside_magazine/components/text_magazine.dart';
import 'package:piaui_app/app/modules/inside_magazine/controller/inside_magazine_controller.dart';
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class InsideMagazinePage extends StatefulWidget {
  final String url;
  final String title;
  const InsideMagazinePage(
      {Key key, this.title = "InsideMagazine", this.url = ""})
      : super(key: key);

  @override
  _InsideMagazinePageState createState() => _InsideMagazinePageState();
}

class _InsideMagazinePageState
    extends ModularState<InsideMagazinePage, InsideMagazineController> {
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
                          // InsideArticleButton(),
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
