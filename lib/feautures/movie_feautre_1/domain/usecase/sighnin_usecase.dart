import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app_with_clean/core/exceptions/auth/sighnin_exceptions.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/repository/auth_repository.dart';

final class SighnInUseCase {
  final AuthenticationRepository repository;
  SighnInUseCase({required this.repository});

  Future<UserCredential> call(String email, String password) async {
    try {
      return await repository.sighnInWithEmail(email, password);
    } on FirebaseAuthException catch (e) {
      throw SighnInExceptions(
          e.message ?? 'sighnin failed please try again', e.code);
    }
  }
}
