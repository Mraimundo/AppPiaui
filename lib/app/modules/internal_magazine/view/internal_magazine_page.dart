import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/internal_magazine/components/list_internal_articles.dart';
import 'package:piaui_app/app/modules/internal_magazine/components/text_internal_magazine.dart';
import 'package:piaui_app/app/modules/internal_magazine/controller/internal_magazine_controller.dart';
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class InternalMagazinePage extends StatefulWidget {
  final String title;
  const InternalMagazinePage({Key key, this.title = "InternalMagazine"})
      : super(key: key);

  @override
  _InternalMagazinePageState createState() => _InternalMagazinePageState();
}

class _InternalMagazinePageState
    extends ModularState<InternalMagazinePage, InternalMagazineController> {
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
                          TextInternalMagazine(),
                          Image.network(
                            'https://piaui.homolog.inf.br/wp-content/uploads/2021/03/175_dossiepiaui_colunainteira.jpg',
                            fit: BoxFit.fill,
                          ),
                          SizedBox(height: 7),
                          Text(
                            'Intervenção de Paula Cardoso sobre fotos Pedro Ladeira/Folhapress',
                            style: TextStyle(
                              fontFamily: 'Piaui',
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColorNormal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 22),
                          ListInternalArticles(),
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
