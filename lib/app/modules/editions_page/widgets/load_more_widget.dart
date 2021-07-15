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
    double vHeight = MediaQuery.of(context).size.height;
    double vWidth = MediaQuery.of(context).size.width;
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
                      child: Container(
                        height: vHeight * 0.06,
                        width: vWidth / 2.1,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.orangePiaui,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'CARREGAR MAIS',
                              style: TextStyle(
                                  color: AppColors.orangePiaui,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.orangePiaui,
                              size: 35,
                            )
                          ],
                        ),
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
