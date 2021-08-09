// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  Computed<bool> _$checkedStatusComputed;

  @override
  bool get checkedStatus =>
      (_$checkedStatusComputed ??= Computed<bool>(() => super.checkedStatus,
              name: '_AppControllerBase.checkedStatus'))
          .value;

  final _$checkedPressedAtom = Atom(name: '_AppControllerBase.checkedPressed');

  @override
  bool get checkedPressed {
    _$checkedPressedAtom.reportRead();
    return super.checkedPressed;
  }

  @override
  set checkedPressed(bool value) {
    _$checkedPressedAtom.reportWrite(value, super.checkedPressed, () {
      super.checkedPressed = value;
    });
  }

  final _$_AppControllerBaseActionController =
      ActionController(name: '_AppControllerBase');

  @override
  dynamic checked() {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.checked');
    try {
      return super.checked();
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
checkedPressed: ${checkedPressed},
checkedStatus: ${checkedStatus}
    ''';
  }
}
