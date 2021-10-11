import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class AppBarDefaultWidget extends StatelessWidget implements PreferredSize {
  final bool close;
  final bool closeCongif;

  AppBarDefaultWidget({Key key, this.close, this.closeCongif})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).backgroundColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {},
            child: Visibility(
              visible:
                  MediaQuery.of(context).orientation == Orientation.portrait,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  padding: EdgeInsets.zero,
                  child: Image.asset('assets/images/piaui_logo.png',
                      fit: BoxFit.fill),
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 6,
                ),
              ),
              replacement: Container(
                child: Image.asset('assets/images/piaui_logo.png',
                    fit: BoxFit.fill),
                height: MediaQuery.of(context).size.height / 12,
                width: MediaQuery.of(context).size.width / 10,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
    );
  }

  @override
  Widget get child => AppBarDefaultWidget();
}
