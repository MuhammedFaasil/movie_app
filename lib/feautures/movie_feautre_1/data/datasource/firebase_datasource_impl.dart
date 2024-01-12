import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/data/datasource/firbase_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_datasource_impl.g.dart';

class FireBaseAuthImpl implements FireBaseAuthMethods {
  final FirebaseAuth _auth;
  FireBaseAuthImpl(this._auth);
  @override
  @override
  Future<UserCredential> sighnUpEmail(String email, String password) {
    return _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<UserCredential> sighnInEmail(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> sighnOut() {
    return _auth.signOut();
  }
}

@riverpod
FireBaseAuthMethods fireBaseAuthMethods(FireBaseAuthMethodsRef ref) {
  return FireBaseAuthImpl(FirebaseAuth.instance);
}
