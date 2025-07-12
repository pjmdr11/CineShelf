// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResponseModel _$ResponseModelFromJson(Map<String, dynamic> json) =>
    _ResponseModel(
      page: (json['page'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ContentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalResults: (json['totalResults'] as num?)?.toInt(),
      type: json['type'] as String?,
      viewType: json['viewType'] as String?,
    );

Map<String, dynamic> _$ResponseModelToJson(_ResponseModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
      'type': instance.type,
      'viewType': instance.viewType,
    };
