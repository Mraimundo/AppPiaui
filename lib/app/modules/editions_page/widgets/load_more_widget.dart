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
            child: Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 51),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_circle,
                            color: AppColors.backgroundColorLastEdition,
                            size: 55,
                          )
                        ],
                      ),
                      onPressed: () {
                        if (!controller.loadPage) {
                          if (numberEditions % 2 == 0) {
                            if (items < numberEditions - 2) {
                              controller.itemCount += 2;
                              rows += 2;
                              if (rows >= 8) {
                                controller.nextPage();
                                rows = 0;
                              }
                              print('ItemCount ${controller.itemCount}');
                              print('rows = $rows');
                            } else {
                              if (items <= numberEditions) {
                                controller.itemCount++;
                                print('ItemCount ${controller.itemCount}');
                              }
                            }
                          } else {
                            if (items <= numberEditions) {
                              controller.itemCount++;
                              print('ItemCount ${controller.itemCount}');
                            }
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
