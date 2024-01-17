import 'package:movie_app_with_clean/core/exceptions/base_exceptions.dart';

class InvalidCredentialException extends BaseExceptions{
  InvalidCredentialException() : super('invalid user input');

}