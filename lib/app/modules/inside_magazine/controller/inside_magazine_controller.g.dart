// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inside_magazine_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InsideMagazineController on _InsideMagazineControllerBase, Store {
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
  List<materiaModel> get _editionsSiglePage {
    _$_editionsSiglePageAtom.reportRead();
    return super._editionsSiglePage;
  }

  @override
  set _editionsSiglePage(List<materiaModel> value) {
    _$_editionsSiglePageAtom.reportWrite(value, super._editionsSiglePage, () {
      super._editionsSiglePage = value;
    });
  }

  final _$loadPageAtom = Atom(name: '_InsideMagazineControllerBase.loadPage');

  @override
  bool get loadPage {
    _$loadPageAtom.reportRead();
    return super.loadPage;
  }

  @override
  set loadPage(bool value) {
    _$loadPageAtom.reportWrite(value, super.loadPage, () {
      super.loadPage = value;
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
loadPage: ${loadPage}
    ''';
  }
}
