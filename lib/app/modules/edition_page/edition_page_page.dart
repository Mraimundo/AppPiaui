import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/edition_page/widgets/last_edition_widget.dart';
import 'package:piaui_app/app/modules/edition_page/widgets/load_more_widget.dart';
import 'package:piaui_app/app/modules/edition_page/widgets/more_editions_widget.dart';
import 'package:piaui_app/app/modules/edition_page/widgets/return_library_widget.dart';
import 'package:piaui_app/app/modules/edition_page/widgets/row_grid_widget.dart';
import 'package:piaui_app/app/shared/components/app_bar_default_widget.dart';
import 'package:piaui_app/app/shared/components/bottom_app_bar_widget.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'edition_page_controller.dart';

class EditionPagePage extends StatefulWidget {
  final String title;
  const EditionPagePage({Key key, this.title = "EditionPage"})
      : super(key: key);

  @override
  _EditionPagePageState createState() => _EditionPagePageState();
}

class _EditionPagePageState
    extends ModularState<EditionPagePage, EditionPageController> {
  //use 'controller' variable to access controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarDefaultWidget(),
        body: Stack(
          children: [
            LayoutBuilder(
              builder:
                  (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          color: Colors.white,
                          child: Text(
                              'Dummie text, heigh of BottomAppBarWidget'),
                        ),
                        ReturnLibraryWidget(),
                        LastEditionWidget(),
                        MoreEditionsWidget(),
                        RowGridWidget(),
                        LoadMoreWidget(),
                      ],
                    ),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.topCenter,
              child: BottomAppBarWidget(),
            ),
          ],
        ));
  }
}
