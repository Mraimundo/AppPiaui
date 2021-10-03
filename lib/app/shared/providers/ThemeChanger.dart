import 'package:flutter/widgets.dart';

class ThemeChanger extends ChangeNotifier {
  bool _darkStatus = false;

  isDark() => _darkStatus;

  setDarkStatus(bool status) {
    _darkStatus = status;

    notifyListeners();
  }
}
