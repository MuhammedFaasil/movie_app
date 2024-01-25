import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/repository/movie_repository_impl.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/repository/movie_repository.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/usecase/action_movies_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/usecase/movie_fetch_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/usecase/nowplaying_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/providers/movie_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_provider.g.dart';

@riverpod
class MovieApi extends _$MovieApi {
  @override
  Future<MovieState> build() async {
    final MovieApiRepository repository = ref.watch(movieApiRepositoryProvider);

    final result = await Future.wait([
      FetchMovieUseCase(repository: repository)(),
      NowPlayingUseCase(repository: repository)(),
      ActionMoviesUseCase(repository: repository)(),
    ]);
    return MovieState(
        movies: result[0], nowPlaying: result[1], actionMovies: result[2]);
  }
}
