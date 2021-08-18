import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:movei/model/movie.dart';
import 'package:movei/repository/movie_repository.dart';

part 'movie_list.g.dart';

class MovieList extends _MovieList with _$MovieList {
  MovieList(MovieRepository movieRepository) : super(movieRepository);

  static MovieList create() =>
      MovieList(MovieRepository.create()).._onListenMemory();

  late StreamSubscription _streamSubscription;

  void _onListenMemory() {
    _streamSubscription = _movieRepository.watchItem().listen((event) {
      setMovieCollection(event);
    });
  }

  void close() {
    _streamSubscription.cancel();
  }
}

abstract class _MovieList with Store {
  final MovieRepository _movieRepository;
  _MovieList(this._movieRepository);

  @observable
  List<Movie> movies = <Movie>[];

  @action
  void setMovieCollection(List<Movie> listOfMovie) {
    movies = listOfMovie;
  }

  @action
  void onClearData() {
    _movieRepository.clearMemory();
  }

  @computed
  String get getMovies => 'print $movies';
}
