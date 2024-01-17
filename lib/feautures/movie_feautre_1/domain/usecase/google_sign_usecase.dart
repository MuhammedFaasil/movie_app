import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app_with_clean/core/exceptions/auth/sighnup_exceptions.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/repository/auth_repository.dart';

final class GoogleSignUseCase {
  final AuthenticationRepository repository;

  GoogleSignUseCase({required this.repository});
  Future<void> call() async {
    try {
      await repository.signWithGoogle();
    } on FirebaseAuthException catch (e) {
      throw SighnUpExceptions('${e.message}', 'try again');
    }
  }
}
