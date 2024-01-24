import 'package:dio/dio.dart';
import 'package:movie_app_with_clean/core/constants/movieapi/api_constants.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/datasource/popular_api_datasource.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/movie_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'popular_api_datasource_impl.g.dart';

class PopularApiDataSourceImpl implements PopularApiDataSource {
  final link = ApiConstants.popularUri;
  final token = ApiConstants.token;
  final dio = Dio();
  @override
  Future<MovieModel> getTrendingMovies() async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    final Response response = await dio.get(link);
    return MovieModel.fromJson(response.data);
  }
}
@riverpod
PopularApiDataSource popularApiDataSource(PopularApiDataSourceRef ref) {
  return PopularApiDataSourceImpl();
}
