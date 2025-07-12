import 'package:cine_shelf/core/di/injection.dart';
import 'package:cine_shelf/core/utils/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: ".env");
  configureInjection(kReleaseMode ? "Release" : "Dev");
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale("he", "IL")],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      enableScaleText: () {
        return true;
      },
      enableScaleWH: () {
        return true;
      },
      builder: (context, child) => MaterialApp.router(
        routerConfig: AppRouter.router,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
      ),
    );
  }
}
