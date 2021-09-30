// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inside_magazine_teste_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InsideMagazineTeste on _InsideMagazineTesteBase, Store {
  final _$subjectsFutureAtom =
      Atom(name: '_InsideMagazineTesteBase.subjectsFuture');

  @override
  ObservableFuture<List<Materias>> get subjectsFuture {
    _$subjectsFutureAtom.reportRead();
    return super.subjectsFuture;
  }

  @override
  set subjectsFuture(ObservableFuture<List<Materias>> value) {
    _$subjectsFutureAtom.reportWrite(value, super.subjectsFuture, () {
      super.subjectsFuture = value;
    });
  }

  final _$_InsideMagazineTesteBaseActionController =
      ActionController(name: '_InsideMagazineTesteBase');

  @override
  void findAll() {
    final _$actionInfo = _$_InsideMagazineTesteBaseActionController.startAction(
        name: '_InsideMagazineTesteBase.findAll');
    try {
      return super.findAll();
    } finally {
      _$_InsideMagazineTesteBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
subjectsFuture: ${subjectsFuture}
    ''';
  }
}
