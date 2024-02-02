import 'package:movie_app_with_clean/core/exceptions/base_exceptions.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/repository/firestore_repository.dart';

final class GetFromFireStoreUseCase {
  final FireStoreRepository repository;
  GetFromFireStoreUseCase({required this.repository});

  Stream<List<MovieEntity>> call() {
    try {
      return repository.fromFireStore();
    } catch (e) {
      throw BaseExceptions('cannot add');
    }
  }
}
