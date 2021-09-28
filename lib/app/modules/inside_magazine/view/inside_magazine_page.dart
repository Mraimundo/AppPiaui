/* import 'dart:convert'; */
import 'package:flutter_session/flutter_session.dart';
/* import 'package:http/http.dart'; */
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/inside_magazine/components/inside_materia_closed%20.dart';
import 'package:piaui_app/app/modules/inside_magazine/components/inside_material.dart';
import 'package:piaui_app/app/modules/inside_magazine/components/list_inside_articles.dart';
import 'package:piaui_app/app/modules/inside_magazine/components/text_magazine.dart';
import 'package:piaui_app/app/modules/inside_magazine/controller/inside_magazine_controller.dart';
/* import 'package:piaui_app/app/modules/inside_magazine/model/inside_model.dart';
import 'package:piaui_app/app/modules/inside_magazine/repository/inside_repository.dart'; */
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

Future<dynamic> readUser() async {
  return await FlutterSession().get("user");
}

class InsideMagazinePage extends StatefulWidget {
  final String url;
  final String title;
  final String edicao;
  final String data;

  const InsideMagazinePage(
      {Key key,
      this.title = "",
      this.url = "",
      this.edicao = "",
      this.data = ""})
      : super(key: key);

  @override
  _InsideMagazinePageState createState() =>
      _InsideMagazinePageState(url, title, edicao, data);
}

class _InsideMagazinePageState
    extends ModularState<InsideMagazinePage, InsideMagazineController> {
  var user;
  String url;
  var title;
  var edicao;
  var data;
  //use 'controller' variable to access controller
  _InsideMagazinePageState(this.url, this.title, this.edicao, this.data);

  @override
  Widget build(BuildContext context) {
    readUser().then((value) => {user = value});

    return Scaffold(
      appBar: PreferredAppBarWidget(height: 56),
      backgroundColor: AppColors.backgroundColor,
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
                          TextMagazine(title: title, edicao: edicao),
                          ListInsideArticles(
                              user: user, url: this.url, data: data),
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
