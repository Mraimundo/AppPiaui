import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/subscribe_now/controller/subscribe_now_controller.dart';
import 'package:piaui_app/app/modules/subscribe_now/widgets/image_devices_widget.dart';
import 'package:piaui_app/app/modules/subscribe_now/widgets/row_text_widget.dart';
import 'package:piaui_app/app/modules/subscribe_now/widgets/top_text_widget.dart';
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';

class SubscribeNowPage extends StatefulWidget {
  final String title;
  const SubscribeNowPage({Key key, this.title = "SubscribeNow"})
      : super(key: key);

  @override
  _SubscribeNowPageState createState() => _SubscribeNowPageState();
}

class _SubscribeNowPageState
    extends ModularState<SubscribeNowPage, SubscribeNowController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    double vWidth = MediaQuery.of(context).size.width;
    double vFontSize = 33;
    return Scaffold(
      appBar: PreferredAppBarWidget(height: 60),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Flexible(
                      child: Container(
                        color: Colors.black,
                        child: Column(
                          children: [
                            topTextWidget(vWidth, vFontSize),
                            SizedBox(height: 0),
                            imageDevicesWidget(vWidth),
                            rowTextWidget(
                                vWidth, 60, 'Confira nossos planos*', 21,
                                fontWeight: FontWeight.bold),
                            Row(
                              children: [
                                Container(
                                  width: vWidth,
                                  height: 60,
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16),
                                          child: Container(
                                            color: Colors.green,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 16),
                                          child: Container(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
