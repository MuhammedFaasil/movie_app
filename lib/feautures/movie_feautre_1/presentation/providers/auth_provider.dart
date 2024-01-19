import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_clean/core/exceptions/auth/sighnup_exceptions.dart';
import 'package:movie_app_with_clean/core/exceptions/base_exceptions.dart';
import 'package:movie_app_with_clean/core/utils/snackbar_utils.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/data/repository/auth_repository_impl.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/repository/auth_repository.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/usecase/google_sign_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/usecase/password_reset_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/usecase/sighnin_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/usecase/sighnout_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/usecase/sighnup_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/usecase/verify_email_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/pages/authentication/login_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/pages/home_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class Authentication extends _$Authentication {
  late final AuthenticationRepository repository;
  @override
  void build(BuildContext context) {
    repository = ref.read(authRepositoryProvider);

    // ref.onDispose(dispose);
  }

  Future<void> sighnUpWithEmail(String email, String password) async {
    try {
      await SignUpUseCase(repository: repository)(email, password);
      await verifyEmail();
      Future.sync(() => context.go(HomePage.routerPath));
    } on SighnUpExceptions catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    } on BaseExceptions catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }

  Future<void> passwordReset(String email) async {
    try {
      PasswordResetUseCase(repository: repository)(email);
    } on BaseExceptions catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }

  Future<void> verifyEmail() async {
    try {
      await EmailVerificationUseCase(repository: repository)();
    } on BaseExceptions catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signWithGoogle() async {
    try {
      await GoogleSignUseCase(repository: repository)();
      Future.sync(() => context.go(HomePage.routerPath));
    } on BaseExceptions catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }

  Future<void> sighnInWithEmail(String email, String password) async {
    try {
      await SighnInUseCase(repository: repository)(email, password);
      Future.sync(() => context.go(HomePage.routerPath));
    } on BaseExceptions catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }

  Future<void> sighnOut() async {
    try {
      await SighnOutUseCase(repository: repository)();
      Future.sync(() => context.go(LoginHome.routerPath));
    } on BaseExceptions catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }
}
