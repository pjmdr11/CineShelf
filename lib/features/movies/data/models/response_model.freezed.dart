// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResponseModel {

 int? get page; List<ContentItem>? get results; int? get totalPages; int? get totalResults; String? get type; String? get viewType;
/// Create a copy of ResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResponseModelCopyWith<ResponseModel> get copyWith => _$ResponseModelCopyWithImpl<ResponseModel>(this as ResponseModel, _$identity);

  /// Serializes this ResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResponseModel&&(identical(other.page, page) || other.page == page)&&const DeepCollectionEquality().equals(other.results, results)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&(identical(other.type, type) || other.type == type)&&(identical(other.viewType, viewType) || other.viewType == viewType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,const DeepCollectionEquality().hash(results),totalPages,totalResults,type,viewType);

@override
String toString() {
  return 'ResponseModel(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults, type: $type, viewType: $viewType)';
}


}

/// @nodoc
abstract mixin class $ResponseModelCopyWith<$Res>  {
  factory $ResponseModelCopyWith(ResponseModel value, $Res Function(ResponseModel) _then) = _$ResponseModelCopyWithImpl;
@useResult
$Res call({
 int? page, List<ContentItem>? results, int? totalPages, int? totalResults, String? type, String? viewType
});




}
/// @nodoc
class _$ResponseModelCopyWithImpl<$Res>
    implements $ResponseModelCopyWith<$Res> {
  _$ResponseModelCopyWithImpl(this._self, this._then);

  final ResponseModel _self;
  final $Res Function(ResponseModel) _then;

/// Create a copy of ResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = freezed,Object? results = freezed,Object? totalPages = freezed,Object? totalResults = freezed,Object? type = freezed,Object? viewType = freezed,}) {
  return _then(_self.copyWith(
page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,results: freezed == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<ContentItem>?,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,totalResults: freezed == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,viewType: freezed == viewType ? _self.viewType : viewType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResponseModel].
extension ResponseModelPatterns on ResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? page,  List<ContentItem>? results,  int? totalPages,  int? totalResults,  String? type,  String? viewType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResponseModel() when $default != null:
return $default(_that.page,_that.results,_that.totalPages,_that.totalResults,_that.type,_that.viewType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? page,  List<ContentItem>? results,  int? totalPages,  int? totalResults,  String? type,  String? viewType)  $default,) {final _that = this;
switch (_that) {
case _ResponseModel():
return $default(_that.page,_that.results,_that.totalPages,_that.totalResults,_that.type,_that.viewType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? page,  List<ContentItem>? results,  int? totalPages,  int? totalResults,  String? type,  String? viewType)?  $default,) {final _that = this;
switch (_that) {
case _ResponseModel() when $default != null:
return $default(_that.page,_that.results,_that.totalPages,_that.totalResults,_that.type,_that.viewType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResponseModel implements ResponseModel {
  const _ResponseModel({this.page, final  List<ContentItem>? results, this.totalPages, this.totalResults, this.type, this.viewType}): _results = results;
  factory _ResponseModel.fromJson(Map<String, dynamic> json) => _$ResponseModelFromJson(json);

@override final  int? page;
 final  List<ContentItem>? _results;
@override List<ContentItem>? get results {
  final value = _results;
  if (value == null) return null;
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? totalPages;
@override final  int? totalResults;
@override final  String? type;
@override final  String? viewType;

/// Create a copy of ResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResponseModelCopyWith<_ResponseModel> get copyWith => __$ResponseModelCopyWithImpl<_ResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResponseModel&&(identical(other.page, page) || other.page == page)&&const DeepCollectionEquality().equals(other._results, _results)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&(identical(other.type, type) || other.type == type)&&(identical(other.viewType, viewType) || other.viewType == viewType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,const DeepCollectionEquality().hash(_results),totalPages,totalResults,type,viewType);

@override
String toString() {
  return 'ResponseModel(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults, type: $type, viewType: $viewType)';
}


}

/// @nodoc
abstract mixin class _$ResponseModelCopyWith<$Res> implements $ResponseModelCopyWith<$Res> {
  factory _$ResponseModelCopyWith(_ResponseModel value, $Res Function(_ResponseModel) _then) = __$ResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int? page, List<ContentItem>? results, int? totalPages, int? totalResults, String? type, String? viewType
});




}
/// @nodoc
class __$ResponseModelCopyWithImpl<$Res>
    implements _$ResponseModelCopyWith<$Res> {
  __$ResponseModelCopyWithImpl(this._self, this._then);

  final _ResponseModel _self;
  final $Res Function(_ResponseModel) _then;

/// Create a copy of ResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = freezed,Object? results = freezed,Object? totalPages = freezed,Object? totalResults = freezed,Object? type = freezed,Object? viewType = freezed,}) {
  return _then(_ResponseModel(
page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,results: freezed == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<ContentItem>?,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,totalResults: freezed == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,viewType: freezed == viewType ? _self.viewType : viewType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
