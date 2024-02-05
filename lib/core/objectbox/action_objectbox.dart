import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/action_objectbox_entity_model.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/objectbox_entity_model.dart';

import 'package:movie_app_with_clean/objectbox.g.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ActionObjectBox {
  static ActionObjectBox? _instance;
  final Store store;
  late final Box<ActionBoxEntity> box;

  ActionObjectBox._create(this.store) {
    box = store.box<ActionBoxEntity>();
  }

  static ActionObjectBox get instance {
    return _instance!;
  }

  static Future<void> create() async {
    if (_instance == null) {
      final docDir = await getApplicationDocumentsDirectory();
      final store = await openStore(directory: join(docDir.path, 'moviepedia'));
      _instance = ActionObjectBox._create(store);
    }
  }
}
