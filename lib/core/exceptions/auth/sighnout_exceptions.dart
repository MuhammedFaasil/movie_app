import 'package:movie_app_with_clean/core/exceptions/base_exceptions.dart';

class SighnOutExceptions extends BaseExceptions {
  final String code;
  SighnOutExceptions(super.message, this.code);
}
