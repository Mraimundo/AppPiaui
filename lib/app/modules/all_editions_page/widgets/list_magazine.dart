import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/border_top_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/filter_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/last_edition_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/load_more_widget.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/row_grid_widget.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class ListMagazine extends StatelessWidget {
  final GoogleSignInAccount user;
  const ListMagazine({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: Stack(
        children: [
          LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 23),
                          child: Center(
                            child: Text(
                              'Bem-vindo à piauí,  ' + user.displayName,
                              style: TextStyle(
                                height: 1.3,
                                fontFamily: 'Piaui',
                                fontSize: 17.5,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textColorNormal,
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 21, right: 25, left: 25, bottom: 25),
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
              );
            },
          ),
        ],
      ),
    );
  }
}