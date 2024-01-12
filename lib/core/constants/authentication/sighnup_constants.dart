import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sighnup_constants.g.dart';

class SighnUpConstants {
  final nameText = 'Enter your Name';
  final emailText = 'Enter your email';
  final numberText = 'Phone Number';
  final passwordText = 'Enter Password';
  final haveAccount = 'already have an account?';
  final signUp = 'Sighn Up';
}

@riverpod
SighnUpConstants sighnUpConstants(SighnUpConstantsRef ref) {
  return SighnUpConstants();
}
