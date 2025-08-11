import 'package:cine_shelf/core/constants/route_constants.dart';
import 'package:cine_shelf/features/app/presentation/provider/splash_screen/splashscreen_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreenNotifier extends StateNotifier<SplashScreenState> {
  SplashScreenNotifier() : super(const SplashScreenState.initial()) {
    initialize();
  }

  void initialize() async {
    await Future.delayed(
      kReleaseMode ? Duration(seconds: 2) : Duration(milliseconds: 500),
    );
    state = SplashScreenState.success(routeHome);
  }
}
