import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_clean/core/exceptions/auth/sighnup_exceptions.dart';
import 'package:movie_app_with_clean/core/exceptions/base_exceptions.dart';
import 'package:movie_app_with_clean/core/utils/snackbar_utils.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/data/repository/auth_repository_impl.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/repository/auth_repository.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/usecase/google_sign_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/usecase/login_with_phone_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/usecase/password_reset_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/usecase/sighnin_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/usecase/sighnout_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/usecase/sighnup_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/usecase/verify_email_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/usecase/verify_otp_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/pages/authentication/login_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/pages/authentication/otp_verification_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/providers/auth_state.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/pages/home_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  late final AuthenticationRepository repository;
  @override
  AuthState build() {
    repository = ref.read(authRepositoryProvider);
    return AuthState(verificationId: '', resendToken: null);

    // ref.onDispose(dispose);
  }

  Future<void> sighnUpWithEmail(
      BuildContext context, String email, String password) async {
    try {
      await SignUpUseCase(repository: repository)(email, password);
      Future.sync(() => verifyEmail(context));
      Future.sync(() => context.go(HomePage.routerPath));
    } on SighnUpExceptions catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    } on BaseExceptions catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }

  Future<void> passwordReset(BuildContext context, String email) async {
    try {
      PasswordResetUseCase(repository: repository)(email);
    } on BaseExceptions catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }

  Future<void> verifyEmail(BuildContext context) async {
    try {
      await EmailVerificationUseCase(repository: repository)();
    } on BaseExceptions catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signWithGoogle(BuildContext context) async {
    try {
      await GoogleSignUseCase(repository: repository)();
      Future.sync(() => context.go(HomePage.routerPath));
    } on BaseExceptions catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signInWithPhone(BuildContext context, String phone) async {
    try {
      final verficationData =
          await LoginWithPhoneUseCase(repository: repository)(phone);
      state = AuthState(
          verificationId: verficationData.$1, resendToken: verficationData.$2);
      Future.sync(() => context.push(OtpVerficationPage.routePath));
    } on BaseExceptions catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }

  Future<void> verifyOtp(BuildContext context, String otp) async {
    try {
      await VerifyOtpUseCase(repository: repository)(state.verificationId, otp);
      Future.sync(() => context.go(HomePage.routerPath));
    } on BaseExceptions catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }

  Future<void> sighnInWithEmail(
      BuildContext context, String email, String password) async {
    try {
      await SighnInUseCase(repository: repository)(email, password);
      Future.sync(() => context.go(HomePage.routerPath));
    } on BaseExceptions catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }

  Future<void> sighnOut(BuildContext context) async {
    try {
      await SighnOutUseCase(repository: repository)();
      Future.sync(() => context.go(LoginHome.routerPath));
    } on BaseExceptions catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(context, e.message));
    }
  }
}
