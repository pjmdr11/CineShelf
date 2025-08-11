import 'package:freezed_annotation/freezed_annotation.dart';

part 'splashscreen_state.freezed.dart';

@freezed
sealed class SplashScreenState with _$SplashScreenState {
  const factory SplashScreenState.initial() = _Initial;
  const factory SplashScreenState.loading() = _Loading;
  const factory SplashScreenState.success(String route) = _Success;
}
