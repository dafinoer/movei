


import 'dart:async';
import 'dart:collection';

import 'package:movei/model/movie.dart';

class MovieMemory {
  final _controller = StreamController<List<Movie>>.broadcast();
  final _movieMemory = <String, Movie>{};
  static MovieMemory? _movieMemoryInstance;

  MovieMemory._();

  factory MovieMemory.create() {
    if(_movieMemoryInstance != null){
      return _movieMemoryInstance!;
    } else {
      final movieMemory = MovieMemory._();
      _movieMemoryInstance = movieMemory;
      return movieMemory;
    }
  }

  Stream<List<Movie>> get watch => _controller.stream;

  Map<String, Movie> get getMemoryValue => _movieMemory;

  void addMovieToMemory(Movie movie) {
    _movieMemory.putIfAbsent(movie.id, () => movie);
    _sendEventToStream(UnmodifiableListView(_movieMemory.values));
  }

  void updateMovieFromMemory(Movie movie) {
    _movieMemory.update(movie.id, (value) => movie);
    _sendEventToStream(UnmodifiableListView(_movieMemory.values));
  }

  void deleteMoviewFromMemory(String keyId) {
    _movieMemory.remove(keyId);
    _sendEventToStream(UnmodifiableListView(_movieMemory.values));
  }

  void _sendEventToStream(List<Movie> movies){
    _controller.add(UnmodifiableListView(_movieMemory.values));
  }

  void clearAll() {
    _movieMemory.clear();
    _controller.add(UnmodifiableListView(_movieMemory.values));
  }

  void dispose() {
    _movieMemory.clear();
    _controller.close();
  }
}