import 'package:cine_shelf/core/extensions/responsive_util.dart';
import 'package:cine_shelf/features/app/presentation/provider/app_state_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(dashboardNotifierProvider);
    final bottomNavitems = dashboardState.bottomNavItems;
    final location = GoRouter.of(context).state.fullPath ?? "";
    final bottomNavByCurrentLocation = bottomNavitems.firstWhere((item) {
      return item["route"] == location;
    }, orElse: () => {});
    final selectedPosition = bottomNavByCurrentLocation.containsKey("index")
        ? bottomNavByCurrentLocation["index"]
        : dashboardState.bottomPageIndex;
    return BottomNavigationBar(
      currentIndex: selectedPosition,
      selectedItemColor: Theme.of(context).bottomAppBarTheme.color,
      unselectedItemColor: Theme.of(context).disabledColor,
      selectedFontSize: 12.rf(),
      unselectedFontSize: 12.rf(),
      onTap: (value) {
        ref.read(dashboardNotifierProvider.notifier).setNavPosition(value);
        context.go(bottomNavitems[value]["route"]);
      },
      items: List.generate(bottomNavitems.length, (index) {
        final bottomNavItem = bottomNavitems[index];
        final label = bottomNavItem["label"];
        return BottomNavigationBarItem(
          label: "$label".tr(),
          icon: Icon(getIcon(index), size: 26.r),
        );
      }),
    );
  }

  IconData getIcon(int index) {
    switch (index) {
      case 0:
        return Icons.home_max_outlined;
      case 1:
        return Icons.favorite;
      default:
        return Icons.settings_applications;
    }
  }
}
