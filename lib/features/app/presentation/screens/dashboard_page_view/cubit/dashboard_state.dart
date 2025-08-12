part of 'dashboard_cubit.dart';

const defaultNavItems = [
  {'label': 'bottom_nav.home', "id": "home", "route": routeHome},
  {
    'label': 'bottom_nav.favourites',
    "id": "favourties",
    "route": routeFavourites,
  },
  {'label': 'bottom_nav.settings', "id": "settings", "route": routeSettings},
];

@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(false) bool isLoading,
    @Default("") String? selectedBottomNavId,
    @Default(defaultNavItems) List<Map<String, dynamic>> navItems,
  }) = _DashboardState;
}
