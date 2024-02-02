import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/review_entity.dart';

abstract class FireStoreRepository {
  Future<void> addToFIreStore(MovieEntity entity);
  Stream<List<MovieEntity>> fromFireStore();
  Future<void> deleteFromFireStore(String id);
  Future<void> addReview(ReviewEntity entity);
  Stream<List<ReviewEntity>> getReview(String id);
  Future<void> deletReview(String id);
}
