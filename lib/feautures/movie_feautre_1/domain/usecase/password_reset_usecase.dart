import 'package:movie_app_with_clean/core/exceptions/auth/sighnin_exceptions.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/repository/auth_repository.dart';

final class PasswordResetUseCase {
  final AuthenticationRepository repository;

  PasswordResetUseCase({required this.repository});

  Future<void> call(String email) async {
    try {
      await repository.resetPassword(email);
    } on Exception catch (e) {
      throw SighnInExceptions(e.toString(), e.toString());
    }
  }
}
