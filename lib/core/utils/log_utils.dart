import 'package:flutter/foundation.dart';

class LogUtils {
  static void log(String key, dynamic value) {
    if (kDebugMode) {
      print("$key--->$value");
    }
  }
}
