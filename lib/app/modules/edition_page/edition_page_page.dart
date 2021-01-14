import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/shared/components/app_bar_default_widget.dart';
import 'package:piaui_app/app/shared/components/bottom_app_bar_widget.dart';
import 'edition_page_controller.dart';

class EditionPagePage extends StatefulWidget {
  final String title;
  const EditionPagePage({Key key, this.title = "EditionPage"})
      : super(key: key);

  @override
  _EditionPagePageState createState() => _EditionPagePageState();
}

class _EditionPagePageState
    extends ModularState<EditionPagePage, EditionPageController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefaultWidget(),
      body: Column(
        children: <Widget>[
          BottomAppBarWidget()
        ],
      ),
    );
  }
}
