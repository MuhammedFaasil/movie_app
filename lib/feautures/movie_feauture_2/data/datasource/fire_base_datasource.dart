import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/firestore_model.dart';

abstract class FireBaseDataSource {
  Future<void> addToFireStore(FireStoreModel model);
}
