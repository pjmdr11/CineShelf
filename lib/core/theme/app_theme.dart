import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData getlightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.teal.shade300,
      colorScheme: const ColorScheme.light(
        primary: Colors.teal,
        secondary: Colors.tealAccent,
        error: Colors.red,
        surface: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,
      canvasColor: Colors.grey.shade300,
      bottomAppBarTheme: BottomAppBarTheme(color: Colors.teal),
      textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black),
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: Colors.teal,
        iconTheme: WidgetStatePropertyAll(IconThemeData(color: Colors.teal)),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.white,
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      inputDecorationTheme: InputDecorationTheme(fillColor: Colors.red),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
      ),
    );
  }

  static ThemeData getDarkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.blueGrey.shade900,
      colorScheme: const ColorScheme.dark(
        primary: Colors.blueGrey,
        secondary: Colors.grey,
        error: Colors.red,
        surface: Colors.grey,
      ),
      textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
      canvasColor: Colors.grey.shade800,
      scaffoldBackgroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.grey.shade100),
      bottomAppBarTheme: BottomAppBarTheme(color: Colors.tealAccent),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.black,
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.black,
        shadowColor: Colors.black,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.black,
        shadowColor: Colors.grey,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
      ),
    );
  }
}
