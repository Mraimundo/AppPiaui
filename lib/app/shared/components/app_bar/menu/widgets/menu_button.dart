import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:piaui_app/app/app_controller.dart';

Future<String> readUser() async {
  return await FlutterSession().get("user");
}

class MenuButton extends StatefulWidget {
  final bool close;

  MenuButton({Key key, this.close}) : super(key: key);

  @override
  _MenuButtonState createState() => _MenuButtonState(close);
}

class _MenuButtonState extends ModularState<MenuButton, AppController> {
  final bool close;

  _MenuButtonState(this.close);

  @override
  Widget build(BuildContext context) {
    print(close);
    return FutureBuilder<String>(
        future: readUser(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return IconButton(
              padding: EdgeInsets.zero,
              icon: Container(
                padding: EdgeInsets.all(4),
                child: close
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
                snapshot.data == ""
                    ? !close
                        ? Modular.to.pushNamed('/menu')
                        : Navigator.pop(context)
                    : !close
                        ? Modular.to.pushNamed('/menu_logged')
                        : Navigator.pop(context);
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
