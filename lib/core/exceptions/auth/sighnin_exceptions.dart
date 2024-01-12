import 'package:movie_app_with_clean/core/exceptions/base_exceptions.dart';

class SighnInExceptions extends BaseExceptions {
  final String code;
  SighnInExceptions(super.message,this.code);
}
