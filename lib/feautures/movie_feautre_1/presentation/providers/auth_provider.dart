import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/data/repository/auth_repository_impl.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/repository/auth_repository.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/usecase/sighnin_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/usecase/sighnout_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/usecase/sighnup_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  late final TextEditingController nameControler;
  late final TextEditingController mobileControler;
  late final TextEditingController emailControler;
  late final TextEditingController passwordControler;
  late final AuthenticationRepository repository;
  @override
  void build() {
    nameControler = TextEditingController();
    mobileControler = TextEditingController();
    emailControler = TextEditingController();
    passwordControler = TextEditingController();

    repository = ref.read(authRepositoryProvider);

    ref.onDispose(dispose);
  }

  void dispose() {
    nameControler.dispose();
    emailControler.dispose();
    mobileControler.dispose();
    passwordControler.dispose();
  }

  void clear() {
    nameControler.clear();
    mobileControler.clear();
    emailControler.clear();
    passwordControler.clear();
  }

  Future<UserCredential> sighnUpWithEmail(String email, String password) async {
    return SignUpUseCase(repository: repository)(email, password);
  }

  Future<UserCredential> sighnOutWithEmail(
      String email, String password) async {
    return SighnInUseCase(repository: repository)(email, password);
  }

  Future<void> sighnOut() {
    return SighnOutUseCase(repository: repository)();
  }
}
