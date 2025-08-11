import 'package:cine_shelf/core/constants/app_constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({@Default(appThemeSystem) String appTheme}) =
      _AppState;
}
