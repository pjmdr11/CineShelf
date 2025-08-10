import 'package:flutter/material.dart';

class DashboardPageView extends StatelessWidget {
  final Widget child;
  const DashboardPageView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: child);
  }
}
