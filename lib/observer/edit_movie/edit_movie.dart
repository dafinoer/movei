


import 'package:mobx/mobx.dart';
import 'package:movei/model/movie.dart';
import 'package:movei/observer/create_movie/create_movie.dart';
import 'package:movei/repository/movie_repository.dart';

part 'edit_movie.g.dart';

class EditMovie extends _EditMovie with _$EditMovie {
  EditMovie(MovieRepository movieRepository) : super(movieRepository);

  static EditMovie create() => EditMovie(MovieRepository.create());
}

abstract class _EditMovie extends CreateMovie with Store {
  _EditMovie(MovieRepository movieRepository) : super(movieRepository);
  String? keyId;

  @observable
  bool? isUpdate;

  @action
  void updateUser() {
    movieValue = movieValue?.copyWith(
      title: getTitle,
      summary: getSummary,
      director: getDirector,
      tag: getTag
    );

    final id = keyId;
    final movie = movieValue;

    if(id != null && movie != null){
      movieRepository.update(movie);
      _setUpdateSuccess(true);
    } else {
      _setUpdateSuccess(false);
    }

  }

  @action
  void _setUpdateSuccess(bool statusUpdate) {
    isUpdate = statusUpdate;
  }

  @action
  void getMovieById(String key) {
    keyId = key;
    final result = movieRepository.getMovieById(key);
    if(result != null){
      movieValue = result;
    }
  }
}