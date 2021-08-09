import 'package:flutter/material.dart';

class TabBar extends StatefulWidget {
  const TabBar({Key key}) : super(key: key);

  @override
  _TabBarState createState() => _TabBarState();
}

class _TabBarState extends State<TabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(100.0),
              child: TabBar(
                  // tabs: <Widget>[
                  //   Tab(icon: Icon(Icons.cake)),
                  //   Tab(icon: Icon(Icons.android)),
                  //   Tab(icon: Icon(Icons.phone_android)),
                  // ],
                  ),
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              Center(
                  child: Text(
                "0",
                style: TextStyle(fontSize: 40),
              )),
              Center(
                  child: Text(
                "1",
                style: TextStyle(fontSize: 40),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
