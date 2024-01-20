import 'package:movie_app_with_clean/core/exceptions/base_exceptions.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/repository/auth_repository.dart';

final class LoginWithPhoneUseCase {
  final AuthenticationRepository repository;
  LoginWithPhoneUseCase({required this.repository});

  Future<(String, int?)> call(String phone) async {
    try {
      return await repository.signinWithPhone(phone);
    } on Exception {
      throw BaseExceptions('ENter phone number correctly' );
    }
  }
}
