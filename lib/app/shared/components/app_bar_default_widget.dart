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
    return appbarDefault();
  }

  Widget appbarDefault() {
    return AppBar(
      backgroundColor: AppColors.appBar,
      title: FlutterLogo(size: 40),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            size: 40,
            color: AppColors.textColorBlack,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.perm_identity,
            size: 40,
            color: AppColors.textColorBlack,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  // TODO: implement child
  Widget get child => appbarDefault();
}
