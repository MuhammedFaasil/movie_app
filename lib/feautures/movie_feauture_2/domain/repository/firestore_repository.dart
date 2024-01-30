

import 'package:movie_app_with_clean/feautures/movie_feauture_2/domain/entity/movie_api_entity.dart';

abstract class FireStoreRepository {
 
  Future<void> addToFIreStore(MovieEntity entity);
}
