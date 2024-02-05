// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'trailer_model.freezed.dart';
part 'trailer_model.g.dart';

TrailerModel trailerModelFromJson(String str) =>
    TrailerModel.fromJson(json.decode(str));

String trailerModelToJson(TrailerModel data) => json.encode(data.toJson());

@freezed
class TrailerModel with _$TrailerModel {
  const factory TrailerModel({
    required int id,
    required List<Result> results,
  }) = _TrailerModel;

  factory TrailerModel.fromJson(Map<String, dynamic> json) =>
      _$TrailerModelFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    @JsonKey(name: "iso_639_1") required String iso6391,
    @JsonKey(name: "iso_3166_1") required String iso31661,
    required String name,
    required String key,
    required String site,
    required int size,
    required String type,
    required bool official,
    @JsonKey(name: "published_at") required DateTime publishedAt,
    required String id,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
