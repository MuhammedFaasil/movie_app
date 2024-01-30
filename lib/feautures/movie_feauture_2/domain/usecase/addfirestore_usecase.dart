import 'package:movie_app_with_clean/core/exceptions/base_exceptions.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/repository/firestore_repository.dart';

final class FireStoreUseCase {
  final FireStoreRepository repository;
  FireStoreUseCase({required this.repository});

  Future<void> call(MovieEntity entity) {
    try {
      return repository.addToFIreStore(entity);
    } catch (e) {
      throw BaseExceptions(e.toString());
    }
  }
}
