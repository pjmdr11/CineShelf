// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieDetail _$MovieDetailFromJson(Map<String, dynamic> json) => _MovieDetail(
  adult: json['adult'] as bool?,
  backdropPath: json['backdropPath'] as String?,
  belongsToCollection: json['belongsToCollection'] == null
      ? null
      : BelongsToCollection.fromJson(
          json['belongsToCollection'] as Map<String, dynamic>,
        ),
  budget: (json['budget'] as num?)?.toInt(),
  genres: (json['genres'] as List<dynamic>?)
      ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
      .toList(),
  homepage: json['homepage'] as String?,
  id: (json['id'] as num?)?.toInt(),
  imdbId: json['imdbId'] as String?,
  originCountry: (json['originCountry'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  originalLanguage: json['originalLanguage'] as String?,
  originalTitle: json['originalTitle'] as String?,
  overview: json['overview'] as String?,
  popularity: (json['popularity'] as num?)?.toDouble(),
  posterPath: json['posterPath'] as String?,
  productionCompanies: (json['productionCompanies'] as List<dynamic>?)
      ?.map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
      .toList(),
  productionCountries: (json['productionCountries'] as List<dynamic>?)
      ?.map((e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
      .toList(),
  releaseDate: json['releaseDate'] == null
      ? null
      : DateTime.parse(json['releaseDate'] as String),
  revenue: (json['revenue'] as num?)?.toInt(),
  runtime: (json['runtime'] as num?)?.toInt(),
  spokenLanguages: (json['spokenLanguages'] as List<dynamic>?)
      ?.map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
      .toList(),
  status: json['status'] as String?,
  tagline: json['tagline'] as String?,
  title: json['title'] as String?,
  video: json['video'] as bool?,
  voteAverage: (json['voteAverage'] as num?)?.toDouble(),
  voteCount: (json['voteCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$MovieDetailToJson(_MovieDetail instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdropPath': instance.backdropPath,
      'belongsToCollection': instance.belongsToCollection,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'imdbId': instance.imdbId,
      'originCountry': instance.originCountry,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'posterPath': instance.posterPath,
      'productionCompanies': instance.productionCompanies,
      'productionCountries': instance.productionCountries,
      'releaseDate': instance.releaseDate?.toIso8601String(),
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'spokenLanguages': instance.spokenLanguages,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
    };

_BelongsToCollection _$BelongsToCollectionFromJson(Map<String, dynamic> json) =>
    _BelongsToCollection(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      posterPath: json['posterPath'] as String?,
      backdropPath: json['backdropPath'] as String?,
    );

Map<String, dynamic> _$BelongsToCollectionToJson(
  _BelongsToCollection instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'posterPath': instance.posterPath,
  'backdropPath': instance.backdropPath,
};

_Genre _$GenreFromJson(Map<String, dynamic> json) =>
    _Genre(id: (json['id'] as num?)?.toInt(), name: json['name'] as String?);

Map<String, dynamic> _$GenreToJson(_Genre instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};

_ProductionCompany _$ProductionCompanyFromJson(Map<String, dynamic> json) =>
    _ProductionCompany(
      id: (json['id'] as num?)?.toInt(),
      logoPath: json['logoPath'] as String?,
      name: json['name'] as String?,
      originCountry: json['originCountry'] as String?,
    );

Map<String, dynamic> _$ProductionCompanyToJson(_ProductionCompany instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logoPath': instance.logoPath,
      'name': instance.name,
      'originCountry': instance.originCountry,
    };

_ProductionCountry _$ProductionCountryFromJson(Map<String, dynamic> json) =>
    _ProductionCountry(
      iso31661: json['iso31661'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProductionCountryToJson(_ProductionCountry instance) =>
    <String, dynamic>{'iso31661': instance.iso31661, 'name': instance.name};

_SpokenLanguage _$SpokenLanguageFromJson(Map<String, dynamic> json) =>
    _SpokenLanguage(
      englishName: json['englishName'] as String?,
      iso6391: json['iso6391'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SpokenLanguageToJson(_SpokenLanguage instance) =>
    <String, dynamic>{
      'englishName': instance.englishName,
      'iso6391': instance.iso6391,
      'name': instance.name,
    };
