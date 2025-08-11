import 'package:cine_shelf/features/app/presentation/screens/dashboard_page_view/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardPageView extends ConsumerWidget {
  final Widget child;
  const DashboardPageView({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(bottomNavigationBar: BottomNavBar(), body: child);
  }
}
