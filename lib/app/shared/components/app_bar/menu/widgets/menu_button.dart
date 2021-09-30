import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:piaui_app/app/app_controller.dart';

Future<String> readUser() async {
  return await FlutterSession().get("user");
}

class MenuButton extends StatefulWidget {
  @override
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends ModularState<MenuButton, AppController> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: readUser(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return IconButton(
              padding: EdgeInsets.zero,
              icon: Container(
                padding: EdgeInsets.all(4),
                child: controller.checkedPressed
                    ? Image.asset('assets/images/icon_x.png',
                        fit: BoxFit.contain)
                    : Image.asset('assets/images/icon_menu.png',
                        fit: BoxFit.contain),
                //color: Colors.black,
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.height / 25
                        : MediaQuery.of(context).size.height / 14,
              ),
              alignment: Alignment.centerRight,
              onPressed: () {
                controller.checked();
                print('Menu pressed ? ${controller.checkedPressed}');

                snapshot.data == ""
                    ? controller.checkedPressed
                        ? Modular.to.pushNamed('/menu')
                        : Modular.to.pushNamed('/editions')
                    : controller.checkedPressed
                        ? Modular.to.pushNamed('/menu_logged')
                        : Modular.to.pushNamed('/logged');
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
