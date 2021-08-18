// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_movie.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateMovie on _CreateMovie, Store {
  final _$movieValueAtom = Atom(name: '_CreateMovie.movieValue');

  @override
  Movie? get movieValue {
    _$movieValueAtom.reportRead();
    return super.movieValue;
  }

  @override
  set movieValue(Movie? value) {
    _$movieValueAtom.reportWrite(value, super.movieValue, () {
      super.movieValue = value;
    });
  }

  final _$_CreateMovieActionController = ActionController(name: '_CreateMovie');

  @override
  void title(String value) {
    final _$actionInfo =
        _$_CreateMovieActionController.startAction(name: '_CreateMovie.title');
    try {
      return super.title(value);
    } finally {
      _$_CreateMovieActionController.endAction(_$actionInfo);
    }
  }

  @override
  void director(String value) {
    final _$actionInfo = _$_CreateMovieActionController.startAction(
        name: '_CreateMovie.director');
    try {
      return super.director(value);
    } finally {
      _$_CreateMovieActionController.endAction(_$actionInfo);
    }
  }

  @override
  void tag(Tag value) {
    final _$actionInfo =
        _$_CreateMovieActionController.startAction(name: '_CreateMovie.tag');
    try {
      return super.tag(value);
    } finally {
      _$_CreateMovieActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMovie() {
    final _$actionInfo = _$_CreateMovieActionController.startAction(
        name: '_CreateMovie.setMovie');
    try {
      return super.setMovie();
    } finally {
      _$_CreateMovieActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movieValue: ${movieValue}
    ''';
  }
}
