import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/pages/authentication/login_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/pages/authentication/sighup_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/pages/home_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final router = GoRouter(initialLocation: HomePage.routerPath, routes: [
  GoRoute(
    path: HomePage.routerPath,
    builder: (context, state) => const HomePage(),
    redirect: (context, state) {
      if (FirebaseAuth.instance.currentUser == null ||
          !FirebaseAuth.instance.currentUser!.emailVerified) {
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
  )
]);
@riverpod
GoRouter route(RouteRef ref) {
  return router;
}
