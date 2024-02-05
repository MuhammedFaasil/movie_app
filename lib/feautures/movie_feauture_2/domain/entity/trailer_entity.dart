import 'package:freezed_annotation/freezed_annotation.dart';

part 'trailer_entity.freezed.dart';

@freezed
class TrailerEntity with _$TrailerEntity {
  factory TrailerEntity({required String id, required String title}) =
      _TrailerEntity;
}
