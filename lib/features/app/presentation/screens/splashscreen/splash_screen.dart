import 'package:cine_shelf/core/constants/route_constants.dart';
import 'package:cine_shelf/presentation/common/custom_image_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPage({super.key});
  var loaded = false;
  @override
  Widget build(BuildContext context) {
    if (!loaded) {
      loaded = true;
      Future.delayed(Duration(seconds: 1), () {
        context.go(routeAccount);
      });
    }
    return Scaffold(
      body: Stack(
        children: [
          CustomImageView(
            imageRes: "splash_bg.png",
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: Colors.grey.shade300,
                  period: Duration(seconds: 3),
                  child: Text(
                    "app_name".tr(),
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 60.0,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.grey,
                          blurRadius: 44.0,
                          offset: Offset(3, 3),
                        ),
                      ],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
