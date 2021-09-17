import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/components/app_bar/search/search_button.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'configuration/widgets/configuration_button.dart';
import 'menu/widgets/menu_button.dart';

class AppBarDefaultWidget extends StatelessWidget implements PreferredSize {
  AppBarDefaultWidget({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.appBar,
      elevation: 0,
      title: TextButton(
        onPressed: () {},
        child: Visibility(
          visible: MediaQuery.of(context).orientation == Orientation.portrait,
          child: Container(
            padding: EdgeInsets.zero,
            child:
                Image.asset('assets/images/piaui_logo.png', fit: BoxFit.fill),
            height: MediaQuery.of(context).size.height / 20,
            width: MediaQuery.of(context).size.width / 6,
          ),
          replacement: Container(
            child:
                Image.asset('assets/images/piaui_logo.png', fit: BoxFit.fill),
            height: MediaQuery.of(context).size.height / 12,
            width: MediaQuery.of(context).size.width / 10,
          ),
        ),
      ),
      actions: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3),
        ),
        ConfigButton(),
        IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            child:
                Image.asset('assets/images/icon_lupa.png', fit: BoxFit.contain),
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height / 25
                : MediaQuery.of(context).size.height / 14,
          ),
          alignment: Alignment.centerRight,
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => SearchButton(),
            );
          },
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3),
        ),
        MenuButton(),
        Container(
          // color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 7),
        ),
      ],
    );
  }

  @override
  Widget get child => AppBarDefaultWidget();
}
