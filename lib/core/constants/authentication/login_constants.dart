import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_constants.g.dart';

class LoginConstants {
  final appName = 'Movie Time';
  final userNameText = 'Enter Username';
  final passwordText = 'Enter Password';
  final loginText = 'Sign in';
  final continutext = 'or login with';
  final otherLogin = "if you don't have an account";
  final buttonText = 'Forget password ?';
  final googleLogo =
      'asset/image/2a5758d6-4edb-4047-87bb-e6b94dbbbab0-cover.png';
  final moviLogo =
      'asset/image/kisspng-photographic-film-movie-camera-cinema-website-and-mobile-application-development-service-5d3fc924ce3b33.8538265315644613488447-removebg-preview.png';
}

@riverpod
LoginConstants loginConstants(LoginConstantsRef ref) {
  return LoginConstants();
}