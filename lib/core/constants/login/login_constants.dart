import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_constants.g.dart';

class LoginConstants {
  final appName = 'Movie Time';
  final userNameText = 'Enter Username';
  final passwordText = 'Enter Password';
  final loginText = 'Sign in';
  final otherLogin = 'or login with';
  final buttonText = 'Forget password ?';
}

@riverpod
LoginConstants loginConstants(LoginConstantsRef ref) {
  return LoginConstants();
}
