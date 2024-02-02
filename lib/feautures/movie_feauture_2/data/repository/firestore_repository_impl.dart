import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/datasource/fire_base_datasource.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/datasource/fire_base_datasource_impl.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/datasource/firestore_review_datasource.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/datasource/firestore_review_datasource_impl.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/firestore_model.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/firestore_review_model.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/review_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/repository/firestore_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_repository_impl.g.dart';

class FireStoreRepositoryImpl implements FireStoreRepository {
  final FireBaseDataSource dataSource;
  final FireStoreReviewDataSource reviewDataSource;
  FireStoreRepositoryImpl(
      {required this.dataSource, required this.reviewDataSource});

  @override
  Future<void> addToFIreStore(MovieEntity entity) async {
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
      popularity: entity.popularity,
      // releaseDate: entity.releaseDate
    );
    await dataSource.addToFireStore(model);
  }

  @override
  Stream<List<MovieEntity>> fromFireStore() async* {
    final querySnapshote = dataSource.getFromFIreStore();
    await for (final doc in querySnapshote) {
      final data = doc.docs;
      yield [
        for (final model in data)
          MovieEntity(
            id: model.data().id,
            backdropPath: model.data().backdropPath ?? '',
            originalLanguage: model.data().originalLanguage ?? '',
            originalTitle: model.data().originalTitle ?? '',
            overview: model.data().overview ?? '',
            posterPath: model.data().posterPath ?? '',
            title: model.data().title ?? '',
            video: model.data().video,
            // releaseDate: model.data().releaseDate,
            voteAverage: model.data().voteAverage,
            voteCount: model.data().voteCount,
            popularity: model.data().popularity,
          )
      ];
    }
  }

  @override
  Future<void> deleteFromFireStore(String id) async {
    await dataSource.deletFromFireStore(id);
  }

  @override
  Future<void> addReview(ReviewEntity entity) async {
    final model = ReviewModel(review: entity.review, id: entity.id);
    await reviewDataSource.addReview(model);
  }

  @override
  Stream<List<ReviewEntity>> getReview(String id) async* {
    try {
      final querySnapShot = reviewDataSource.getReview(id);
      await for (final doc in querySnapShot) {
        final data = doc.docs;
        yield [
          for (final model in data)
            ReviewEntity(
                review: model.data().review ?? '', id: model.data().id ?? '', movieId: model.data().id ??'')
        ];
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> deletReview(String id) async {
    await reviewDataSource.deleteReview(id);
  }
}

@riverpod
FireStoreRepositoryImpl fireStoreRepository(FireStoreRepositoryRef ref) {
  return FireStoreRepositoryImpl(
      reviewDataSource: ref.watch(fireStoreReviewDataSourceProvider),
      dataSource: ref.watch(fireBaseDataSourceProvider));
}
