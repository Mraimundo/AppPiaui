// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inside_magazine_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InsideMagazineController on _InsideMagazineControllerBase, Store {
  final _$subjectsFutureAtom =
      Atom(name: '_InsideMagazineControllerBase.subjectsFuture');

  @override
  ObservableFuture<List<SubjectModel>> get subjectsFuture {
    _$subjectsFutureAtom.reportRead();
    return super.subjectsFuture;
  }

  @override
  set subjectsFuture(ObservableFuture<List<SubjectModel>> value) {
    _$subjectsFutureAtom.reportWrite(value, super.subjectsFuture, () {
      super.subjectsFuture = value;
    });
  }

  final _$_InsideMagazineControllerBaseActionController =
      ActionController(name: '_InsideMagazineControllerBase');

  @override
  void findAll() {
    final _$actionInfo = _$_InsideMagazineControllerBaseActionController
        .startAction(name: '_InsideMagazineControllerBase.findAll');
    try {
      return super.findAll();
    } finally {
      _$_InsideMagazineControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
subjectsFuture: ${subjectsFuture}
    ''';
  }
}
