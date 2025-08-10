import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class PreferenceHelper {
  final SharedPreferences prefs;

  PreferenceHelper({required this.prefs});

  Future<bool> setString(String key, String value) async {
    return await prefs.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await prefs.setBool(key, value);
  }

  Future<bool> setInt(String key, int value) async {
    return await prefs.setInt(key, value);
  }

  Future<bool> setDouble(String key, double value) async {
    return await prefs.setDouble(key, value);
  }

  String getString(String key, {def = ""}) {
    return prefs.getString(key) ?? def;
  }

  bool getBool(String key, {def = false}) {
    return prefs.getBool(key) ?? def;
  }

  int getInt(String key, {def = 0}) {
    return prefs.getInt(key) ?? def;
  }

  double getDouble(String key, {def = 0.0}) {
    return prefs.getDouble(key) ?? def;
  }

  Future<bool> clearPrefs() async {
    return await prefs.clear();
  }
}
