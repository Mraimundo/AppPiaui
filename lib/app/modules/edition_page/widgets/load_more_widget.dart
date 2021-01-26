import 'package:flutter/material.dart';
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
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 120,
            color: Colors.white,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(125, 26, 125, 26),
                child: FlatButton(
                  color: AppColors.bottomAppBar,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'CARREGAR MAIS',
                        style: TextStyle(color: AppColors.textColorWhite),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.textColorWhite,
                        size: 30,
                      )
                    ],
                  ),
                  onPressed: () {
                    int numberEditions = controller.editions.length;
                    int items = controller.itemCount;
                    if (items < numberEditions) {
                      controller.itemCount += 2;
                    } else {
                    }
                  },
                )),
          ),
        ),
      ],
    );
  }
}
