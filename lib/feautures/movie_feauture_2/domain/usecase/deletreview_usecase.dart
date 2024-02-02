import 'package:movie_app_with_clean/core/exceptions/base_exceptions.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/repository/firestore_repository.dart';

final class DeleteReviewUseCase {
  final FireStoreRepository repository;
  DeleteReviewUseCase({required this.repository});

  Future<void> call( String id) {
    try {
      return repository.deletReview(id);
    } catch (e) {
      throw BaseExceptions(e.toString());
    }
  }
}
