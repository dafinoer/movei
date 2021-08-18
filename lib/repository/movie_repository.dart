import 'package:movei/model/movie.dart';
import 'package:movei/repository/cache/movie_memory.dart';

class MovieRepository {
  final MovieMemory _movieMemory;
  MovieRepository._(this._movieMemory);

  factory MovieRepository.create() {
    final memory = MovieMemory.create();
    return MovieRepository._(memory);
  }

  Stream<List<Movie>> watchItem() => _movieMemory.watch;

  Movie? getMovieById(String key){
    final item = _movieMemory.getMemoryValue[key];
    return item;
  }

  void add(Movie movie) {
    _movieMemory.addMovieToMemory(movie);
  }

  void update(Movie movie){
    _movieMemory.updateMovieFromMemory(movie);
  }

  void delete(Movie movie) {
    _movieMemory.deleteMoviewFromMemory(movie.id);
  }

  void clearMemory() => _movieMemory.clearAll();
}