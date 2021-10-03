import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/app_controller.dart';

class ConfigButton extends StatefulWidget {
  final bool closeCongif;

  ConfigButton({Key key, this.closeCongif}) : super(key: key);

  @override
  _ConfigButtonState createState() => _ConfigButtonState(closeCongif);
}

class _ConfigButtonState extends ModularState<ConfigButton, AppController> {
  final bool closeCongif;

  _ConfigButtonState(this.closeCongif);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: Container(
        padding: EdgeInsets.all(4),
        child: closeCongif
            ? Image.asset('assets/images/Close.png', fit: BoxFit.contain)
            : Image.asset('assets/images/Conf.png', fit: BoxFit.contain),
        height: MediaQuery.of(context).orientation == Orientation.portrait
            ? MediaQuery.of(context).size.height / 25
            : MediaQuery.of(context).size.height / 14,
      ),
      alignment: Alignment.centerRight,
      onPressed: () {
        controller.checked();
        print('Menu pressed ? ${controller.checkedPressed}');
        !closeCongif ? Modular.to.pushNamed('/config') : Navigator.pop(context);
      },
    );
  }
}
