import 'package:dio/dio.dart';
import 'package:movie_app_with_clean/core/exceptions/base_exceptions.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/trailer_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/repository/movie_repository.dart';

final class TrailerUseCase {
  final MovieApiRepository repository;
  TrailerUseCase({required this.repository});

  Future<List<TrailerEntity>> call(String id) async {
    try {
      final videos = await repository.getTrailer(id);
      final trailers = videos
          .where((video) => video.type.toLowerCase().trim() == 'trailer')
          .toList();
      return trailers;
    } catch (e) {
      throw BaseExceptions(
          'Error while loading \n ${(e is DioException) ? e.type : e}');
    }
  }
}
