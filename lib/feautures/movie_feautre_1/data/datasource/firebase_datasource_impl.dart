import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/data/datasource/firbase_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_datasource_impl.g.dart';

class FireBaseAuthImpl implements FireBaseAuthMethods {
  final FirebaseAuth _auth;
  FireBaseAuthImpl(this._auth);

  @override
  Future<void> sighnUpEmail(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> sighnInEmail(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> verifyEmail() async {
    await _auth.currentUser?.sendEmailVerification();
  }

  @override
  Future<void> sighnOut() async {
    await GoogleSignIn().signOut();
    return _auth.signOut();
  }

  @override
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<void> forgetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}

@riverpod
FireBaseAuthMethods fireBaseAuthMethods(FireBaseAuthMethodsRef ref) {
  return FireBaseAuthImpl(FirebaseAuth.instance);
}
