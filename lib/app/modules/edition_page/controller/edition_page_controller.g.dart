// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edition_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditionPageController on _EditionPageControllerBase, Store {
  final _$isLoadingAtom = Atom(name: '_EditionPageControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$_editionsAtom = Atom(name: '_EditionPageControllerBase._editions');

  @override
  List<EditionModel> get _editions {
    _$_editionsAtom.reportRead();
    return super._editions;
  }

  @override
  set _editions(List<EditionModel> value) {
    _$_editionsAtom.reportWrite(value, super._editions, () {
      super._editions = value;
    });
  }

  final _$itemCountAtom = Atom(name: '_EditionPageControllerBase.itemCount');

  @override
  int get itemCount {
    _$itemCountAtom.reportRead();
    return super.itemCount;
  }

  @override
  set itemCount(int value) {
    _$itemCountAtom.reportWrite(value, super.itemCount, () {
      super.itemCount = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
itemCount: ${itemCount}
    ''';
  }
}
