import 'package:cine_shelf/features/movies/data/models/content_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_model.freezed.dart';
part 'response_model.g.dart';

@freezed
abstract class ResponseModel with _$ResponseModel {
  const factory ResponseModel({
    int? page,
    List<ContentItem>? results,
    int? totalPages,
    int? totalResults,
    String? type,
    String? viewType,
  }) = _ResponseModel;

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);
}
