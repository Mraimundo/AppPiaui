import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/editions_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/editions_page/widgets/last_edition_widget.dart';
import 'package:piaui_app/app/modules/editions_page/widgets/load_more_widget.dart';
import 'package:piaui_app/app/modules/editions_page/widgets/more_editions_widget.dart';
import 'package:piaui_app/app/modules/editions_page/widgets/return_library_widget.dart';
import 'package:piaui_app/app/modules/editions_page/widgets/row_grid_widget.dart';
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';
import 'package:piaui_app/app/shared/components/bottom_app_bar_widget.dart';

class EditionPage extends StatefulWidget {
  final String title;
  const EditionPage({Key key, this.title = "EditionPage"}) : super(key: key);

  @override
  _EditionPageState createState() => _EditionPageState();
}

class _EditionPageState
    extends ModularState<EditionPage, EditionPageController> {
  //use 'controller' variable to access controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredAppBarWidget(height: 60),
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
                          child:
                              Text('Dummie text, heigh of BottomAppBarWidget'),
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
