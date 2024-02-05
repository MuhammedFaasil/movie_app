import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app_with_clean/core/constants/movieapi/api_constants.dart';
import 'package:movie_app_with_clean/core/objectbox/action_objectbox.dart';
import 'package:movie_app_with_clean/core/objectbox/movie_objectbox.dart';
import 'package:movie_app_with_clean/core/objectbox/popular_objectbox.dart';
import 'package:movie_app_with_clean/core/objectbox/toprated_objectbox.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/datasource/objectbox_datasource.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/action_objectbox_entity_model.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/objectbox_entity_model.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/popular_objectbox_entity_model.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/toprated_objectbox_entity_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'objectbox_datasource_impl.g.dart';

class ObjectBoxDataSourceImpl implements ObjectBoxDataSource {
  final movieBox = MovieObjectBox.instance.box;
  final topRatedBox = TopRatedObjectBox.instance.box;
  final actionBox = ActionObjectBox.instance.box;
  final popularBox = PopularObjectBox.instance.box;
  @override
  void addAllMovies(List<ObjectBoxEntity> entity) async {
    final dio = Dio(BaseOptions(baseUrl: ApiConstants.imagePath));
    final cacheDirectory =
        '${(await getApplicationDocumentsDirectory()).path}/cached_images';

    for (final movie in entity) {
      final posterPathLocation = '$cacheDirectory${movie.posterPath}';
      final backDropPathLocation = '$cacheDirectory${movie.backdropPath}';

      await dio.download(movie.posterPath!, posterPathLocation);
      await dio.download(movie.backdropPath!, backDropPathLocation);

      movie.posterPath = posterPathLocation;
      movie.backdropPath = backDropPathLocation;

      movieBox.put(movie);
    }
  }

  @override
  void clearAllMovies() {
    movieBox.removeAll();
  }

  @override
  List<ObjectBoxEntity> getMovies() {
    return movieBox.getAll();
  }

  @override
  void addTopRatedMovies(List<TopRatedBoxEntity> entity) async {
    final dio = Dio(BaseOptions(baseUrl: ApiConstants.imagePath));
    final cacheDirectory =
        '${(await getApplicationDocumentsDirectory()).path}/cached_images';

    for (final movie in entity) {
      final posterPathLocation = '$cacheDirectory${movie.posterPath}';
      final backDropPathLocation = '$cacheDirectory${movie.backdropPath}';

      await dio.download(movie.posterPath!, posterPathLocation);
      await dio.download(movie.backdropPath!, backDropPathLocation);

      movie.posterPath = posterPathLocation;
      movie.backdropPath = backDropPathLocation;

      topRatedBox.put(movie);
    }
  }

  @override
  void clearTopRatedMovies() {
    topRatedBox.removeAll();
  }

  @override
  List<TopRatedBoxEntity> getTopRatedMovies() {
    return topRatedBox.getAll();
  }

  @override
  void addActionMovies(List<ActionBoxEntity> entity) async {
    final dio = Dio(BaseOptions(baseUrl: ApiConstants.imagePath));
    final cacheDirectory =
        '${(await getApplicationDocumentsDirectory()).path}/cached_images';

    for (final movie in entity) {
      final posterPathLocation = '$cacheDirectory${movie.posterPath}';
      final backDropPathLocation = '$cacheDirectory${movie.backdropPath}';

      await dio.download(movie.posterPath!, posterPathLocation);
      await dio.download(movie.backdropPath!, backDropPathLocation);

      movie.posterPath = posterPathLocation;
      movie.backdropPath = backDropPathLocation;

      actionBox.put(movie);
    }
  }

  @override
  void addPopularMovies(List<PopularBoxEntity> entity) async {
    final dio = Dio(BaseOptions(baseUrl: ApiConstants.imagePath));
    final cacheDirectory =
        '${(await getApplicationDocumentsDirectory()).path}/cached_images';

    for (final movie in entity) {
      final posterPathLocation = '$cacheDirectory${movie.posterPath}';
      final backDropPathLocation = '$cacheDirectory${movie.backdropPath}';

      await dio.download(movie.posterPath!, posterPathLocation);
      await dio.download(movie.backdropPath!, backDropPathLocation);

      movie.posterPath = posterPathLocation;
      movie.backdropPath = backDropPathLocation;

      popularBox.put(movie);
    }
  }

  @override
  void clearActionMovies() {
    actionBox.removeAll();
  }

  @override
  void clearPopularMovies() {
    popularBox.removeAll();
  }

  @override
  List<ActionBoxEntity> getActionMovies() {
    return actionBox.getAll();
  }

  @override
  List<PopularBoxEntity> getPopularMovies() {
    return popularBox.getAll();
  }
}

@riverpod
ObjectBoxDataSource objectBoxDataSource(ObjectBoxDataSourceRef ref) {
  return ObjectBoxDataSourceImpl();
}
