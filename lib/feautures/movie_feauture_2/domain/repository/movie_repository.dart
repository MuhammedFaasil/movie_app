import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/genre_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';

abstract class MovieApiRepository {
  Future<List<MovieEntity>> fetchMovies();
  Future<List<MovieEntity>> getNowPlaying();
  Future<List<MovieEntity>> actionMovies();
  Future<List<GenreEntity>> genreApi();
  Future<List<MovieEntity>> getPopularMovie();
  Future<List<MovieEntity>> searchMovie(String movieName);
}
