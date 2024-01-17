import 'package:movie_app_with_clean/core/exceptions/auth/invalid_credential.dart';
import 'package:movie_app_with_clean/core/exceptions/auth/sighnup_exceptions.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/repository/auth_repository.dart';

final class SignUpUseCase {
  final AuthenticationRepository repository;
  SignUpUseCase({required this.repository});
  Future<void> call(String email, String password) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      throw InvalidCredentialException();
    }
    try {
      await repository.sighnUpWithEmail(email, password);
    } on Exception {
      throw SighnUpExceptions(
          "cannot signup",'try again');
    }
  }
}
