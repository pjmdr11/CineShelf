// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContentItem _$ContentItemFromJson(Map<String, dynamic> json) => _ContentItem(
  adult: json['adult'] as bool?,
  backdropPath: json['backdropPath'] as String?,
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  originalName: json['originalName'] as String?,
  overview: json['overview'] as String?,
  posterPath: json['posterPath'] as String?,
  mediaType: json['mediaType'] as String?,
  originalLanguage: json['originalLanguage'] as String?,
  genreIds: (json['genreIds'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  popularity: (json['popularity'] as num?)?.toDouble(),
  firstAirDate: json['firstAirDate'] == null
      ? null
      : DateTime.parse(json['firstAirDate'] as String),
  voteAverage: (json['voteAverage'] as num?)?.toDouble(),
  voteCount: (json['voteCount'] as num?)?.toInt(),
  originCountry: (json['originCountry'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  title: json['title'] as String?,
  originalTitle: json['originalTitle'] as String?,
  releaseDate: json['releaseDate'] == null
      ? null
      : DateTime.parse(json['releaseDate'] as String),
  video: json['video'] as bool?,
);

Map<String, dynamic> _$ContentItemToJson(_ContentItem instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdropPath': instance.backdropPath,
      'id': instance.id,
      'name': instance.name,
      'originalName': instance.originalName,
      'overview': instance.overview,
      'posterPath': instance.posterPath,
      'mediaType': instance.mediaType,
      'originalLanguage': instance.originalLanguage,
      'genreIds': instance.genreIds,
      'popularity': instance.popularity,
      'firstAirDate': instance.firstAirDate?.toIso8601String(),
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
      'originCountry': instance.originCountry,
      'title': instance.title,
      'originalTitle': instance.originalTitle,
      'releaseDate': instance.releaseDate?.toIso8601String(),
      'video': instance.video,
    };
