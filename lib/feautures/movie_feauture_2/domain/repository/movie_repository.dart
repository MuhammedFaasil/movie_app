import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';

abstract class MovieApiRepository {
  Future<List<MovieEntity>> fetchMovies();
  Future<List<MovieEntity>> getNowPlaying();
}
