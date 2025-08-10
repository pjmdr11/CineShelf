import 'dart:ui';

import 'package:cine_shelf/core/di/injection.dart';
import 'package:cine_shelf/core/theme/app_theme.dart';
import 'package:cine_shelf/core/utils/app_router.dart';
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
          supportedLocales: [Locale('en'), Locale('hi'), Locale('he')],
          path: 'assets/translations',
          fallbackLocale: Locale('en'),
          child: const ProviderScope(child: MyApp()),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
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
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: AppTheme.getlightTheme(context),
          darkTheme: AppTheme.getDarkTheme(context),
        );
      },
    );
  }
}
