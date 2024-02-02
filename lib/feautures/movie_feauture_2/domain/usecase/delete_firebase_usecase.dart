import 'package:movie_app_with_clean/core/exceptions/base_exceptions.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/repository/firestore_repository.dart';

final class DeleteFromFirebaseUseCase {
  final FireStoreRepository repository;
  DeleteFromFirebaseUseCase({required this.repository});
  Future<void> call(String id)  {
    try {
      return repository.deleteFromFireStore(id);
    } catch (e) {
      throw BaseExceptions(e.toString());
    }
  }
}
