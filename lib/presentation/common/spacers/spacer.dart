import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalSpacer extends StatelessWidget {
  final int? height;
  const VerticalSpacer({super.key, this.height = 8});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: double.parse(height.toString()).r);
  }
}

class HorizontalSpacer extends StatelessWidget {
  final int? width;
  const HorizontalSpacer({super.key, this.width = 8});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.parse(width.toString()).w);
  }
}
