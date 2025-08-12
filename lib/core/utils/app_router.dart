import 'package:cine_shelf/core/constants/route_constants.dart';
import 'package:cine_shelf/features/app/presentation/screens/dashboard_page_view/dashboard_page_view.dart';
import 'package:cine_shelf/features/app/presentation/screens/splashscreen/splash_screen.dart';
import 'package:cine_shelf/features/auth/presentation/screens/accounts/accounts_page.dart';
import 'package:cine_shelf/features/auth/presentation/screens/login_page/login_page.dart';
import 'package:cine_shelf/features/auth/presentation/screens/register/register_page.dart';
import 'package:cine_shelf/features/content_by_cast/presentation/screens/contents_by_cast_page.dart';
import 'package:cine_shelf/features/content_details/data/models/casts_response_model.dart';
import 'package:cine_shelf/features/content_details/presentation/screen/content_details/content_details_page.dart';
import 'package:cine_shelf/features/favourite_page/presentation/screens/favourites/favourites_page.dart';
import 'package:cine_shelf/features/movie_home/data/models/content_item.dart';
import 'package:cine_shelf/features/movie_home/presentation/screens/home/movie_home.dart';
import 'package:cine_shelf/features/search/presentation/screen/search_page.dart';
import 'package:cine_shelf/features/settings/screens/settings_page.dart';
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
        builder: (BuildContext context, GoRouterState state) {
          return SplashScreenPage();
        },
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => DashboardPageView(child: child),
        routes: [
          GoRoute(
            path: routeHome,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: MovieHome()),
          ),
          GoRoute(
            path: routeFavourites,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: FavouritesPage()),
          ),
          GoRoute(
            path: routeSettings,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: SettingsPage()),
          ),
        ],
      ),
      GoRoute(path: routeAccount, builder: (context, state) => AccountsPage()),
      GoRoute(path: routeLogin, builder: (context, state) => LoginPageView()),
      GoRoute(
        path: routeContentDetails,
        builder: (context, state) {
          final contentItem = state.extra as ContentItem;
          return ContentDetailsPage(item: contentItem);
        },
      ),
      GoRoute(
        path: routeRegister,
        builder: (context, state) => RegisterPageView(),
      ),
      GoRoute(
        path: routeContentByCast,
        builder: (context, state) {
          final castItem = state.extra as Cast;
          return ContentsByCasts(castItem: castItem);
        },
      ),
      GoRoute(
        path: routeSearch,
        builder: (context, state) {
          return Searchpage();
        },
      ),
    ],
  );
}
