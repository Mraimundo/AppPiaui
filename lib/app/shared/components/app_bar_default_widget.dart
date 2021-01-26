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
    double iconSize = 60;
    return AppBar(
      backgroundColor: AppColors.appBar,
      elevation: 0,
      title: Container(
        child: Image.asset('assets/images/piaui_logo.jpg', fit: BoxFit.fill),
        color: Colors.white,
        height: MediaQuery.of(context).size.height/15,
        width: MediaQuery.of(context).size.width / 5,
      ),
      actions: <Widget>[
        IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          icon: Image.asset('assets/images/icon_lupa.png'),
          iconSize: iconSize,
          alignment: Alignment.centerRight,
          onPressed: () {},
        ),
        IconButton(
          padding: EdgeInsets.fromLTRB(0, 4, 8, 4),
          constraints: BoxConstraints(),
          icon: Image.asset('assets/images/icon_profile.png'),
          iconSize: iconSize,
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  // TODO: implement child
  Widget get child => AppBarDefaultWidget();
}
