// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inside_magazine_logged_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InsideMagazineLoggeController on _InsideMagazineControllerBase, Store {
  final _$isLoadingAtom = Atom(name: '_InsideMagazineControllerBase.isLoading');

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

  final _$_editionsSiglePageAtom =
      Atom(name: '_InsideMagazineControllerBase._editionsSiglePage');

  @override
  List<InsideMagazineLoggedModel> get _editionsSiglePage {
    _$_editionsSiglePageAtom.reportRead();
    return super._editionsSiglePage;
  }

  @override
  set _editionsSiglePage(List<InsideMagazineLoggedModel> value) {
    _$_editionsSiglePageAtom.reportWrite(value, super._editionsSiglePage, () {
      super._editionsSiglePage = value;
    });
  }

  final _$itemCountAtom = Atom(name: '_InsideMagazineControllerBase.itemCount');

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

  final _$_pageCountAtom =
      Atom(name: '_InsideMagazineControllerBase._pageCount');

  @override
  int get _pageCount {
    _$_pageCountAtom.reportRead();
    return super._pageCount;
  }

  @override
  set _pageCount(int value) {
    _$_pageCountAtom.reportWrite(value, super._pageCount, () {
      super._pageCount = value;
    });
  }

  final _$nextPageAsyncAction =
      AsyncAction('_InsideMagazineControllerBase.nextPage');

  @override
  Future nextPage() {
    return _$nextPageAsyncAction.run(() => super.nextPage());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
itemCount: ${itemCount}
    ''';
  }
}
