import 'package:cine_shelf/core/constants/id_constants.dart';
import 'package:cine_shelf/core/constants/route_constants.dart';
import 'package:cine_shelf/core/extensions/responsive_util.dart';
import 'package:cine_shelf/core/utils/input_validators/input_validators.dart';
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
  final _formKey = GlobalKey<FormState>();
  LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Builder(
          builder: (_) {
            void onFormValuChanged(String id, String value) {
              //TODO Update form value change in viewmodel
            }

            return Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      tileMode: TileMode.clamp,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Theme.of(context).canvasColor,

                        Theme.of(context).primaryColor,
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50.r),
                  decoration: BoxDecoration(color: Colors.black.withAlpha(100)),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          VerticalSpacer(height: 120),
                          Shimmer.fromColors(
                            baseColor: Colors.white,
                            highlightColor: Colors.grey,
                            period: Duration(seconds: 12),
                            child: Text(
                              "app_name".tr(),
                              style: Theme.of(context).textTheme.displayLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 32.rf(),
                                  ),
                            ),
                          ),
                          VerticalSpacer(height: 32),
                          Text(
                            "general.text_login".tr(),
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 28.rf(),
                                ),
                          ).tr(),
                          VerticalSpacer(height: 50),
                          CustomTextInput(
                            id: idLoginEmail,
                            label: "general.email".tr(),
                            hint: "general.hint_email".tr(),
                            onValueChanged: onFormValuChanged,
                            inputValidator: InputValidators.emailValidator,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            backgroundColor: Colors.white.withAlpha(40),
                            textStyle: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: Colors.white,
                                  fontSize: 12.rf(),
                                ),
                          ),
                          VerticalSpacer(height: 22),
                          CustomTextInput(
                            id: idLoginPassword,
                            label: "general.password".tr(),
                            hint: "general.hint_password".tr(),
                            inputType: TextInputType.visiblePassword,
                            inputValidator: InputValidators.passwordValidator,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            onValueChanged: onFormValuChanged,
                            backgroundColor: Colors.white.withAlpha(40),
                            textStyle: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: Colors.white,
                                  fontSize: 12.rf(),
                                ),
                          ),
                          VerticalSpacer(height: 32),
                          SizedBox(
                            width: double.infinity,
                            child: CustomElevatedButton(
                              textStyle: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    fontSize: 12.rf(),
                                    color: Colors.white,
                                  ),
                              bgColor: Colors.white.withAlpha(80),
                              loading: false, //todo implement loading state
                              title: "general.text_login".tr(),
                              verticalPadding: 12,
                              onPressed: () {
                                if (_formKey.currentState?.validate() == true) {
                                  //todo implement login functionality
                                }
                              },
                            ),
                          ),
                          VerticalSpacer(height: 12),
                          CustomTextButton(
                            title: "general.text_signup".tr(),
                            textColor: Colors.white,
                            onClicked: () async {
                              final result = await context.push(routeRegister);
                              if (result == true) {
                                context.pop();
                              }
                            },
                          ),
                          VerticalSpacer(),
                          CustomTextButton(
                            title: "general.text_close".tr(),
                            textColor: Colors.white,
                            onClicked: () {
                              context.pop();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
