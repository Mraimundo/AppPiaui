// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'magazine_articles_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MagazineArticlesController on _MagazineArticlesControllerBase, Store {
  final _$valueAtom = Atom(name: '_MagazineArticlesControllerBase.value');

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

  final _$_MagazineArticlesControllerBaseActionController =
      ActionController(name: '_MagazineArticlesControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_MagazineArticlesControllerBaseActionController
        .startAction(name: '_MagazineArticlesControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_MagazineArticlesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
