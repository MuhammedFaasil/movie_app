import 'package:freezed_annotation/freezed_annotation.dart';

part 'popular_movieapi_entity.freezed.dart';
@freezed
class PopularEntity with _$PopularEntity {
  factory PopularEntity({
    required String backdropPath,
    required String originalLanguage,
    required String originalTitle,
    required String overview,
    required String posterPath,
    required String title,
    required bool video,
    required double voteAverage,
    required int voteCount,
    required double popularity,
  }) = _PopularEntity;
}
