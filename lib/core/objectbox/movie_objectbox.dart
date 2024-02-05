import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/objectbox_entity_model.dart';

import 'package:movie_app_with_clean/objectbox.g.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class MovieObjectBox {
  static MovieObjectBox? _instance;
  final Store store;
  late final Box<ObjectBoxEntity> box;

  MovieObjectBox._create(this.store) {
    box = store.box<ObjectBoxEntity>();
  }

  static MovieObjectBox get instance {
    return _instance!;
  }

 static Future<void> create() async {
    if (_instance == null) {
      final docDir = await getApplicationDocumentsDirectory();
      final store = await openStore(directory: join(docDir.path, 'moviepediatwo'));
      _instance = MovieObjectBox._create(store);
    }
  }
}
