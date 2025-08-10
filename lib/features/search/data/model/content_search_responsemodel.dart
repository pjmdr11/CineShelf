import 'dart:convert';

import 'package:cine_shelf/core/constants/app_constants.dart';
import 'package:cine_shelf/features/movie_home/data/models/content_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_search_responsemodel.freezed.dart';
part 'content_search_responsemodel.g.dart';

ContentSearchResponseModel contentSearchResponseModelFromJson(String str) =>
    ContentSearchResponseModel.fromJson(json.decode(str));

String contentSearchResponseModelToJson(ContentSearchResponseModel data) =>
    json.encode(data.toJson());

@freezed
abstract class ContentSearchResponseModel with _$ContentSearchResponseModel {
  const factory ContentSearchResponseModel({
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "results") List<ContentItem>? results,
    @JsonKey(name: "total_pages") int? totalPages,
    @JsonKey(name: "total_results") int? totalResults,
    ContentType? contentType,
  }) = _ContentSearchResponseModel;

  factory ContentSearchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ContentSearchResponseModelFromJson(json);
}
