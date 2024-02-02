import 'package:freezed_annotation/freezed_annotation.dart';
part 'movie_api_entity.freezed.dart';

@freezed
class MovieEntity with _$MovieEntity {
  factory MovieEntity({
    required int id,
    required String backdropPath,
    required String originalLanguage,
    required String originalTitle,
    required String overview,
    required String posterPath,
    required String title,
    required bool video,
    // required DateTime releaseDate,
    required double voteAverage,
    required int? voteCount,
    required double popularity,
  }) = _MovieEntity;
}
