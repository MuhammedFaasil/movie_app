import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/datasource/fire_base_datasource.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/datasource/fire_base_datasource_impl.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/firestore_model.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/repository/firestore_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_repository_impl.g.dart';

class FireStoreRepositoryImpl implements FireStoreRepository {
  final FireBaseDataSource dataSource;
  FireStoreRepositoryImpl({required this.dataSource});
  
  @override
  Future<void> addToFIreStore(MovieEntity entity) async{
    final model = FireStoreModel(
        id: entity.id,
        backdropPath: entity.backdropPath,
        originalLanguage: entity.originalLanguage,
        originalTitle: entity.originalTitle,
        overview: entity.overview,
        posterPath: entity.posterPath,
        title: entity.title,
        video: entity.video,
        voteAverage: entity.voteAverage,
        voteCount: entity.voteCount,
        popularity: entity.popularity);
   await dataSource.addToFireStore(model);
  }
 
}

@riverpod
FireStoreRepositoryImpl fireStoreRepository(FireStoreRepositoryRef ref) {
  return FireStoreRepositoryImpl(
      dataSource: ref.watch(fireBaseDataSourceProvider));
}
