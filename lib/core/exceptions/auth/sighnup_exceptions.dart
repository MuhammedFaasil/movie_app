import 'package:movie_app_with_clean/core/exceptions/base_exceptions.dart';

class SighnUpExceptions extends BaseExceptions {
  final String code;
  SighnUpExceptions(super.message,this.code);
}
