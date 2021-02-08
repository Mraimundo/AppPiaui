import 'package:flutter/material.dart';

Widget imageDevicesWidget(double width) {
  return Row(
    children: [
      Container(
        height: 220,
        width: width,
        color: Colors.red,
        child: Image.asset(
          'assets/images/piaui_devices.png',
          fit: BoxFit.fitHeight,
        ),
      ),
    ],
  );
}
