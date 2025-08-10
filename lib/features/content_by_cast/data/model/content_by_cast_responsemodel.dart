// To parse this JSON data, do
//
//     final contentByCastResponseModel = contentByCastResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:cine_shelf/features/movie_home/data/models/content_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_by_cast_responsemodel.freezed.dart';
part 'content_by_cast_responsemodel.g.dart';

ContentByCastResponseModel contentByCastResponseModelFromJson(String str) =>
    ContentByCastResponseModel.fromJson(json.decode(str));

String contentByCastResponseModelToJson(ContentByCastResponseModel data) =>
    json.encode(data.toJson());

@freezed
abstract class ContentByCastResponseModel with _$ContentByCastResponseModel {
  const factory ContentByCastResponseModel({
    @JsonKey(name: "cast") List<ContentItem>? cast,
    @JsonKey(name: "crew") List<ContentItem>? crew,
    @JsonKey(name: "id") int? id,
  }) = _ContentByCastResponseModel;

  factory ContentByCastResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ContentByCastResponseModelFromJson(json);
}
