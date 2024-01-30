import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/datasource/fire_base_datasource.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/firestore_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fire_base_datasource_impl.g.dart';

class FireBaseDataSourceImpl implements FireBaseDataSource {
  @override
  Future<void> addToFireStore(FireStoreModel model) async {
    FirebaseFirestore.instance
        .collection('favourite')
        .doc(model.id.toString())
        .set(model.toFirestore());
  }
}
@riverpod
FireBaseDataSource fireBaseDataSource(FireBaseDataSourceRef ref) {
  return FireBaseDataSourceImpl();
}
