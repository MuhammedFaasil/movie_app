import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/movie_model.dart';

abstract class ApiServicesDataSource {
  Future<MovieModel> fetchMovies();
  Future<MovieModel> getNowPlaying();
}
