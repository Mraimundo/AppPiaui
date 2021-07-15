import 'dart:ui';

import 'package:flutter/material.dart';

class AppGradients {
  static final linear = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(43, 43, 43, 1),
      Color.fromRGBO(17, 17, 17, 1),
    ],
  );
}
