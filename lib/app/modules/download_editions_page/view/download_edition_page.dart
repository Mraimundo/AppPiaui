import 'package:flutter/material.dart';
import 'package:piaui_app/app/modules/download_editions_page/widgets/border_top_widget.dart';
import 'package:piaui_app/app/modules/download_editions_page/widgets/filter_widget.dart';
import 'package:piaui_app/app/modules/download_editions_page/widgets/load_more_widget.dart';
import 'package:piaui_app/app/modules/download_editions_page/widgets/row_grid_widget.dart';
import 'package:piaui_app/app/shared/components/app_bar/login/model/auth_user.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class DownLoadEditionPage extends StatelessWidget {
  // final GoogleSignInAccount user;
  final Dados user;
  const DownLoadEditionPage({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 23),
                    Center(
                      child: Text(
                        'Bem-vindo à piauí, ' + user.nome,
                        style: TextStyle(
                          height: 1.3,
                          fontFamily: 'Piaui',
                          fontSize: 17.5,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColorNormal,
                        ),
                      ),
                    ),
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
                    // LastEditionWidget(),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: RowGridWidget(),
                    ),
                    /*   LoadMoreWidget(), */
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
