import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/edition_page/components/skeleton_row_grid.dart';
import 'package:piaui_app/app/modules/edition_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/edition_page/widgets/row_grid_double_widget.dart';
import 'package:piaui_app/app/modules/edition_page/widgets/row_grid_single_widget.dart';

class RowGridWidget extends StatefulWidget {
  @override
  _RowGridWidgetState createState() => _RowGridWidgetState();
}

class _RowGridWidgetState
    extends ModularState<RowGridWidget, EditionPageController> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        List<Widget> content = <Widget>[];
        if (!controller.isLoading) {
          int items = controller.itemCount;
          if (items % 2 == 0) {
            for (var i = 1; i < items; i += 2) {
              content.add(RowGridDoubleWidget(index: i));
            }
          } else {
            for (var i = 1; i < items - 1; i += 2) {
              content.add(RowGridDoubleWidget(index: i));
            }
            content.add(RowGridSingleWidget(index: items));
          }

          return Column(children: content);
        } else {
          return SkeletonRowGrid();
        }
      },
    );
  }
}
