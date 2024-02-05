import 'package:movie_app_with_clean/core/exceptions/base_exceptions.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/trailer_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/repository/movie_repository.dart';

final class TrailerUseCase {
  final MovieApiRepository repository;
  TrailerUseCase({required this.repository});

  Future<List<TrailerEntity>> call(String id) async {
    try {
      return repository.getTrailer(id);
      
    } catch (e) {
      throw BaseExceptions(e.toString());
    }
  }
}
