import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/genre_model.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/movie_model.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/trailer_model.dart';

abstract class ApiServicesDataSource {
  Future<MovieModel> fetchMovies();
  Future<MovieModel> getNowPlaying();
  Future<MovieModel> actionApiMovies();
  Future<MovieModel> getTrendingMovies();
  Future<Genre> genreApi();
  Future<MovieModel> searchMovie(String movieName);
  Future<MovieModel> getTv();
  Future<TrailerModel> getTrailer(String movieId);
}
