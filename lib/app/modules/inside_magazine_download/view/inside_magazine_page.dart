/* import 'dart:convert'; */
import 'package:flutter_session/flutter_session.dart';
/* import 'package:http/http.dart'; */
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/inside_magazine_download/components/list_inside_articles.dart';
import 'package:piaui_app/app/modules/inside_magazine_download/components/text_magazine.dart';
import 'package:piaui_app/app/modules/inside_magazine_download/controller/inside_magazine_controller.dart';
/* import 'package:piaui_app/app/modules/inside_magazine_download/model/inside_model.dart';
import 'package:piaui_app/app/modules/inside_magazine_download/repository/inside_repository.dart'; */
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';
import 'package:piaui_app/app/shared/downloads/model/revist_download.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class InsideMagazinePage extends StatefulWidget {
  final RevistDownload revist;
  InsideMagazinePage({Key key, this.revist}) : super(key: key);

  @override
  _InsideMagazinePageState createState() => _InsideMagazinePageState();
}

class _InsideMagazinePageState extends State<InsideMagazinePage> {
  //use 'controller' variable to access controller
  _InsideMagazinePageState();

  @override
  Widget build(BuildContext context) {
    /*   readUser().then((value) => {user = value});
 */
    return Scaffold(
      appBar: PreferredAppBarWidget(height: 56),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: LayoutBuilder(
                builder:
                    (BuildContext context, BoxConstraints viewportConstraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextMagazine(
                              title: widget.revist.numberEdition.toString(),
                              edicao: widget.revist.numberEdition.toString()),
                          ListInsideArticles(
                            revist: widget.revist,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
