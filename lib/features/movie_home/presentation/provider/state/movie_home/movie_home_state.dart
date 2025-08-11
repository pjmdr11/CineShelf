import 'package:cine_shelf/domain/entities/app_exception_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_home_state.freezed.dart';

@freezed
abstract class MovieHomeState with _$MovieHomeState {
  const factory MovieHomeState({
    @Default(false) bool isLoading,
    AppException? error,
    @Default({}) Map<String, dynamic> moviesdata,
  }) = _MovieHomeState;
}
