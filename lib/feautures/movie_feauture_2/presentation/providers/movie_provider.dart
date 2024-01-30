import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/repository/firestore_repository_impl.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/repository/movie_repository_impl.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/repository/movie_repository.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/usecase/action_movies_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/usecase/addfirestore_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/usecase/genre_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/usecase/movie_fetch_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/usecase/nowplaying_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/usecase/popular_movie_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/providers/movie_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_provider.g.dart';

@riverpod
class MovieApi extends _$MovieApi {
  late MovieEntity entity;
  @override
  Future<MovieState> build() async {
  final MovieApiRepository repository = ref.watch(movieApiRepositoryProvider);
    final result = Future.wait([
      FetchMovieUseCase(repository: repository)(),
      NowPlayingUseCase(repository: repository)(),
      ActionMoviesUseCase(repository: repository)(),
      ActionMoviesUseCase(repository: repository)(),
      PopularMovieUseCase(repository: repository)(),
    ]);
    final genre = GenreUseCase(repository: repository)();

    return MovieState(
        movies: (await result)[0],
        nowPlaying: (await result)[1],
        actionMovies: (await result)[2],
        popular: (await result)[3],
        genre: await genre);
  }

  Future<void> addToFIrestore(MovieEntity entity) {
    return FireStoreUseCase(repository: ref.watch(fireStoreRepositoryProvider))(
        entity);
  }
}
