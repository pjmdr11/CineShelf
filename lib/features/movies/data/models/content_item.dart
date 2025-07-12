import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_item.freezed.dart';
part 'content_item.g.dart';

@freezed
abstract class ContentItem with _$ContentItem {
  const factory ContentItem({
    bool? adult,
    String? backdropPath,
    int? id,
    String? name,
    String? originalName,
    String? overview,
    String? posterPath,
    String? mediaType,
    String? originalLanguage,
    List<int>? genreIds,
    double? popularity,
    DateTime? firstAirDate,
    double? voteAverage,
    int? voteCount,
    List<String>? originCountry,
    String? title,
    String? originalTitle,
    DateTime? releaseDate,
    bool? video,
  }) = _ContentItem;

  factory ContentItem.fromJson(Map<String, dynamic> json) =>
      _$ContentItemFromJson(json);
}
