import 'package:movie_app_with_clean/core/exceptions/base_exceptions.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/review_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/repository/firestore_repository.dart';

final class ReviewUseCase {
  final FireStoreRepository repository;
  ReviewUseCase({required this.repository});

  Future<void> call(ReviewEntity entity,String id) {
    try {
      return repository.addReview(entity);
    } catch (e) {
      throw BaseExceptions(e.toString());
    }
  }
}
