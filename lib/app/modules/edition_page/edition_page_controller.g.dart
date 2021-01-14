// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edition_page_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $EditionPageController = BindInject(
  (i) => EditionPageController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditionPageController on _EditionPageControllerBase, Store {
  final _$valueAtom = Atom(name: '_EditionPageControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_EditionPageControllerBaseActionController =
      ActionController(name: '_EditionPageControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_EditionPageControllerBaseActionController
        .startAction(name: '_EditionPageControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_EditionPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
