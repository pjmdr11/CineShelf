import 'package:cine_shelf/features/app/presentation/provider/app/app_notifier.dart';
import 'package:cine_shelf/features/app/presentation/provider/app/app_state.dart';
import 'package:cine_shelf/features/app/presentation/provider/dashboard/dashboard_notifier.dart';
import 'package:cine_shelf/features/app/presentation/provider/dashboard/dashboard_state.dart';
import 'package:cine_shelf/features/app/presentation/provider/splash_screen/splash_notifier.dart';
import 'package:cine_shelf/features/app/presentation/provider/splash_screen/splashscreen_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashScreenNotifierProvider =
    AutoDisposeStateNotifierProvider<SplashScreenNotifier, SplashScreenState>(
      (ref) => SplashScreenNotifier(),
    );

final dashboardNotifierProvider =
    AutoDisposeStateNotifierProvider<DashboardNotifier, DashboardState>(
      (ref) => DashboardNotifier(),
    );

final appStateNotifierProvider =
    AutoDisposeStateNotifierProvider<AppNotifier, AppState>(
      (ref) => AppNotifier(),
    );
