// To parse this JSON data, do
//
//     final tvDetail = tvDetailFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_detail.freezed.dart';
part 'tv_detail.g.dart';

TvDetail tvDetailFromJson(String str) => TvDetail.fromJson(json.decode(str));

String tvDetailToJson(TvDetail data) => json.encode(data.toJson());

@freezed
abstract class TvDetail with _$TvDetail {
  const factory TvDetail({
    bool? adult,
    String? backdropPath,
    List<CreatedBy>? createdBy,
    List<dynamic>? episodeRunTime,
    DateTime? firstAirDate,
    List<Genre>? genres,
    String? homepage,
    int? id,
    bool? inProduction,
    List<String>? languages,
    dynamic lastAirDate,
    dynamic lastEpisodeToAir,
    String? name,
    NextEpisodeToAir? nextEpisodeToAir,
    List<Network>? networks,
    int? numberOfEpisodes,
    int? numberOfSeasons,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalName,
    String? overview,
    double? popularity,
    String? posterPath,
    List<Network>? productionCompanies,
    List<ProductionCountry>? productionCountries,
    List<Season>? seasons,
    List<SpokenLanguage>? spokenLanguages,
    String? status,
    String? tagline,
    String? type,
    double? voteAverage,
    int? voteCount,
  }) = _TvDetail;

  factory TvDetail.fromJson(Map<String, dynamic> json) =>
      _$TvDetailFromJson(json);
}

@freezed
abstract class CreatedBy with _$CreatedBy {
  const factory CreatedBy({
    int? id,
    String? creditId,
    String? name,
    String? originalName,
    int? gender,
    String? profilePath,
  }) = _CreatedBy;

  factory CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$CreatedByFromJson(json);
}

@freezed
abstract class Genre with _$Genre {
  const factory Genre({int? id, String? name}) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}

@freezed
abstract class Network with _$Network {
  const factory Network({
    int? id,
    String? logoPath,
    String? name,
    String? originCountry,
  }) = _Network;

  factory Network.fromJson(Map<String, dynamic> json) =>
      _$NetworkFromJson(json);
}

@freezed
abstract class NextEpisodeToAir with _$NextEpisodeToAir {
  const factory NextEpisodeToAir({
    int? id,
    String? name,
    String? overview,
    int? voteAverage,
    int? voteCount,
    DateTime? airDate,
    int? episodeNumber,
    String? episodeType,
    String? productionCode,
    int? runtime,
    int? seasonNumber,
    int? showId,
    String? stillPath,
  }) = _NextEpisodeToAir;

  factory NextEpisodeToAir.fromJson(Map<String, dynamic> json) =>
      _$NextEpisodeToAirFromJson(json);
}

@freezed
abstract class ProductionCountry with _$ProductionCountry {
  const factory ProductionCountry({String? iso31661, String? name}) =
      _ProductionCountry;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);
}

@freezed
abstract class Season with _$Season {
  const factory Season({
    DateTime? airDate,
    int? episodeCount,
    int? id,
    String? name,
    String? overview,
    String? posterPath,
    int? seasonNumber,
    int? voteAverage,
  }) = _Season;

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);
}

@freezed
abstract class SpokenLanguage with _$SpokenLanguage {
  const factory SpokenLanguage({
    String? englishName,
    String? iso6391,
    String? name,
  }) = _SpokenLanguage;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
}
