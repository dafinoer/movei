import 'package:quiver/core.dart';

enum Tag {
  action,
  comedy,
  fantasy,
  horror,
  sci_fi,
}

class Movie {
  final String id;
  final String title;
  final String director;
  final String? summary;
  final Tag tag;

  const Movie({
    required this.id,
    required this.title,
    required this.director,
    required this.tag,
    this.summary,
  });

  @override
  bool operator ==(Object other) {
    bool isSameObject = false;

    if (other is Movie) {
      final isEnableId = id == other.id;
      final isTitle = title == other.title;
      final isDirector = director == other.director;
      final isSummary = summary == other.summary;
      final isTag = tag == other.tag;
      final sameRuntimeObject = runtimeType == other.runtimeType;
      isSameObject = sameRuntimeObject &&
          isEnableId &&
          isTitle &&
          isDirector &&
          isSummary &&
          isTag;
    }
    return identical(this, other) || isSameObject;
  }

  @override
  int get hashCode => hash4(id, title, director, tag);

  Movie copyWith({String? title, String? director, Tag? tag, String? summary}) {
    return Movie(
      id: id,
      title: title ?? this.title,
      director: director ?? this.director,
      tag: tag ?? this.tag,
      summary: summary ?? this.summary,
    );
  }
}
