import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/repository/firestore_repository_impl.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/repository/movie_repository_impl.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/repository/objectbox_repository_impl.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/review_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/trailer_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/repository/movie_repository.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/usecase/action_movies_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/usecase/addfirestore_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/usecase/addreview_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/usecase/delete_firebase_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/usecase/deletreview_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/usecase/genre_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/usecase/getfrom_firebase_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/usecase/getreview_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/usecase/movie_fetch_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/usecase/nowplaying_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/usecase/popular_movie_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/usecase/search_movie_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/usecase/trailer_usecase.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/pages/serch_movie_page.dart';
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
      FetchMovieUseCase(
          repository: repository,
          localRep: ref.watch(objectBoxRepositoryProvider))(),
      NowPlayingUseCase(
          repository: repository,
          localRep: ref.watch(objectBoxRepositoryProvider))(),
      ActionMoviesUseCase(
          repository: repository,
          localRep: ref.watch(objectBoxRepositoryProvider))(),
      // ActionMoviesUseCase(repository: repository)(),
      PopularMovieUseCase(
          repository: repository,
          localRep: ref.watch(objectBoxRepositoryProvider))(),
    ]);
    // final genre = GenreUseCase(repository: repository,localRep: ref.watch(objectBoxRepositoryProvider))();

    return MovieState(
      movies: (await result)[0],
      nowPlaying: (await result)[1],
      actionMovies: (await result)[2],
      popular: (await result)[3],
      // genre: await genre,
      search: null,
    );
  }

  Future<void> searchMovie(String name, BuildContext context) async {
    try {
      final data = await SearchMovieUseCase(
          repository: ref.watch(movieApiRepositoryProvider))(name);
      state = AsyncValue.data(state.value!.copyWith(search: data));
      Future.sync(() => context.push(SearchMoviePage.routePath));
    } catch (e) {
      Text(e.toString());
    }
  }

  Future<void> addToFIrestore(MovieEntity entity) {
    return FireStoreUseCase(repository: ref.watch(fireStoreRepositoryProvider))(
        entity);
  }

  Stream<List<MovieEntity>> getMovieFromStore() {
    return GetFromFireStoreUseCase(
        repository: ref.watch(fireStoreRepositoryProvider))();
  }

  Future<void> deleteFireStore(String id) {
    return DeleteFromFirebaseUseCase(
        repository: ref.watch(fireStoreRepositoryProvider))(id);
  }

  Future<void> addReview(ReviewEntity entity, String id) {
    return ReviewUseCase(repository: ref.watch(fireStoreRepositoryProvider))(
        entity, id);
  }

  Stream<List<ReviewEntity>> getReview(String id) {
    return GetReviewUseCase(repository: ref.watch(fireStoreRepositoryProvider))(
        id);
  }

  Future<void> deletReview(String id) async {
    return await DeleteReviewUseCase(
        repository: ref.watch(fireStoreRepositoryProvider))(id);
  }

  Future<List<TrailerEntity>> getTrailer(String id) {
    return TrailerUseCase(repository: ref.watch(movieApiRepositoryProvider))(id);
  }
}
