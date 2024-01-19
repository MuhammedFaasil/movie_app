
import 'package:movie_app_with_clean/core/exceptions/auth/sighnin_exceptions.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/repository/auth_repository.dart';

final class SighnInUseCase {
  final AuthenticationRepository repository;
  SighnInUseCase({required this.repository});

  Future<void> call(String email, String password) async {
    try {
      await repository.sighnInWithEmail(email, password);
    } on Exception {
      throw SighnInExceptions('cannot login', 'try again');
    }
  }
}
