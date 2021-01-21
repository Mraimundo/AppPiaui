// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edition_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditionPageController on _EditionPageControllerBase, Store {
  final _$editionsAtom = Atom(name: '_EditionPageControllerBase.editions');

  @override
  ObservableFuture<dynamic> get editions {
    _$editionsAtom.reportRead();
    return super.editions;
  }

  @override
  set editions(ObservableFuture<dynamic> value) {
    _$editionsAtom.reportWrite(value, super.editions, () {
      super.editions = value;
    });
  }

  @override
  String toString() {
    return '''
editions: ${editions}
    ''';
  }
}
