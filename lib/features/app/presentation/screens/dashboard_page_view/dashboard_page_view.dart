import 'package:cine_shelf/core/di/injection.dart';
import 'package:cine_shelf/features/app/presentation/screens/dashboard_page_view/components/bottom_nav_bar.dart';
import 'package:cine_shelf/features/app/presentation/screens/dashboard_page_view/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPageView extends StatelessWidget {
  final Widget child;
  const DashboardPageView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<DashboardCubit>(create: (context) => getIt())],
      child: Scaffold(body: child, bottomNavigationBar: BottomNavBar()),
    );
  }
}
