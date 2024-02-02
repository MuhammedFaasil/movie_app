import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/datasource/firestore_review_datasource.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/firestore_review_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_review_datasource_impl.g.dart';

class FireStoreReviewDataSourceImpl implements FireStoreReviewDataSource {
  final collection = FirebaseFirestore.instance
      .collection('comment')
      .withConverter(
          fromFirestore: ReviewModel.fromFirestore,
          toFirestore: (model, _) => model.toFirestore());
  @override
  Future<void> addReview(ReviewModel model) async {
    await collection.add(model);
  }

  @override
  Stream<QuerySnapshot<ReviewModel>> getReview(String id) {
    return collection.where('id', isEqualTo: id).snapshots();
  }

  @override
  Future<void> deleteReview(String id) async {
    await collection.doc(id).delete();
  }
}

@riverpod
FireStoreReviewDataSource fireStoreReviewDataSource(
    FireStoreReviewDataSourceRef ref) {
  return FireStoreReviewDataSourceImpl();
}
