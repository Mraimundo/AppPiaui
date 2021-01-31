import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/edition_page/controller/edition_page_controller.dart';
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
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(125, 26, 125, 26),
                      child: FlatButton(
                        color: AppColors.bottomAppBar,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'CARREGAR MAIS',
                              style: TextStyle(
                                  color: AppColors.textColorWhite,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.textColorWhite,
                              size: 35,
                            )
                          ],
                        ),
                        onPressed: () {
                          print("Loading new page? R: ${controller.loadPage}");
                          if (!controller.loadPage) {
                            if (numberEditions % 2 == 0) {
                              if (items < numberEditions - 2) {
                                controller.itemCount += 2;
                                rows += 2;
                                if (rows >= 8) {
                                  controller.nextPage();
                                  rows = 0;
                                }
                                //controller.nextPage();
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
}
