import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class ScreenUtils {
  static bool isTablet(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.shortestSide >= 600 && size.shortestSide < 1200;
  }

  double getResponsiveWidth(BuildContext context, int width) {
    return 0.0;
  }
}
