// import 'package:movie_app_with_clean/core/exceptions/base_exceptions.dart';
// import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/genre_entity.dart';
// import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/repository/movie_repository.dart';

// final class GenreUseCase {
//   final MovieApiRepository repository;
//   GenreUseCase({required this.repository});

//   Future<List<GenreEntity>> call() async {
//     try {
//       return repository.genreApi();
//     } catch (e) {
//       throw BaseExceptions(e.toString());
//     }
//   }
// }


import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:movie_app_with_clean/core/exceptions/base_exceptions.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/repository/movie_repository.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/repository/objectbox_repository.dart';

final class GenreUseCase {
  final ObjectBoxRepository localRep;
  final MovieApiRepository repository;
  GenreUseCase({required this.repository, required this.localRep});
  Future<List<MovieEntity>> call() async {
    bool result = await InternetConnection().hasInternetAccess;
    try {
      if (result) {
        final dataFormApi = await repository.fetchMovies();
        localRep.clearAllMovies();
        localRep.addAllMovies(dataFormApi);
        return dataFormApi;
      } else {
        final dataformlocal = localRep.getAllMovies();
        return dataformlocal;
      }
    } catch (e) {
      throw BaseExceptions(e.toString());
    }
  }
}

