import 'package:firebase_auth/firebase_auth.dart';

abstract class FireBaseAuthMethods {
  Future<UserCredential> sighnUpEmail(
    String email,
    String password,
  );
  Future<UserCredential> sighnInEmail(
    String email,
    String password,
  );
  Future<void> sighnOut();
}
