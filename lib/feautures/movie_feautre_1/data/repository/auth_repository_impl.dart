import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/data/datasource/firbase_datasource.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/data/datasource/firebase_datasource_impl.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_repository_impl.g.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FireBaseAuthMethods dataSource;
  AuthenticationRepositoryImpl({required this.dataSource});
  @override
  Future<void> sighnInWithEmail(String email, String password) {
    return dataSource.sighnInEmail(email, password);
  }

  @override
  Future<void> sighnOut() {
    return dataSource.sighnOut();
  }

  @override
  Future<void> sighnUpWithEmail(String email, String password) async{
     await dataSource.sighnUpEmail(email, password);
  }

  @override
  Future<void> verifyEmail() async {
    await dataSource.verifyEmail();
  }

  @override
  Future<void> signWithGoogle() async {
    await dataSource.signInWithGoogle();
  }

  @override
  Future<void> resetPassword(String email) async {
    await dataSource.forgetPassword(email);
  }
}

@riverpod
AuthenticationRepository authRepository(AuthRepositoryRef ref) {
  return AuthenticationRepositoryImpl(
      dataSource: ref.watch(fireBaseAuthMethodsProvider));
}
