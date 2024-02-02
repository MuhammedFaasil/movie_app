import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/firestore_model.dart';

abstract class FireBaseDataSource {
  Future<void> addToFireStore(FireStoreModel model);
  Stream<QuerySnapshot<FireStoreModel>> getFromFIreStore();
  Future<void> deletFromFireStore(String id);
}
