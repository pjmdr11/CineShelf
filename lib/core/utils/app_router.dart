import 'package:cine_shelf/core/constants/route_constants.dart';
import 'package:cine_shelf/features/auth/presentation/screens/accounts/accounts_page.dart';
import 'package:cine_shelf/features/app/presentation/screens/dashboard_page_view/dashboard_page_view.dart';
import 'package:cine_shelf/features/favourite_content/presentation/screens/favourites/favourites_page.dart';
import 'package:cine_shelf/features/movies/presentation/screens/home/home.dart';
import 'package:cine_shelf/features/auth/presentation/screens/login_page/login_page.dart';
import 'package:cine_shelf/features/auth/presentation/screens/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: routeDefault,
        builder: (BuildContext context, GoRouterState state) => LoginPageView(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => DashboardPageView(child: child),
        routes: [
          GoRoute(
            path: routeHome,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: HomePageView()),
          ),
          GoRoute(
            path: routeFavourites,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: FavouritesPage()),
          ),
          GoRoute(
            path: routeAccount,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: AccountsPage()),
          ),
        ],
      ),
      GoRoute(path: routeLogin, builder: (context, state) => LoginPageView()),
      GoRoute(
        path: routeRegister,
        builder: (context, state) => RegisterPageView(),
      ),
    ],
  );
}
