import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/subscribe_now/controller/subscribe_now_controller.dart';
import 'package:piaui_app/app/modules/subscribe_now/widgets/image_devices_widget.dart';
import 'package:piaui_app/app/modules/subscribe_now/widgets/row_text_widget.dart';
import 'package:piaui_app/app/modules/subscribe_now/widgets/top_text_widget.dart';
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

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
                        color: AppColors.appBackground,
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
                                  height: 50,
                                  color: AppColors.appBackground,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16),
                                          child: SizedBox.expand(
                                            child: Container(
                                              //color: Colors.green,
                                              child: Card(
                                                elevation: 0,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 8),
                                                  child: Row(
                                                    children: [
                                                      Text('1 ano'),
                                                    ],
                                                  ),
                                                ),
                                                margin: EdgeInsets.all(1),
                                                shape: Border(
                                                  right: BorderSide.none,
                                                  bottom: BorderSide(
                                                      width: 1,
                                                      color: Colors.grey[300]),
                                                  left: BorderSide(
                                                      width: 1,
                                                      color: Colors.grey[300]),
                                                  top: BorderSide(
                                                      width: 1,
                                                      color: Colors.grey[300]),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 16),
                                          child: SizedBox.expand(
                                            child: FlatButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Assine agora',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              color: AppColors.orangePiaui,
                                            ),
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
