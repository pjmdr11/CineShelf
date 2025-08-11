import 'package:cine_shelf/core/constants/route_constants.dart';
import 'package:cine_shelf/features/app/presentation/provider/dashboard/dashboard_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardNotifier extends StateNotifier<DashboardState> {
  DashboardNotifier() : super(const DashboardState()) {
    state = state.copyWith(isLoading: true);
    final bottomNavItems = [
      {"label": "bottom_nav.home", "index": 0, "route": routeHome},
      {"label": "bottom_nav.favourites", "index": 1, "route": routeFavourites},
      {"label": "bottom_nav.settings", "index": 2, "route": routeSettings},
    ];
    final initialIndex = 0;
    state = state.copyWith(
      isLoading: false,
      bottomNavItems: bottomNavItems,
      appBarTitle: bottomNavItems[initialIndex]["label"].toString(),
      bottomPageIndex: initialIndex,
    );
  }

  void setNavPosition(int position) {
    state = state.copyWith(
      bottomPageIndex: position,
      appBarTitle: state.bottomNavItems[position]["label"].toString(),
    );
  }
}
