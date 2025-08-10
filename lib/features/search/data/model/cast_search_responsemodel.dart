// To parse this JSON data, do
//
//     final castSearchResponseModel = castSearchResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:cine_shelf/features/content_details/data/models/casts_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cast_search_responsemodel.freezed.dart';
part 'cast_search_responsemodel.g.dart';

CastSearchResponseModel castSearchResponseModelFromJson(String str) =>
    CastSearchResponseModel.fromJson(json.decode(str));

String castSearchResponseModelToJson(CastSearchResponseModel data) =>
    json.encode(data.toJson());

@freezed
abstract class CastSearchResponseModel with _$CastSearchResponseModel {
  const factory CastSearchResponseModel({
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "results") List<Cast>? results,
    @JsonKey(name: "total_pages") int? totalPages,
    @JsonKey(name: "total_results") int? totalResults,
  }) = _CastSearchResponseModel;

  factory CastSearchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CastSearchResponseModelFromJson(json);
}
