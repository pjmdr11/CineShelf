import 'package:cine_shelf/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

extension CapitalizeFirstLetter on String {
  /// Capitalizes the first letter of the string.
  String capitalizeFirstLetter() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Converts the string to lowercase.
  String toLowerCase() {
    return this.toLowerCase();
  }

  /// Converts the string to uppercase.
  String toUpperCase() {
    return this.toUpperCase();
  }

  ThemeMode getAppThemeMode() {
    switch (this) {
      case appThemeLight:
        return ThemeMode.light;
      case appThemeDark:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
