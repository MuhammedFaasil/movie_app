import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/toprated_objectbox_entity_model.dart';

import 'package:movie_app_with_clean/objectbox.g.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class TopRatedObjectBox {
  static TopRatedObjectBox? _instance;
  final Store store;
  late final Box<TopRatedBoxEntity> box;

  TopRatedObjectBox._create(this.store) {
    box = store.box<TopRatedBoxEntity>();
  }

  static TopRatedObjectBox get instance {
    return _instance!;
  }

 static Future<void> create() async {
    if (_instance == null) {
      final docDir = await getApplicationDocumentsDirectory();
      final store = await openStore(directory: join(docDir.path, 'moviepediafour'));
      _instance = TopRatedObjectBox._create(store);
    }
  }
}
