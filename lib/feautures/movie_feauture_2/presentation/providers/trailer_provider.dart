import 'dart:developer';

import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/repository/movie_repository_impl.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/trailer_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/usecase/trailer_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'trailer_provider.g.dart';

@riverpod
Future<List<TrailerEntity>> trailer(TrailerRef ref, String movieId) async {
  log(movieId);
  return await TrailerUseCase(repository: ref.read(movieApiRepositoryProvider))(
      movieId);
}
