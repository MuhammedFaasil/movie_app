import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/genre_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
part 'movie_state.freezed.dart';

@freezed
class MovieState with _$MovieState {
  factory MovieState(
      {required List<MovieEntity> movies,
      required List<MovieEntity> nowPlaying,
      required List<GenreEntity> genre,
      required List<MovieEntity> popular,
      required List<MovieEntity> actionMovies}) = _MovieState;
}
