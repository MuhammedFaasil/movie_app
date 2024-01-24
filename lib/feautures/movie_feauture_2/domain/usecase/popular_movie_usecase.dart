import 'package:movie_app_with_clean/core/exceptions/base_exceptions.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/repository/popular_movie_repository.dart';

final class PopularMovieUseCase {
  final PopularApiRepository repository;
  PopularMovieUseCase({required this.repository});

  Future<List<MovieEntity>> call() async {
    try {
      return repository.getPopularMovie();
    } catch (e) {
      throw BaseExceptions(e.toString());
    }
  }
}
