import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ResponsiveFontSize on num {
  /// Returns a font size based on device width.
  /// - It scales up on tablets and down for small screens.
  double rf() {
    final width = ScreenUtil().screenWidth;

    if (width >= 900) {
      // Large tablets or small TVs
      return this * 1.4;
    } else if (width >= 600) {
      // Tablets
      return this * 1.3;
    } else if (width >= 400) {
      // Mid-size phones
      return toDouble();
    } else {
      // Very small devices
      return this * 0.9;
    }
  }

  bool isTablet() {
    final width = ScreenUtil().screenWidth;
    return width >= 600 && width < 1200;
  }
}
