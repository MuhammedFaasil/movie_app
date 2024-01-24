import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/repository/popular_movie_repository_impl.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/repository/popular_movie_repository.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/usecase/popular_movie_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'popular_movie_provider.g.dart';
@riverpod
class PopularMovie extends _$PopularMovie {
  late final PopularApiRepository repository;

  @override
  Future<List<MovieEntity>> build() async {
    return PopularMovieUseCase(
        repository: ref.watch(popularApiRepositoryProvider))();
  }
}
