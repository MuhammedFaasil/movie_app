import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/datasource/movie_datasource.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/datasource/movie_datasource_impl.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/movie_model.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/genre_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/trailer_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/repository/movie_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_repository_impl.g.dart';

class MoviePiRepositoryImpl implements MovieApiRepository {
  final ApiServicesDataSource dataSource;
  MoviePiRepositoryImpl({required this.dataSource});
  @override
  Future<List<MovieEntity>> fetchMovies() async {
    final data = await dataSource.fetchMovies();
    late List<MovieEntity> results;
    results = [
      for (final result in data.results)
        MovieEntity(
          id: result.id,
          backdropPath: result.backdropPath ?? "",
          originalLanguage: result.originalLanguage ?? "",
          originalTitle: result.originalTitle ?? "",
          overview: result.overview ?? "",
          posterPath: result.posterPath ?? "",
          title: result.title ?? "",
          popularity: result.popularity,
          voteAverage: result.voteAverage,
          voteCount: result.voteCount,
          video: result.video,
          // releaseDate: result.releaseDate
        )
    ];
    return results;
  }

  @override
  Future<List<MovieEntity>> getNowPlaying() async {
    final data = await dataSource.getNowPlaying();
    late List<MovieEntity> results;
    results = [
      for (final result in data.results)
        MovieEntity(
          id: result.id,
          backdropPath: result.backdropPath ?? "",
          originalLanguage: result.originalLanguage ?? "",
          originalTitle: result.originalTitle ?? "",
          overview: result.overview ?? "",
          posterPath: result.posterPath ?? "",
          title: result.title ?? "",
          popularity: result.popularity,
          voteAverage: result.voteAverage,
          voteCount: result.voteCount,
          video: result.video,
          //  releaseDate: result.releaseDate
        )
    ];
    return results;
  }

  @override
  Future<List<MovieEntity>> actionMovies() async {
    final data = await dataSource.actionApiMovies();
    late List<MovieEntity> results;
    results = [
      for (final result in data.results)
        MovieEntity(
          id: result.id,
          backdropPath: result.backdropPath ?? "",
          originalLanguage: result.originalLanguage ?? "",
          originalTitle: result.originalTitle ?? "",
          overview: result.overview ?? "",
          posterPath: result.posterPath ?? "",
          title: result.title ?? "",
          popularity: result.popularity,
          voteAverage: result.voteAverage,
          voteCount: result.voteCount,
          video: result.video,
          //  releaseDate: result.releaseDate
        )
    ];
    return results;
  }

  @override
  Future<List<GenreEntity>> genreApi() async {
    final data = await dataSource.genreApi();
    late List<GenreEntity> res;
    res = [
      for (final result in data.genres)
        GenreEntity(id: result.id, name: result.name)
    ];
    return res;
  }

  @override
  Future<List<MovieEntity>> getPopularMovie() async {
    final data = await dataSource.getTrendingMovies();
    late List<MovieEntity> results;
    results = [
      for (final result in data.results)
        MovieEntity(
          backdropPath: result.backdropPath ?? '',
          originalLanguage: result.originalLanguage ?? '',
          originalTitle: result.originalTitle ?? '',
          overview: result.overview ?? '',
          posterPath: result.posterPath ?? '',
          title: result.title ?? '',
          video: result.video,
          voteAverage: result.voteAverage,
          voteCount: result.voteCount,
          popularity: result.popularity,
          id: result.id,
          // releaseDate: result.releaseDate
        )
    ];
    return results;
  }

  @override
  Future<List<MovieEntity>> searchMovie(String movieName) async {
    final data = await dataSource.searchMovie(movieName);
    late List<MovieEntity> results;
    results = [
      for (final result in data.results)
        MovieEntity(
            id: result.id,
            backdropPath: result.backdropPath ?? "",
            originalLanguage: result.originalLanguage ?? "",
            originalTitle: result.originalTitle ?? "",
            overview: result.overview ?? "",
            posterPath: result.posterPath ?? "",
            title: result.title ?? "",
            video: result.video,
            voteAverage: result.voteAverage,
            voteCount: result.voteCount,
            popularity: result.popularity)
    ];
    return results;
  }

  @override
  Future<List<MovieEntity>> getTv() async {
    final data = await dataSource.getTv();
    late List<MovieEntity> results;
    results = [
      for (final result in data.results)
        MovieEntity(
            id: result.id,
            backdropPath: result.backdropPath ?? '',
            originalLanguage: result.originalLanguage ?? '',
            originalTitle: result.originalTitle ?? '',
            overview: result.overview ?? '',
            posterPath: result.posterPath ?? '',
            title: result.title ?? '',
            video: result.video,
            voteAverage: result.voteAverage,
            voteCount: result.voteCount,
            popularity: result.popularity)
    ];
    return results;
  }

  @override
  Future<List<TrailerEntity>> getTrailer(String id) async {
    final data = await dataSource.getTrailer(id);
    late List<TrailerEntity> results;
    results = [
      for (final result in data.results)
        TrailerEntity(id: result.id,  name: result.name, key: result.key, type: result.type)
    ];
    return results;
  }
}

@riverpod
MovieApiRepository movieApiRepository(MovieApiRepositoryRef ref) {
  return MoviePiRepositoryImpl(dataSource: ref.watch(apiDataSourceProvider));
}
