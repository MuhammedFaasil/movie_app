import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/pages/authentication/login_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/pages/authentication/otp_verification_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/pages/authentication/phone_login_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/presentation/pages/authentication/sighup_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/genre_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/pages/action_movie_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/pages/favourite_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/pages/home_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/pages/overview_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/pages/serch_movie_page.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/pages/tvhomescreen_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final router = GoRouter(initialLocation: HomePage.routerPath, routes: [
  GoRoute(
    path: HomePage.routerPath,
    builder: (context, state) => const HomePage(),
    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null || (!user.emailVerified && user.phoneNumber == null)) {
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
    builder: (context, state) =>const PhoneLoginPage(),
  ),
  GoRoute(
    path: OtpVerficationPage.routePath,
    builder: (context, state) =>const OtpVerficationPage(),
  ),
  GoRoute(
    path: OverViewPage.routePath,
    builder: (context, state) =>
        OverViewPage(entity: state.extra as MovieEntity),
  ),
  GoRoute(
    path: ActionMoviesPage.routePath,
    builder: (context, state) => ActionMoviesPage(
      entity: state.extra as GenreEntity,
    ),
  ),
  GoRoute(
    path: FavouritePage.routePath,
    builder: (context, state) => FavouritePage(),
  ),
  GoRoute(
    path: SearchMoviePage.routePath,
    builder: (context, state) => SearchMoviePage(),
  ),
 
]);
@riverpod
GoRouter route(RouteRef ref) {
  return router;
}
