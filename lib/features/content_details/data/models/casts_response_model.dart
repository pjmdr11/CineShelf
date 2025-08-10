// To parse this JSON data, do
//
//     final castsResponseModel = castsResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'casts_response_model.freezed.dart';
part 'casts_response_model.g.dart';

CastsResponseModel castsResponseModelFromJson(String str) =>
    CastsResponseModel.fromJson(json.decode(str));

String castsResponseModelToJson(CastsResponseModel data) =>
    json.encode(data.toJson());

@freezed
abstract class CastsResponseModel with _$CastsResponseModel {
  const factory CastsResponseModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "cast") List<Cast>? cast,
    @JsonKey(name: "crew") List<Cast>? crew,
  }) = _CastsResponseModel;

  factory CastsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CastsResponseModelFromJson(json);
}

@freezed
abstract class Cast with _$Cast {
  const factory Cast({
    @JsonKey(name: "adult") bool? adult,
    @JsonKey(name: "gender") int? gender,
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "known_for_department") String? knownForDepartment,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "original_name") String? originalName,
    @JsonKey(name: "popularity") double? popularity,
    @JsonKey(name: "profile_path") String? profilePath,
    @JsonKey(name: "cast_id") int? castId,
    @JsonKey(name: "character") String? character,
    @JsonKey(name: "credit_id") String? creditId,
    @JsonKey(name: "order") int? order,
    @JsonKey(name: "department") String? department,
    @JsonKey(name: "job") String? job,
  }) = _Cast;

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
}
