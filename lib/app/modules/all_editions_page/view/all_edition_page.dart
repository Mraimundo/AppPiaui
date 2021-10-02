import 'package:flutter/material.dart';
import 'package:piaui_app/app/modules/all_editions_page/widgets/list_magazine.dart';
import 'package:piaui_app/app/modules/download_editions_page/view/download_edition_page.dart';
import 'package:piaui_app/app/shared/components/app_bar/login/model/auth_user.dart';
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class AllEditionPage extends StatelessWidget {
  // final GoogleSignInAccount user;
  final Dados user;
  final bool conected;
  const AllEditionPage({Key key, this.user, this.conected = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return conected
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: PreferredAppBarWidget(height: 56),
              body: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: Size(100, 53),
                    child: SafeArea(
                      child: Container(
                        height: 100,
                        color: AppColors.appBar,
                        child: Column(
                          children: [
                            TabBar(
                              indicatorColor: AppColors.orangePiaui,
                              indicatorSize: TabBarIndicatorSize.label,
                              indicatorWeight: 6,
                              tabs: const <Widget>[
                                Tab(
                                  child: Text(
                                    'Todas as edições',
                                    style: TextStyle(
                                      fontFamily: 'Palatino',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Meus downloads',
                                    style: TextStyle(
                                      fontFamily: 'Palatino',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  body: TabBarView(
                    children: <Widget>[
                      ListMagazine(user: user),
                      DownLoadEditionPage(user: user)
                    ],
                  ),
                ),
              ),
            ),
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: PreferredAppBarWidget(height: 56),
              body: DefaultTabController(
                length: 1,
                child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: Size(100, 53),
                    child: SafeArea(
                      child: Container(
                        height: 100,
                        color: AppColors.appBar,
                        child: Column(
                          children: [
                            TabBar(
                              indicatorColor: AppColors.orangePiaui,
                              indicatorSize: TabBarIndicatorSize.label,
                              indicatorWeight: 6,
                              tabs: const <Widget>[
                                Tab(
                                  child: Text(
                                    'Meus downloads',
                                    style: TextStyle(
                                      fontFamily: 'Palatino',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  body: TabBarView(
                    children: <Widget>[DownLoadEditionPage(user: user)],
                  ),
                ),
              ),
            ),
          );
  }
}
