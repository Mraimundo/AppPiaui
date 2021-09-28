import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/download_editions_page/components/skeleton_row_grid.dart';
import 'package:piaui_app/app/modules/download_editions_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/editions_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/download_editions_page/widgets/row_grid_double_widget.dart';
import 'package:piaui_app/app/modules/download_editions_page/widgets/row_grid_single_widget.dart';
import 'package:piaui_app/app/shared/downloads/downloads_controller.dart';

class RowGridWidget extends StatefulWidget {
  final DownloadsController downloads = DownloadsController();
  @override
  _RowGridWidgetState createState() => _RowGridWidgetState();
}

class _RowGridWidgetState
    extends ModularState<RowGridWidget, DownLoadEditionPageController> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        List<Widget> content = <Widget>[];
        if (!controller.isLoading) {
          int items = controller.revistDownloads.length;
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
