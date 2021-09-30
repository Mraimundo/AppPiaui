import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:piaui_app/app/modules/editions_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/editions_page/widgets/border_top_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/filter_widget.dart';
import 'package:piaui_app/app/modules/editions_page/widgets/last_edition_widget.dart';
import 'package:piaui_app/app/modules/editions_page/widgets/load_more_widget.dart';
import 'package:piaui_app/app/modules/editions_page/widgets/row_grid_widget.dart';
import 'package:piaui_app/app/modules/editions_page/widgets/text_has_no_signature_widget.dart';
import 'package:piaui_app/app/modules/editions_page/widgets/text_to_sign_widget.dart';
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'package:piaui_app/app/shared/layout/gradients.dart';
import 'package:url_launcher/url_launcher.dart';

Future<String> teste() async {
  String res;
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      res = 'connected';
    }
  } on SocketException catch (_) {
    res = 'not connected';
  }
  return res;
}

class EditionPage extends StatefulWidget {
  final String title;

  const EditionPage({Key key, this.title = "EditionPage"}) : super(key: key);

  @override
  _EditionPageState createState() => _EditionPageState();
}

class _EditionPageState
    extends ModularState<EditionPage, EditionPageController> {
  _launchURL() async {
    const url = 'https://piaui.homolog.inf.br/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(context) {
    return FutureBuilder<String>(
        future: teste(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: PreferredAppBarWidget(height: 56),
              backgroundColor: AppColors.backgroundColor,
              body: Stack(
                children: [
                  LayoutBuilder(
                    builder: (BuildContext context,
                        BoxConstraints viewportConstraints) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: viewportConstraints.maxHeight,
                          ),
                          child: Column(
                            children: [
                              BorderTopWidget(),
                              Container(
                                height: 42,
                                width: 600,
                                color: AppColors.appBar,
                                child: TextToSignWidget(
                                  onTap: () {
                                    Modular.to.pushNamed('/login');
                                  },
                                ),
                              ),
                              SizedBox(height: 23),
                              TextHasNoSignatureWidget(onTap: () {
                                _launchURL();
                              }),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 21, right: 30, left: 30, bottom: 25),
                                child: BorderTopWidget(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 25,
                                  right: 25,
                                ),
                                child: FilterWidget(),
                              ),
                              LastEditionWidget(),
                              RowGridWidget(),
                              LoadMoreWidget(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 23),
                      TextHasNoSignatureWidget(
                        onTap: _launchURL,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 21, right: 30, left: 30, bottom: 25),
                        child: BorderTopWidget(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 25,
                          right: 25,
                        ),
                        child: FilterWidget(),
                      ),
                      LastEditionWidget(),
                      RowGridWidget(),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 25),
                        child: BorderTopWidget(),
                      ),
                      LoadMoreWidget(),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
