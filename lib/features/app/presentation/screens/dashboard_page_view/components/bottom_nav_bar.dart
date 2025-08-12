import 'package:cine_shelf/core/di/injection.dart';
import 'package:cine_shelf/core/extensions/responsive_util.dart';
import 'package:cine_shelf/features/app/presentation/screens/dashboard_page_view/cubit/dashboard_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      listenWhen: (s1, s2) {
        return s1 != s2;
      },
      builder: (context, state) {
        final bottomNavItems = state.navItems;

        final currentRoute = GoRouterState.of(context).uri.toString();
        var selectedIndex = bottomNavItems.indexWhere(
          (item) => currentRoute.startsWith(item['route']),
        );
        if (selectedIndex < 0) {
          selectedIndex = bottomNavItems.indexWhere(
            (item) => item['id'] == state.selectedBottomNavId,
          );
        }
        if (selectedIndex < 0) selectedIndex = 0;
        return BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedItemColor: Theme.of(context).bottomAppBarTheme.color,
          unselectedItemColor: Theme.of(context).disabledColor,
          selectedFontSize: 12.rf(),
          unselectedFontSize: 12.rf(),
          onTap: (value) {
            getIt<DashboardCubit>().setNavPosition(value);
            context.go(bottomNavItems[value]["route"]);
          },
          items: List.generate(bottomNavItems.length, (index) {
            final bottomNavItem = bottomNavItems[index];
            return BottomNavigationBarItem(
              label: bottomNavItem["label"].toString().tr(),
              icon: Icon(getIcon(index), size: 26.r),
            );
          }),
        );
      },
      listener: (context, state) {
        // Handle any state changes if necessary
      },
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
