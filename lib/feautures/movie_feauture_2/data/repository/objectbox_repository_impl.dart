import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/datasource/objectbox_datasource.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/datasource/objectbox_datasource_impl.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/action_objectbox_entity_model.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/objectbox_entity_model.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/popular_objectbox_entity_model.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/toprated_objectbox_entity_model.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/repository/objectbox_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'objectbox_repository_impl.g.dart';

class ObjectBoxRepositoryImpl implements ObjectBoxRepository {
  final ObjectBoxDataSource dataSource;
  ObjectBoxRepositoryImpl({required this.dataSource});
  @override
  void addAllMovies(List<MovieEntity> entity) {
    final movieModel = [
      for (final movie in entity)
        ObjectBoxEntity(
            movieId: movie.id,
            backdropPath: movie.backdropPath,
            originalLanguage: movie.originalLanguage,
            originalTitle: movie.originalTitle,
            overview: movie.overview,
            posterPath: movie.posterPath,
            title: movie.title,
            video: movie.video,
            voteAverage: movie.voteAverage,
            voteCount: movie.voteCount,
            popularity: movie.popularity)
    ];
    dataSource.addAllMovies(movieModel);
  }

  @override
  void clearAllMovies() {
    dataSource.clearAllMovies();
  }

  @override
  List<MovieEntity> getAllMovies() {
    final model = dataSource.getMovies();
    return [
      for (final movieModel in model)
        MovieEntity(
            id: movieModel.id,
            backdropPath: movieModel.backdropPath ?? '',
            originalLanguage: movieModel.originalLanguage ?? '',
            originalTitle: movieModel.originalTitle ?? '',
            overview: movieModel.overview ?? '',
            posterPath: movieModel.posterPath ?? '',
            title: movieModel.title ?? '',
            video: movieModel.video!,
            voteAverage: movieModel.voteAverage!,
            voteCount: movieModel.voteCount,
            popularity: movieModel.popularity!)
    ];
  }

  @override
  void addTopRatedMovies(List<MovieEntity> movies) {
    final movieModel = [
      for (final movie in movies)
        TopRatedBoxEntity(
            movieId: movie.id,
            backdropPath: movie.backdropPath,
            originalLanguage: movie.originalLanguage,
            originalTitle: movie.originalTitle,
            overview: movie.overview,
            posterPath: movie.posterPath,
            title: movie.title,
            video: movie.video,
            voteAverage: movie.voteAverage,
            voteCount: movie.voteCount,
            popularity: movie.popularity)
    ];
    dataSource.addTopRatedMovies(movieModel);
  }

  @override
  void clearTopRatedMovies() {
    dataSource.clearTopRatedMovies();
  }

  @override
  List<MovieEntity> getTopRatedMovies() {
    final model = dataSource.getTopRatedMovies();
    return [
      for (final movieModel in model)
        MovieEntity(
            id: movieModel.id,
            backdropPath: movieModel.backdropPath ?? '',
            originalLanguage: movieModel.originalLanguage ?? '',
            originalTitle: movieModel.originalTitle ?? '',
            overview: movieModel.overview ?? '',
            posterPath: movieModel.posterPath ?? '',
            title: movieModel.title ?? '',
            video: movieModel.video!,
            voteAverage: movieModel.voteAverage!,
            voteCount: movieModel.voteCount,
            popularity: movieModel.popularity!)
    ];
  }

  @override
  void addActionMovies(List<MovieEntity> movies) {
    final movieModel = [
      for (final movie in movies)
        ActionBoxEntity(
            movieId: movie.id,
            backdropPath: movie.backdropPath,
            originalLanguage: movie.originalLanguage,
            originalTitle: movie.originalTitle,
            overview: movie.overview,
            posterPath: movie.posterPath,
            title: movie.title,
            video: movie.video,
            voteAverage: movie.voteAverage,
            voteCount: movie.voteCount,
            popularity: movie.popularity)
    ];
    dataSource.addActionMovies(movieModel);
  }

  @override
  void clearActionMovies() {
    dataSource.clearActionMovies();
  }

  @override
  List<MovieEntity> getActionMovies() {
    final model = dataSource.getActionMovies();
    return [
      for (final movieModel in model)
        MovieEntity(
            id: movieModel.id,
            backdropPath: movieModel.backdropPath ?? '',
            originalLanguage: movieModel.originalLanguage ?? '',
            originalTitle: movieModel.originalTitle ?? '',
            overview: movieModel.overview ?? '',
            posterPath: movieModel.posterPath ?? '',
            title: movieModel.title ?? '',
            video: movieModel.video!,
            voteAverage: movieModel.voteAverage!,
            voteCount: movieModel.voteCount,
            popularity: movieModel.popularity!)
    ];
  }

  @override
  void addPopularMovies(List<MovieEntity> movies) {
    final movieModel = [
      for (final movie in movies)
        PopularBoxEntity(
            movieId: movie.id,
            backdropPath: movie.backdropPath,
            originalLanguage: movie.originalLanguage,
            originalTitle: movie.originalTitle,
            overview: movie.overview,
            posterPath: movie.posterPath,
            title: movie.title,
            video: movie.video,
            voteAverage: movie.voteAverage,
            voteCount: movie.voteCount,
            popularity: movie.popularity)
    ];
    dataSource.addPopularMovies(movieModel);
  }

  @override
  void clearPopularMovies() {
    dataSource.clearPopularMovies();
  }

  @override
  List<MovieEntity> getPopularMovies() {
    final model = dataSource.getPopularMovies();
    return [
      for (final movieModel in model)
        MovieEntity(
            id: movieModel.id,
            backdropPath: movieModel.backdropPath ?? '',
            originalLanguage: movieModel.originalLanguage ?? '',
            originalTitle: movieModel.originalTitle ?? '',
            overview: movieModel.overview ?? '',
            posterPath: movieModel.posterPath ?? '',
            title: movieModel.title ?? '',
            video: movieModel.video!,
            voteAverage: movieModel.voteAverage!,
            voteCount: movieModel.voteCount,
            popularity: movieModel.popularity!)
    ];
  }
}

@riverpod
ObjectBoxRepository objectBoxRepository(ObjectBoxRepositoryRef ref) {
  return ObjectBoxRepositoryImpl(
      dataSource: ref.watch(objectBoxDataSourceProvider));
}
