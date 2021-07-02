import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/editions_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class LoadMoreWidget extends StatefulWidget {
  @override
  _LoadMoreWidgetState createState() => _LoadMoreWidgetState();
}

class _LoadMoreWidgetState
    extends ModularState<LoadMoreWidget, EditionPageController> {
  @override
  Widget build(BuildContext context) {
    int rows = 6;

    return Observer(
      builder: (_) {
        if (!controller.isLoading) {
          int numberEditions = controller.editionsSinglePage.length;
          int items = controller.itemCount;
          return Visibility(
            visible: items < numberEditions - 1 && !controller.loadPage,
            replacement: Container(),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 120,
                    color: AppColors.appBackground,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton.icon(
                          icon: Icon(Icons.keyboard_arrow_down, size: 35),
                          label: buildText('CARREGAR MAIS'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Text buildText(String text) => Text(text, style: TextStyle(fontSize: 28));
}
