// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_movie.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditMovie on _EditMovie, Store {
  final _$isUpdateAtom = Atom(name: '_EditMovie.isUpdate');

  @override
  bool? get isUpdate {
    _$isUpdateAtom.reportRead();
    return super.isUpdate;
  }

  @override
  set isUpdate(bool? value) {
    _$isUpdateAtom.reportWrite(value, super.isUpdate, () {
      super.isUpdate = value;
    });
  }

  final _$_EditMovieActionController = ActionController(name: '_EditMovie');

  @override
  void updateUser() {
    final _$actionInfo =
        _$_EditMovieActionController.startAction(name: '_EditMovie.updateUser');
    try {
      return super.updateUser();
    } finally {
      _$_EditMovieActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setUpdateSuccess(bool statusUpdate) {
    final _$actionInfo = _$_EditMovieActionController.startAction(
        name: '_EditMovie._setUpdateSuccess');
    try {
      return super._setUpdateSuccess(statusUpdate);
    } finally {
      _$_EditMovieActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getMovieById(String key) {
    final _$actionInfo = _$_EditMovieActionController.startAction(
        name: '_EditMovie.getMovieById');
    try {
      return super.getMovieById(key);
    } finally {
      _$_EditMovieActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isUpdate: ${isUpdate}
    ''';
  }
}
