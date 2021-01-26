import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/edition_page/components/skeleton_row_grid.dart';
import 'package:piaui_app/app/modules/edition_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/edition_page/model/edition_model.dart';
import 'package:piaui_app/app/modules/edition_page/widgets/last_edition_widget.dart';
import 'package:piaui_app/app/modules/edition_page/widgets/load_more_widget.dart';
import 'package:piaui_app/app/modules/edition_page/widgets/more_editions_widget.dart';
import 'package:piaui_app/app/modules/edition_page/widgets/return_library_widget.dart';
import 'package:piaui_app/app/modules/edition_page/widgets/row_grid_double_widget.dart';
import 'package:piaui_app/app/modules/edition_page/widgets/row_grid_single_widget.dart';
import 'package:piaui_app/app/shared/components/app_bar_default_widget.dart';
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
        appBar: PreferredSize(
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [AppBarDefaultWidget()],
          )),
          preferredSize: Size.fromHeight(80),
        ),
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
                        Observer(
                          builder: (_) {
                            List<Widget> content = <Widget>[];
                            if (!controller.isLoading) {
                              int items = controller.itemCount;
                              if (items % 2 == 0) {
                                for (var i = 1; i < items; i += 2) {
                                  content.add(RowGridDoubleWidget(index: i));
                                }
                              } else {
                                for (var i = 1; i < items-1; i += 2) {
                                  content.add(RowGridDoubleWidget(index: i));
                                }
                                content.add(RowGridSingleWidget(index: items));
                              }

                              return Column(children: content);
                            } else {
                              return SkeletonRowGrid();
                            }
                          },
                        ),
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
