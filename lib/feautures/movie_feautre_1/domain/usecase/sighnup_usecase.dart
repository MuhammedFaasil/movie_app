import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app_with_clean/core/exceptions/auth/sighnup_exceptions.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/repository/auth_repository.dart';

final class SignUpUseCase {
  final AuthenticationRepository repository;
  SignUpUseCase({required this.repository});
  Future<UserCredential> call(String email, String password) async {
    try {
      return await repository.sighnUpWithEmail(email, password);
    } on FirebaseAuthException catch (e) {
      throw SighnUpExceptions(
          e.message ?? "sighn Up filed please try again", e.code);
    }
  }
}
