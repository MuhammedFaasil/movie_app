import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/action_objectbox_entity_model.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/objectbox_entity_model.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/popular_objectbox_entity_model.dart';
import 'package:movie_app_with_clean/feautures/movie_feauture_2/data/model/toprated_objectbox_entity_model.dart';


abstract class ObjectBoxDataSource {
  void addAllMovies(List<ObjectBoxEntity> entity);
  void clearAllMovies();
  List<ObjectBoxEntity> getMovies();

  void addTopRatedMovies(List<TopRatedBoxEntity> entity);
  void clearTopRatedMovies();
  List<TopRatedBoxEntity> getTopRatedMovies();

   void addPopularMovies(List<PopularBoxEntity> entity);
  void clearPopularMovies();
  List<PopularBoxEntity> getPopularMovies();

   void addActionMovies(List<ActionBoxEntity> entity);
  void clearActionMovies();
  List<ActionBoxEntity> getActionMovies();
}



