import 'package:objectbox/objectbox.dart';

@Entity()
class ActionBoxEntity {
  @Id()
  int id = 0;
  int? movieId;
  String? backdropPath;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  double? popularity;
  ActionBoxEntity(
      {this.id= 0,
      required this.movieId,
      required this.backdropPath,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount,
      required this.popularity});
}
