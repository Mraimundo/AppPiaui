import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/app_controller.dart';

class ConfigButton extends StatefulWidget {
  @override
  _ConfigButtonState createState() => _ConfigButtonState();
}

class _ConfigButtonState extends ModularState<ConfigButton, AppController> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: Container(
        padding: EdgeInsets.all(4),
        child: controller.checkedPressed
            ? Image.asset('assets/images/icon_x.png', fit: BoxFit.contain)
            : Image.asset('assets/images/icon_configuration.png',
                fit: BoxFit.contain),
        //color: Colors.black,
        height: MediaQuery.of(context).orientation == Orientation.portrait
            ? MediaQuery.of(context).size.height / 25
            : MediaQuery.of(context).size.height / 14,
      ),
      alignment: Alignment.centerRight,
      onPressed: () {
        controller.checked();
        print('Menu pressed ? ${controller.checkedPressed}');
        controller.checkedPressed
            ? Modular.to.pushNamed('/config')
            : Modular.to.pushNamed('/editions');
      },
    );
  }
}
