import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class AppBarDefaultWidget extends StatelessWidget implements PreferredSize {
  AppBarDefaultWidget({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return appbarDefault(context);
  }

  Widget appbarDefault(BuildContext context) {
    double iconSize = 50;
    return AppBar(
      backgroundColor: AppColors.appBar,
      elevation: 0,
      title: FlatButton(
        padding: EdgeInsets.zero,
        onPressed: () {  },
        child: Container(
          child: Image.asset('assets/images/piaui_logo.png', fit: BoxFit.fill),
          color: Colors.white,
          height: MediaQuery.of(context).size.height / 14,
          width: MediaQuery.of(context).size.width / 5,
        ),
      ),
      actions: <Widget>[
        IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            child: Image.asset('assets/images/icon_lupa.png', fit: BoxFit.contain),
            //color: Colors.black,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          iconSize: iconSize,
          alignment: Alignment.centerRight,
          onPressed: () {},
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            padding: EdgeInsets.all(4),
            child: Image.asset('assets/images/icon_menu.png', fit: BoxFit.contain),
            //color: Colors.black,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          iconSize: iconSize,
          alignment: Alignment.centerRight,
          onPressed: () {},
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 7),
        ),
      ],
    );
  }

  @override
  // TODO: implement child
  Widget get child => AppBarDefaultWidget();
}
