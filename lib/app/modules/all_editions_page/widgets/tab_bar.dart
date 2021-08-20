// import 'dart:html';

import 'package:flutter/material.dart';
// import 'package:projeto_teste/modules/google_sign/google_sign.dart';
// import 'package:projeto_teste/modules/magazine/magazine_page.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({Key key, List<Widget> tabs}) : super(key: key);

  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabView'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: Column(
              children: [
                TabBar(
                  indicatorColor: Colors.amberAccent,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 6,
                  tabs: const <Widget>[
                    Tab(
                      child: Text('Todas as edições'),
                    ),
                    Tab(
                      child: Text('Meus downloads'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Text("It's cloudy here"),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
          ],
        ),
      ),
    );
  }
}
