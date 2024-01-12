import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<UserCredential> sighnUpWithEmail(String email, String password);
  Future<UserCredential> sighnInWithEmail(String email, String password);
  Future<void> sighnOut();
}
