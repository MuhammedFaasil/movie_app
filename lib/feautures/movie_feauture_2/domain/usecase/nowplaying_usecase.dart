// import 'package:movie_app_with_clean/core/exceptions/base_exceptions.dart';
// import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
// import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/repository/movie_repository.dart';

// final class NowPlayingUseCase {
//   final MovieApiRepository repository;
//   NowPlayingUseCase({required this.repository});

//   Future<List<MovieEntity>> call() async {
//     try {
//       return repository.getNowPlaying();
//     } catch (e) {
//       throw BaseExceptions(e.toString());
//     }
//   }
// }

import 'package:movie_app_with_clean/core/exceptions/base_exceptions.dart';
import 'package:movie_app_with_clean/core/utils/network_utils.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/repository/movie_repository.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/repository/objectbox_repository.dart';

final class NowPlayingUseCase {
  final ObjectBoxRepository localRep;
  final MovieApiRepository repository;
  NowPlayingUseCase({required this.repository, required this.localRep});
  Future<List<MovieEntity>> call() async {
    bool result = await NetworkUtils.hasNetwork();
    try {
      if (result) {
        final dataFormApi = await repository.getNowPlaying();
        localRep.clearTopRatedMovies();
        localRep.addTopRatedMovies(dataFormApi);
        return dataFormApi;
      } else {
        final dataformlocal = localRep.getTopRatedMovies();
        return dataformlocal;
      }
    } catch (e) {
      throw BaseExceptions(e.toString());
    }
  }
}

