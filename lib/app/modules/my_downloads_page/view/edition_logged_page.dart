import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/all_editions_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/border_top_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/filter_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/last_edition_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/load_more_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/row_grid_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/text_has_no_signature_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/text_to_sign_widget.dart';
import 'package:piaui_app/app/modules/screen/screen_first.dart';
import 'package:piaui_app/app/modules/screen/screen_second.dart';
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';
import 'package:piaui_app/app/shared/components/signature/widgets/button_to_cancel_widget.dart';
import 'package:piaui_app/app/shared/components/signature/widgets/button_to_get_widget.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'package:piaui_app/app/shared/layout/gradients.dart';

class EditionLoggedPage extends StatefulWidget {
  final String title;

  const EditionLoggedPage({Key key, this.title = "EditionPage"})
      : super(key: key);

  @override
  _EditionLoggedPageState createState() => _EditionLoggedPageState();
}

class _EditionLoggedPageState
    extends ModularState<EditionLoggedPage, AllEditionPageController> {
  //use 'controller' variable to access controller
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredAppBarWidget(height: 56),
          backgroundColor: AppColors.backgroundColor,
          body: Stack(
            children: [
              LayoutBuilder(
                builder:
                    (BuildContext context, BoxConstraints viewportConstraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),
                      // child: Column(
                      //   children: [
                      //     BorderTopWidget(),
                      //     Container(
                      //       height: 42,
                      //       width: 400,
                      //       color: AppColors.appBar,
                      //       child: Padding(
                      //         padding: const EdgeInsets.only(left: 20, right: 20),
                      //         child: Column(
                      //           children: [
                      //             TabBar(
                      //               tabs: <Widget>[
                      //                 Tab(
                      //                   text: "Primeiro",
                      //                 ),
                      //                 Tab(
                      //                   text: "Segundo",
                      //                 ),
                      //               ],
                      //             ),
                      //             TabBarView(
                      //               children: <Widget>[
                      //                 // ScreenFirst(),
                      //                 // ScreenSecond()
                      //               ],
                      //             )
                      //           ],
                      //         ),
                      //       ),

                      //       // child: TextToSignWidget(
                      //       //   onTap: () {
                      //       //     Modular.to.pushNamed('/login');
                      //       //   },
                      //       // ),
                      //     ),
                      //     SizedBox(height: 23),
                      //     Padding(
                      //       padding: const EdgeInsets.only(
                      //           top: 21, right: 30, left: 30, bottom: 25),
                      //       child: BorderTopWidget(),
                      //     ),
                      //     Padding(
                      //       padding: const EdgeInsets.only(
                      //         left: 25,
                      //         right: 25,
                      //       ),
                      //       child: FilterWidget(),
                      //     ),
                      //     LastEditionWidget(),
                      //     RowGridWidget(),
                      //     LoadMoreWidget(),
                      //   ],
                      // ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
}
