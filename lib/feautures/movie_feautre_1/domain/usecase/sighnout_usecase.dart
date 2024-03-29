
import 'package:movie_app_with_clean/core/exceptions/auth/sighnout_exceptions.dart';
import 'package:movie_app_with_clean/feautures/movie_feautre_1/domain/repository/auth_repository.dart';

final class SighnOutUseCase {
  final AuthenticationRepository repository;
  SighnOutUseCase({required this.repository});

  Future<void> call() async {
    try {
      await repository.sighnOut();
    } on Exception{
      throw SighnOutExceptions("cannot sighnout","please check network");
    }
  }
}
