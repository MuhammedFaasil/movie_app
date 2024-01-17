import 'package:movie_app_with_clean/core/exceptions/auth/sighnup_exceptions.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/repository/auth_repository.dart';

final class EmailVerificationUseCase {
  final AuthenticationRepository repository;
  EmailVerificationUseCase({required this.repository});
  Future<void> call() async {
    try {
      await repository.verifyEmail();
    } on Exception {
      throw SighnUpExceptions('cannot login', 'Try again');
    }
  }
}
