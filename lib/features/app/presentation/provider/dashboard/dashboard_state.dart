import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.freezed.dart';

@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(0) int bottomPageIndex,
    @Default("") String appBarTitle,
    @Default(false) bool isLoading,
    @Default([]) List<Map<String, dynamic>> bottomNavItems,
  }) = _DashboardState;
}
