import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';

abstract class ObjectBoxRepository {
  void addAllMovies(List<MovieEntity> movies);
  void clearAllMovies();
  List<MovieEntity> getAllMovies();

  void addTopRatedMovies(List<MovieEntity> movies);
  void clearTopRatedMovies();
  List<MovieEntity> getTopRatedMovies();

   void addActionMovies(List<MovieEntity> movies);
  void clearActionMovies();
  List<MovieEntity> getActionMovies();

   void addPopularMovies(List<MovieEntity> movies);
  void clearPopularMovies();
  List<MovieEntity> getPopularMovies();
}
