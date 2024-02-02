import 'package:movie_app_with_clean/core/exceptions/base_exceptions.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/review_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/repository/firestore_repository.dart';

final class GetReviewUseCase {
  final FireStoreRepository repository;
  GetReviewUseCase({required this.repository});

  Stream<List<ReviewEntity>> call(String id) {
    try {
      return repository.getReview(id);
    } catch (e) {
      throw BaseExceptions(e.toString());
    }
  }
}
