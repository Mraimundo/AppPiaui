import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/components/app_bar/app_bar_default_widget.dart';

class PreferredAppBarWidget extends StatelessWidget implements PreferredSize {
  final double height;

  PreferredAppBarWidget({Key key, this.height})
      : preferredSize = Size.fromHeight(height),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return preferredDefault(context);
  }

  Widget preferredDefault(BuildContext context) {
    return PreferredSize(
      child: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBarDefaultWidget(),
            ],
          ),
        ),
        //  TabBarWidget()
      ),
      preferredSize: Size.fromHeight(this.height),
    );
  }

  @override
  // TODO: implement child
  Widget get child => PreferredAppBarWidget();
}
