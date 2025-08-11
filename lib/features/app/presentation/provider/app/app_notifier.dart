import 'package:cine_shelf/core/constants/app_constants.dart';
import 'package:cine_shelf/core/di/injection.dart';
import 'package:cine_shelf/features/app/domain/usecases/get_apptheme.dart';
import 'package:cine_shelf/features/app/domain/usecases/set_apptheme.dart';
import 'package:cine_shelf/features/app/domain/usecases/set_locale.dart';
import 'package:cine_shelf/features/app/presentation/provider/app/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppNotifier extends StateNotifier<AppState> {
  final GetAppThemeUseCase _getAppThemeUseCase = getIt();
  final SetAppThemeUseCase _setThemeUseCase = getIt();
  final SetLocaleUseCase setLocaleUseCase = getIt();

  AppNotifier() : super(const AppState()) {
    initTheme();
  }

  void initTheme() {
    state = state.copyWith(appTheme: _getAppThemeUseCase.getAppTheme());
  }

  void changeTheme(String appTheme) {
    _setThemeUseCase.setAppTheme(appTheme);
    state = state.copyWith(appTheme: appTheme);
  }

  void setLocaleValue(String locale) {
    setLocaleUseCase.setLocaleValue(locale.replaceAll("_", "-"));
  }

  ThemeMode getAppThemeMode() {
    switch (state.appTheme) {
      case appThemeLight:
        return ThemeMode.light;
      case appThemeDark:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
