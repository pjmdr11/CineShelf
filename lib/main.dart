import 'dart:ui';

import 'package:cine_shelf/core/di/injection.dart';
import 'package:cine_shelf/core/extensions/string_utils.dart';
import 'package:cine_shelf/core/theme/app_theme.dart';
import 'package:cine_shelf/core/utils/app_router.dart';
import 'package:cine_shelf/features/app/presentation/provider/app_state_provider.dart';
import 'package:cine_shelf/firebase_options.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: ".env");
  configureInjection(kReleaseMode ? "prod" : "dev");
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  getIt.allReady().then(
    (value) => runApp(
      DevicePreview(
        enabled: kIsWeb && kDebugMode,
        tools: const [...DevicePreview.defaultTools],
        builder: (context) => EasyLocalization(
          supportedLocales: [
            Locale('en', 'US'),
            Locale("he", "IL"),
            Locale("hi", "IN"),
          ],
          path: 'assets/translations',
          fallbackLocale: Locale('en', 'US'),
          child: const ProviderScope(child: MyApp()),
        ),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref
        .read(appStateNotifierProvider.notifier)
        .setLocaleValue(context.locale.toString());
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      builder: (context, child) {
        ScreenUtil.ensureScreenSize();
        ScreenUtil.configure(data: MediaQuery.of(context));
        return MaterialApp.router(
          scrollBehavior: MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.stylus,
              PointerDeviceKind.unknown,
            },
          ),
          routerConfig: AppRouter.router,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getlightTheme(context),
          themeMode: ref
              .watch(appStateNotifierProvider)
              .appTheme
              .getAppThemeMode(),
          darkTheme: AppTheme.getDarkTheme(context),
        );
      },
    );
  }
}
