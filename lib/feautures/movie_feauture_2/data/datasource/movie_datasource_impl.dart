import 'package:dio/dio.dart';
import 'package:movie_app_with_clean/core/constants/movieapi/api_constants.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/datasource/movie_datasource.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/genre_model.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/movie_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_datasource_impl.g.dart';

class ApiDatasourceImpl implements ApiServicesDataSource {
  final url = ApiConstants.appUrl;
  final nowPlying = ApiConstants.nowPlaying;
  final action = ApiConstants.actionUrl;
  final token = ApiConstants.token;
  final dio = Dio();
  @override
  Future<MovieModel> fetchMovies() async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    final Response response = await dio.get(url);
    return MovieModel.fromJson(response.data);
  }

  @override
  Future<MovieModel> getNowPlaying() async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    final Response response = await dio.get(nowPlying);
    return MovieModel.fromJson(response.data);
  }

  @override
  Future<MovieModel> actionApiMovies() async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    final Response response =
        await dio.get(ApiConstants.allGenre, queryParameters: {"genre": 28});
    return MovieModel.fromJson(response.data);
  }

  @override
  Future<Genre> genreApi() async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    final Response response = await dio.get(ApiConstants.genreurl);
    return Genre.fromJson(response.data);
  }

  @override
  Future<MovieModel> getTrendingMovies() async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    final Response response = await dio.get(ApiConstants.popularUri);
    return MovieModel.fromJson(response.data);
  }

  @override
  Future<MovieModel> searchMovie(String movieName) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    final Response response = await dio
        .get(ApiConstants.searchUrl, queryParameters: {'query': movieName});
    return MovieModel.fromJson(response.data);
  }
}

@riverpod
ApiServicesDataSource apiDataSource(ApiDataSourceRef ref) {
  return ApiDatasourceImpl();
}
