import 'package:movie_app_with_clean/core/exceptions/base_exceptions.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/repository/movie_repository.dart';

final class SearchMovieUseCase {
  final MovieApiRepository repository;
  SearchMovieUseCase({required this.repository});

  Future<List<MovieEntity>> call(String movieName) async {
    try {
      return repository.searchMovie(movieName);
    } catch (e) {
      throw BaseExceptions(e.toString());
    }
  }
}
