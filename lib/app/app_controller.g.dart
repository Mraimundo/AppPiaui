// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  Computed<bool> _$menuStatusComputed;

  @override
  bool get menuStatus =>
      (_$menuStatusComputed ??= Computed<bool>(() => super.menuStatus,
              name: '_AppControllerBase.menuStatus'))
          .value;

  final _$menuPressedAtom = Atom(name: '_AppControllerBase.menuPressed');

  @override
  bool get menuPressed {
    _$menuPressedAtom.reportRead();
    return super.menuPressed;
  }

  @override
  set menuPressed(bool value) {
    _$menuPressedAtom.reportWrite(value, super.menuPressed, () {
      super.menuPressed = value;
    });
  }

  final _$_AppControllerBaseActionController =
      ActionController(name: '_AppControllerBase');

  @override
  dynamic menu() {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.menu');
    try {
      return super.menu();
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
menuPressed: ${menuPressed},
menuStatus: ${menuStatus}
    ''';
  }
}
