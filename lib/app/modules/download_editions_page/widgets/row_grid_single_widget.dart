import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/download_editions_page/components/image_shimmer.dart';
import 'package:piaui_app/app/modules/download_editions_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/download_editions_page/widgets/bottom_download_widget.dart';
import 'package:piaui_app/app/modules/download_editions_page/widgets/bottom_orange_widget.dart';
import 'package:piaui_app/app/modules/editions_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/editions_page/model/edition_model.dart';
import 'package:piaui_app/app/modules/inside_magazine_download/view/inside_magazine_page.dart';
import 'package:piaui_app/app/shared/downloads/model/revist_download.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class RowGridSingleWidget extends StatefulWidget {
  final int index;

  const RowGridSingleWidget({Key key, this.index}) : super(key: key);

  @override
  _RowGridSingleWidgetState createState() => _RowGridSingleWidgetState();
}

class _RowGridSingleWidgetState
    extends ModularState<RowGridSingleWidget, DownLoadEditionPageController> {
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

    RevistDownload edition = controller.revistDownloads[widget.index];
    return Material(
      child: InkWell(
        onTap: () {
          Modular.to
              .pushNamed('/magazine_downloads', arguments: {"revist": edition});
          /*   Navigator.of(context).push(MaterialPageRoute(builder: (builder) {
          return InsideMagazinePage(controller.revistDownloads[widget.index]);
        })); */
        },
        child: Padding(
          padding: framePadding,
          child: Container(
            child: Column(
              crossAxisAlignment: columAlignH,
              mainAxisAlignment: columAlignV,
              children: [
                Container(
                  color: Colors.grey,
                  height: rowHeight * 0.80,
                  width: rowWidth * 0.92,
                  child: ImageShimmer(url: edition.capa),
                ),
                Container(
                  height: rowHeight * 0.15,
                  width: rowWidth * 0.92,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Ediçãoo #${edition.numberEdition}: ${edition.mes} de ${edition.ano}',
                            style: TextStyle(
                                fontFamily: 'Piaui',
                                fontSize: rowFontsize,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        SizedBox(height: 4),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Baixado (36 MB)',
                            style: TextStyle(
                                fontFamily: 'Palatino',
                                fontSize: 11.5,
                                fontWeight: FontWeight.normal,
                                color: Theme.of(context).primaryColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtomOrangeWidget(revist: edition),
                    ButtomDownLoadWidget(
                      id: edition.edicao.toString(),
                      numberEdition: edition.numberEdition.toString(),
                      month: edition.mes.toString(),
                      year: edition.mes,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
