import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/datasource/fire_base_datasource.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/firestore_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fire_base_datasource_impl.g.dart';

class FireBaseDataSourceImpl implements FireBaseDataSource {
  final collection = FirebaseFirestore.instance
      .collection('favourite')
      .withConverter(
          fromFirestore: FireStoreModel.fromFirestore,
          toFirestore: (model, _) => model.toFirestore());
  @override
  Future<void> addToFireStore(FireStoreModel model) async {
    collection.doc(model.id.toString()).set(model);
  }

  @override
  Stream<QuerySnapshot<FireStoreModel>> getFromFIreStore() {
    final querySnapshot = collection.snapshots();
    return querySnapshot;
  }

  @override
  Future<void> deletFromFireStore(String id) async {
    await collection.doc(id).delete();
  }
}

@riverpod
FireBaseDataSource fireBaseDataSource(FireBaseDataSourceRef ref) {
  return FireBaseDataSourceImpl();
}
