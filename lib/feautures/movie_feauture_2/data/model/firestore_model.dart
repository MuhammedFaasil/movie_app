import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'firestore_model.freezed.dart';
part 'firestore_model.g.dart';

@freezed
class FireStoreModel with _$FireStoreModel {
  FireStoreModel._();
  factory FireStoreModel({
    required int id,
    required String backdropPath,
    required String originalLanguage,
    required String originalTitle,
    required String overview,
    required String posterPath,
    required String title,
    required bool video,
    required double voteAverage,
    required int voteCount,
    required double popularity,
  }) = _FireStoreModel;

  factory FireStoreModel.fromJson(Map<String, dynamic> json) =>
      _$FireStoreModelFromJson(json);
  factory FireStoreModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return FireStoreModel.fromJson(data);
  }
  Map<String, dynamic> toFirestore() {
    return toJson();
  }
}
