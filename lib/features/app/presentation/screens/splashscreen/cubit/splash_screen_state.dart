part of 'splash_screen_cubit.dart';

@freezed
class SplashScreenState with _$SplashScreenState {
  const factory SplashScreenState.initial() = _Initial;
  const factory SplashScreenState.loading() = _Loading;
  const factory SplashScreenState.success(String route) = _Success;
  const factory SplashScreenState.error(String message) = _Error;
}
