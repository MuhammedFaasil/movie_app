import 'package:movie_app_with_clean/core/exceptions/base_exceptions.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/repository/auth_repository.dart';

final class VerifyOtpUseCase {
  final AuthenticationRepository repository;
  VerifyOtpUseCase({required this.repository});

  Future<void> call(String verificatonId, String otp) async {
    try {
      await repository.verifyOtp(verificatonId, otp);
    } on Exception {
      throw BaseExceptions('enter your otp correctly');
    }
  }
}
