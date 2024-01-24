import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/datasource/popular_api_datasource.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/datasource/popular_api_datasource_impl.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/popular_movieapi_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/repository/popular_movie_repository.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/presentation/providers/popular_movie_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'popular_movie_repository_impl.g.dart';

class PopularApiRepositoryImpl implements PopularApiRepository {
  final PopularApiDataSource dataSource;
  PopularApiRepositoryImpl({required this.dataSource});
  @override
  Future<List<MovieEntity>> getPopularMovie() async {
    final data = await dataSource.getTrendingMovies();
    late List<MovieEntity> results;
    results = [
      for (final result in data.results)
        MovieEntity(
            backdropPath: result.backdropPath,
            originalLanguage: result.originalLanguage,
            originalTitle: result.originalTitle,
            overview: result.overview,
            posterPath: result.posterPath,
            title: result.title,
            video: result.video,
            voteAverage: result.voteAverage,
            voteCount: result.voteCount,
            popularity: result.popularity)
    ];
    return results;
  }
}

@riverpod
PopularApiRepository popularApiRepository(PopularApiRepositoryRef ref) {
  return PopularApiRepositoryImpl(
      dataSource: ref.watch(popularApiDataSourceProvider));
}
