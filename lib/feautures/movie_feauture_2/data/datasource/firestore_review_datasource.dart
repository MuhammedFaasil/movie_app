import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/firestore_review_model.dart';

abstract class FireStoreReviewDataSource {
  Future<void> addReview(ReviewModel model);
  Stream<QuerySnapshot<ReviewModel>> getReview(String id);
  Future<void> deleteReview(String id);
}
