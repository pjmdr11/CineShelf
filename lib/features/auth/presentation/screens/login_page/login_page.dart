import 'package:cine_shelf/core/constants/id_constants.dart';
import 'package:cine_shelf/core/constants/route_constants.dart';
import 'package:cine_shelf/core/utils/resource_helper.dart';
import 'package:cine_shelf/presentation/common/custom_elevated_button.dart';
import 'package:cine_shelf/presentation/common/custom_text_button.dart';
import 'package:cine_shelf/presentation/common/custom_text_input.dart';
import 'package:cine_shelf/presentation/common/spacers/spacer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(ResourceHelper.getImagePath("login_bg.jpg")),
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          decoration: BoxDecoration(color: Colors.black.withAlpha(100)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VerticalSpacer(height: 110.h.toInt()),
              Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: Colors.grey,
                period: Duration(seconds: 12),
                child: Text(
                  "app_name".tr(),
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              VerticalSpacer(height: 32),
              Text(
                "general.text_login".tr(),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ).tr(),
              VerticalSpacer(height: 50),
              CustomTextInput(
                id: idLoginEmail,
                label: "general.email".tr(),
                hint: "general.hint_email".tr(),
                onValueChanged: (id, value) {},
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
                backgroundColor: Colors.white.withAlpha(40),
                textStyle: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
              VerticalSpacer(height: 22),
              CustomTextInput(
                id: idLoginPassword,
                label: "general.password".tr(),
                hint: "general.hint_password".tr(),
                inputType: TextInputType.visiblePassword,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
                onValueChanged: (id, value) {},
                backgroundColor: Colors.white.withAlpha(40),
                textStyle: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
              VerticalSpacer(height: 32),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  bgColor: Colors.white.withAlpha(80),
                  title: "general.text_login".tr(),
                  onPressed: () {},
                ),
              ),
              VerticalSpacer(height: 12),
              CustomTextButton(
                title: "general.text_signup".tr(),
                onClicked: () {
                  context.push(routeRegister);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
