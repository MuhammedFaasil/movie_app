import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<void> sighnUpWithEmail(String email, String password);
  Future<void> sighnInWithEmail(String email, String password);
  Future<void> sighnOut();
  Future<void> verifyEmail();
  Future<void> signWithGoogle();
  Future<void> resetPassword(String email);
}
