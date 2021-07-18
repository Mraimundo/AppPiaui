// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edition_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DownLoadEditionPageController
    on _DownLoadEditionPageControllerBase, Store {
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

  final _$_editionsSiglePageAtom =
      Atom(name: '_EditionPageControllerBase._editionsSiglePage');

  @override
  List<EditionModel> get _editionsSiglePage {
    _$_editionsSiglePageAtom.reportRead();
    return super._editionsSiglePage;
  }

  @override
  set _editionsSiglePage(List<EditionModel> value) {
    _$_editionsSiglePageAtom.reportWrite(value, super._editionsSiglePage, () {
      super._editionsSiglePage = value;
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

  final _$_pageCountAtom = Atom(name: '_EditionPageControllerBase._pageCount');

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
      AsyncAction('_EditionPageControllerBase.nextPage');

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
