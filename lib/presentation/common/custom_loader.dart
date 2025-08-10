import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoader extends StatelessWidget {
  final int size;
  final Color? color;
  const CustomLoader({this.size = 40, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      color: color ?? Theme.of(context).primaryColor,
      size: size.toDouble(),
    );
  }
}
