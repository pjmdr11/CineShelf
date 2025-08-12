part of 'app_cubit.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({@Default(appThemeSystem) String appTheme}) =
      _AppState;
}
