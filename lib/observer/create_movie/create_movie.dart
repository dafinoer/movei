import 'package:mobx/mobx.dart';
import 'package:movei/model/movie.dart';
import 'package:movei/repository/movie_repository.dart';
import 'package:movei/utils/unique_id.dart';

part 'create_movie.g.dart';

class CreateMovie extends _CreateMovie with _$CreateMovie{
  CreateMovie(MovieRepository movieRepository) : super(movieRepository);
  static CreateMovie create() => CreateMovie(MovieRepository.create());
}

abstract class _CreateMovie with Store {
  final _uuid = UniqueId();
  final MovieRepository movieRepository;
  _CreateMovie(this.movieRepository);

  @observable
  Movie? movieValue;

  String? _title;
  String? _director;
  String? _summary;
  Tag? _tag;

  String? get getTitle => _title;

  String? get getDirector => _director;

  String? get getSummary => _summary;

  Tag? get getTag => _tag;

  @action
  void title(String value) {
    _title = value;
  }

  @action
  void director(String value) {
    _director = value;
  }

  @action
  void tag(Tag value) {
    _tag = value;
  }

  void summary(String summary) {
    this._summary = summary;
  }

  @action
  void setMovie() {
    final id = _uuid.generatedUniqueIdTimeBased();
    final title = _title;
    final director = _director;
    final summary = _summary;
    final tag = _tag;

    if (title != null && director != null && tag != null) {
      movieValue = Movie(
        id: id,
        title: title,
        director: director,
        tag: tag,
        summary: summary,
      );
      movieRepository.add(movieValue!);
    }
  }
}
