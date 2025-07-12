// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContentItem {

 bool? get adult; String? get backdropPath; int? get id; String? get name; String? get originalName; String? get overview; String? get posterPath; String? get mediaType; String? get originalLanguage; List<int>? get genreIds; double? get popularity; DateTime? get firstAirDate; double? get voteAverage; int? get voteCount; List<String>? get originCountry; String? get title; String? get originalTitle; DateTime? get releaseDate; bool? get video;
/// Create a copy of ContentItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContentItemCopyWith<ContentItem> get copyWith => _$ContentItemCopyWithImpl<ContentItem>(this as ContentItem, _$identity);

  /// Serializes this ContentItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContentItem&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.originalLanguage, originalLanguage) || other.originalLanguage == originalLanguage)&&const DeepCollectionEquality().equals(other.genreIds, genreIds)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.firstAirDate, firstAirDate) || other.firstAirDate == firstAirDate)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount)&&const DeepCollectionEquality().equals(other.originCountry, originCountry)&&(identical(other.title, title) || other.title == title)&&(identical(other.originalTitle, originalTitle) || other.originalTitle == originalTitle)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.video, video) || other.video == video));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,adult,backdropPath,id,name,originalName,overview,posterPath,mediaType,originalLanguage,const DeepCollectionEquality().hash(genreIds),popularity,firstAirDate,voteAverage,voteCount,const DeepCollectionEquality().hash(originCountry),title,originalTitle,releaseDate,video]);

@override
String toString() {
  return 'ContentItem(adult: $adult, backdropPath: $backdropPath, id: $id, name: $name, originalName: $originalName, overview: $overview, posterPath: $posterPath, mediaType: $mediaType, originalLanguage: $originalLanguage, genreIds: $genreIds, popularity: $popularity, firstAirDate: $firstAirDate, voteAverage: $voteAverage, voteCount: $voteCount, originCountry: $originCountry, title: $title, originalTitle: $originalTitle, releaseDate: $releaseDate, video: $video)';
}


}

/// @nodoc
abstract mixin class $ContentItemCopyWith<$Res>  {
  factory $ContentItemCopyWith(ContentItem value, $Res Function(ContentItem) _then) = _$ContentItemCopyWithImpl;
@useResult
$Res call({
 bool? adult, String? backdropPath, int? id, String? name, String? originalName, String? overview, String? posterPath, String? mediaType, String? originalLanguage, List<int>? genreIds, double? popularity, DateTime? firstAirDate, double? voteAverage, int? voteCount, List<String>? originCountry, String? title, String? originalTitle, DateTime? releaseDate, bool? video
});




}
/// @nodoc
class _$ContentItemCopyWithImpl<$Res>
    implements $ContentItemCopyWith<$Res> {
  _$ContentItemCopyWithImpl(this._self, this._then);

  final ContentItem _self;
  final $Res Function(ContentItem) _then;

/// Create a copy of ContentItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? adult = freezed,Object? backdropPath = freezed,Object? id = freezed,Object? name = freezed,Object? originalName = freezed,Object? overview = freezed,Object? posterPath = freezed,Object? mediaType = freezed,Object? originalLanguage = freezed,Object? genreIds = freezed,Object? popularity = freezed,Object? firstAirDate = freezed,Object? voteAverage = freezed,Object? voteCount = freezed,Object? originCountry = freezed,Object? title = freezed,Object? originalTitle = freezed,Object? releaseDate = freezed,Object? video = freezed,}) {
  return _then(_self.copyWith(
adult: freezed == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool?,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,originalLanguage: freezed == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as String?,genreIds: freezed == genreIds ? _self.genreIds : genreIds // ignore: cast_nullable_to_non_nullable
as List<int>?,popularity: freezed == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double?,firstAirDate: freezed == firstAirDate ? _self.firstAirDate : firstAirDate // ignore: cast_nullable_to_non_nullable
as DateTime?,voteAverage: freezed == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double?,voteCount: freezed == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int?,originCountry: freezed == originCountry ? _self.originCountry : originCountry // ignore: cast_nullable_to_non_nullable
as List<String>?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,originalTitle: freezed == originalTitle ? _self.originalTitle : originalTitle // ignore: cast_nullable_to_non_nullable
as String?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,video: freezed == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [ContentItem].
extension ContentItemPatterns on ContentItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContentItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContentItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContentItem value)  $default,){
final _that = this;
switch (_that) {
case _ContentItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContentItem value)?  $default,){
final _that = this;
switch (_that) {
case _ContentItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? adult,  String? backdropPath,  int? id,  String? name,  String? originalName,  String? overview,  String? posterPath,  String? mediaType,  String? originalLanguage,  List<int>? genreIds,  double? popularity,  DateTime? firstAirDate,  double? voteAverage,  int? voteCount,  List<String>? originCountry,  String? title,  String? originalTitle,  DateTime? releaseDate,  bool? video)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContentItem() when $default != null:
return $default(_that.adult,_that.backdropPath,_that.id,_that.name,_that.originalName,_that.overview,_that.posterPath,_that.mediaType,_that.originalLanguage,_that.genreIds,_that.popularity,_that.firstAirDate,_that.voteAverage,_that.voteCount,_that.originCountry,_that.title,_that.originalTitle,_that.releaseDate,_that.video);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? adult,  String? backdropPath,  int? id,  String? name,  String? originalName,  String? overview,  String? posterPath,  String? mediaType,  String? originalLanguage,  List<int>? genreIds,  double? popularity,  DateTime? firstAirDate,  double? voteAverage,  int? voteCount,  List<String>? originCountry,  String? title,  String? originalTitle,  DateTime? releaseDate,  bool? video)  $default,) {final _that = this;
switch (_that) {
case _ContentItem():
return $default(_that.adult,_that.backdropPath,_that.id,_that.name,_that.originalName,_that.overview,_that.posterPath,_that.mediaType,_that.originalLanguage,_that.genreIds,_that.popularity,_that.firstAirDate,_that.voteAverage,_that.voteCount,_that.originCountry,_that.title,_that.originalTitle,_that.releaseDate,_that.video);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? adult,  String? backdropPath,  int? id,  String? name,  String? originalName,  String? overview,  String? posterPath,  String? mediaType,  String? originalLanguage,  List<int>? genreIds,  double? popularity,  DateTime? firstAirDate,  double? voteAverage,  int? voteCount,  List<String>? originCountry,  String? title,  String? originalTitle,  DateTime? releaseDate,  bool? video)?  $default,) {final _that = this;
switch (_that) {
case _ContentItem() when $default != null:
return $default(_that.adult,_that.backdropPath,_that.id,_that.name,_that.originalName,_that.overview,_that.posterPath,_that.mediaType,_that.originalLanguage,_that.genreIds,_that.popularity,_that.firstAirDate,_that.voteAverage,_that.voteCount,_that.originCountry,_that.title,_that.originalTitle,_that.releaseDate,_that.video);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContentItem implements ContentItem {
  const _ContentItem({this.adult, this.backdropPath, this.id, this.name, this.originalName, this.overview, this.posterPath, this.mediaType, this.originalLanguage, final  List<int>? genreIds, this.popularity, this.firstAirDate, this.voteAverage, this.voteCount, final  List<String>? originCountry, this.title, this.originalTitle, this.releaseDate, this.video}): _genreIds = genreIds,_originCountry = originCountry;
  factory _ContentItem.fromJson(Map<String, dynamic> json) => _$ContentItemFromJson(json);

@override final  bool? adult;
@override final  String? backdropPath;
@override final  int? id;
@override final  String? name;
@override final  String? originalName;
@override final  String? overview;
@override final  String? posterPath;
@override final  String? mediaType;
@override final  String? originalLanguage;
 final  List<int>? _genreIds;
@override List<int>? get genreIds {
  final value = _genreIds;
  if (value == null) return null;
  if (_genreIds is EqualUnmodifiableListView) return _genreIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  double? popularity;
@override final  DateTime? firstAirDate;
@override final  double? voteAverage;
@override final  int? voteCount;
 final  List<String>? _originCountry;
@override List<String>? get originCountry {
  final value = _originCountry;
  if (value == null) return null;
  if (_originCountry is EqualUnmodifiableListView) return _originCountry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? title;
@override final  String? originalTitle;
@override final  DateTime? releaseDate;
@override final  bool? video;

/// Create a copy of ContentItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContentItemCopyWith<_ContentItem> get copyWith => __$ContentItemCopyWithImpl<_ContentItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContentItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContentItem&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.originalLanguage, originalLanguage) || other.originalLanguage == originalLanguage)&&const DeepCollectionEquality().equals(other._genreIds, _genreIds)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.firstAirDate, firstAirDate) || other.firstAirDate == firstAirDate)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount)&&const DeepCollectionEquality().equals(other._originCountry, _originCountry)&&(identical(other.title, title) || other.title == title)&&(identical(other.originalTitle, originalTitle) || other.originalTitle == originalTitle)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.video, video) || other.video == video));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,adult,backdropPath,id,name,originalName,overview,posterPath,mediaType,originalLanguage,const DeepCollectionEquality().hash(_genreIds),popularity,firstAirDate,voteAverage,voteCount,const DeepCollectionEquality().hash(_originCountry),title,originalTitle,releaseDate,video]);

@override
String toString() {
  return 'ContentItem(adult: $adult, backdropPath: $backdropPath, id: $id, name: $name, originalName: $originalName, overview: $overview, posterPath: $posterPath, mediaType: $mediaType, originalLanguage: $originalLanguage, genreIds: $genreIds, popularity: $popularity, firstAirDate: $firstAirDate, voteAverage: $voteAverage, voteCount: $voteCount, originCountry: $originCountry, title: $title, originalTitle: $originalTitle, releaseDate: $releaseDate, video: $video)';
}


}

/// @nodoc
abstract mixin class _$ContentItemCopyWith<$Res> implements $ContentItemCopyWith<$Res> {
  factory _$ContentItemCopyWith(_ContentItem value, $Res Function(_ContentItem) _then) = __$ContentItemCopyWithImpl;
@override @useResult
$Res call({
 bool? adult, String? backdropPath, int? id, String? name, String? originalName, String? overview, String? posterPath, String? mediaType, String? originalLanguage, List<int>? genreIds, double? popularity, DateTime? firstAirDate, double? voteAverage, int? voteCount, List<String>? originCountry, String? title, String? originalTitle, DateTime? releaseDate, bool? video
});




}
/// @nodoc
class __$ContentItemCopyWithImpl<$Res>
    implements _$ContentItemCopyWith<$Res> {
  __$ContentItemCopyWithImpl(this._self, this._then);

  final _ContentItem _self;
  final $Res Function(_ContentItem) _then;

/// Create a copy of ContentItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? adult = freezed,Object? backdropPath = freezed,Object? id = freezed,Object? name = freezed,Object? originalName = freezed,Object? overview = freezed,Object? posterPath = freezed,Object? mediaType = freezed,Object? originalLanguage = freezed,Object? genreIds = freezed,Object? popularity = freezed,Object? firstAirDate = freezed,Object? voteAverage = freezed,Object? voteCount = freezed,Object? originCountry = freezed,Object? title = freezed,Object? originalTitle = freezed,Object? releaseDate = freezed,Object? video = freezed,}) {
  return _then(_ContentItem(
adult: freezed == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool?,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,originalLanguage: freezed == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as String?,genreIds: freezed == genreIds ? _self._genreIds : genreIds // ignore: cast_nullable_to_non_nullable
as List<int>?,popularity: freezed == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double?,firstAirDate: freezed == firstAirDate ? _self.firstAirDate : firstAirDate // ignore: cast_nullable_to_non_nullable
as DateTime?,voteAverage: freezed == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double?,voteCount: freezed == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int?,originCountry: freezed == originCountry ? _self._originCountry : originCountry // ignore: cast_nullable_to_non_nullable
as List<String>?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,originalTitle: freezed == originalTitle ? _self.originalTitle : originalTitle // ignore: cast_nullable_to_non_nullable
as String?,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,video: freezed == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
