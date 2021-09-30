import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/download_editions_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/editions_page/components/image_shimmer.dart';
import 'package:piaui_app/app/modules/editions_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/editions_page/model/edition_model.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class RowGridSingleWidget extends StatefulWidget {
  final int index;

  const RowGridSingleWidget({Key key, this.index}) : super(key: key);

  @override
  _RowGridSingleWidgetState createState() => _RowGridSingleWidgetState();
}

class _RowGridSingleWidgetState
    extends ModularState<RowGridSingleWidget, EditionPageController> {
  @override
  Widget build(BuildContext context) {
    final double rowHeight = 250;
    final double rowWidth = MediaQuery.of(context).size.width / 2.2;
    final double rowFontsize = 11;
    const framePadding = EdgeInsets.fromLTRB(0, 8, 0, 0);
    CrossAxisAlignment columAlignH = CrossAxisAlignment.center;
    MainAxisAlignment columAlignV = MainAxisAlignment.end;
    CrossAxisAlignment rowAlignV = CrossAxisAlignment.center;
    MainAxisAlignment rowAlignH = MainAxisAlignment.center;
    Acf edition = controller.editionsSinglePage[widget.index].acf;
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: AppColors.appBackground,
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: rowAlignV,
                mainAxisAlignment: rowAlignH,
                children: [
                  Padding(
                    padding: framePadding,
                    child: Container(
                      color: Colors.white,
                      height: rowHeight,
                      width: rowWidth,
                      child: Column(
                        crossAxisAlignment: columAlignH,
                        mainAxisAlignment: columAlignV,
                        children: [
                          Container(
                            color: Colors.grey,
                            height: rowHeight * 0.80,
                            width: rowWidth * 0.85,
                            child: ImageShimmer(url: edition.capa.url),
                          ),
                          Container(
                            color: Colors.white,
                            height: rowHeight * 0.15,
                            width: rowWidth * 0.85,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Edição #${edition.numberEdition}: ${edition.mes} de ${edition.ano}',
                                style: TextStyle(fontSize: rowFontsize),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
