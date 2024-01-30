import 'package:movie_app_with_clean/core/exceptions/base_exceptions.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/genre_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/repository/movie_repository.dart';

final class GenreUseCase {
  final MovieApiRepository repository;
  GenreUseCase({required this.repository});

  Future<List<GenreEntity>> call() async {
    try {
      return repository.genreApi();
    } catch (e) {
      throw BaseExceptions(e.toString());
    }
  }
}
