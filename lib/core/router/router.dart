import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/pages/authentication/login_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/pages/authentication/otp_verification_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/pages/authentication/phone_login_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/pages/authentication/sighup_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/pages/home_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final router = GoRouter(initialLocation: HomePage.routerPath, routes: [
  GoRoute(
    path: HomePage.routerPath,
    builder: (context, state) => const HomePage(),
    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null || !user.emailVerified) {
        return LoginHome.routerPath;
      }
      return null;
    },
  ),
  GoRoute(
    path: LoginHome.routerPath,
    builder: (context, state) => const LoginHome(),
  ),
  GoRoute(
    path: SignUpHome.routerPath,
    builder: (context, state) => const SignUpHome(),
  ),
  GoRoute(
    path: PhoneLoginPage.routePath,
    builder: (context, state) => PhoneLoginPage(),
  ),
  GoRoute(
    path: OtpVerficationPage.routePath,
    builder: (context, state) => OtpVerficationPage(),
  ),
]);
@riverpod
GoRouter route(RouteRef ref) {
  return router;
}
