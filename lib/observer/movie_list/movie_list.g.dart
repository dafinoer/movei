// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieList on _MovieList, Store {
  Computed<String>? _$getMoviesComputed;

  @override
  String get getMovies => (_$getMoviesComputed ??=
          Computed<String>(() => super.getMovies, name: '_MovieList.getMovies'))
      .value;

  final _$moviesAtom = Atom(name: '_MovieList.movies');

  @override
  List<Movie> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(List<Movie> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  final _$_MovieListActionController = ActionController(name: '_MovieList');

  @override
  void setMovieCollection(List<Movie> listOfMovie) {
    final _$actionInfo = _$_MovieListActionController.startAction(
        name: '_MovieList.setMovieCollection');
    try {
      return super.setMovieCollection(listOfMovie);
    } finally {
      _$_MovieListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onClearData() {
    final _$actionInfo = _$_MovieListActionController.startAction(
        name: '_MovieList.onClearData');
    try {
      return super.onClearData();
    } finally {
      _$_MovieListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movies: ${movies},
getMovies: ${getMovies}
    ''';
  }
}
