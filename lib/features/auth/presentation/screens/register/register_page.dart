import 'package:cine_shelf/core/constants/id_constants.dart';
import 'package:cine_shelf/core/extensions/responsive_util.dart';
import 'package:cine_shelf/core/utils/input_validators/input_validators.dart';
import 'package:cine_shelf/core/utils/resource_helper.dart';
import 'package:cine_shelf/presentation/common/custom_elevated_button.dart';
import 'package:cine_shelf/presentation/common/custom_text_button.dart';
import 'package:cine_shelf/presentation/common/custom_text_input.dart';
import 'package:cine_shelf/presentation/common/slide_up_animation_widget.dart';
import 'package:cine_shelf/presentation/common/spacers/spacer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterPageView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  RegisterPageView({super.key});

  @override
  Widget build(BuildContext context) {
    void onInputValueChanged(String id, String value) {
      //todo updateb form value change in viewmodel
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SizedBox.expand(
        // 👈 Ensures Stack fills the full screen
        child: Stack(
          children: [
            /// ✅ Full-screen background
            Positioned.fill(
              child: Image.asset(
                ResourceHelper.getImagePath("login_bg.png"),
                fit: BoxFit.fill,
              ),
            ),

            Container(color: Colors.black.withAlpha(100)),
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      VerticalSpacer(height: 20.h.toInt()),
                      SlideUpAnimationWidget(
                        child: Text(
                          "general.text_register".tr(),
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      VerticalSpacer(height: 20),
                      SlideUpAnimationWidget(
                        child: CustomTextInput(
                          id: idRegistrationEmail,
                          label: "general.email".tr(),
                          hint: "general.hint_email".tr(),
                          initialvalue: "", //todo get Initial value from state,
                          onValueChanged: (id, value) => onInputValueChanged,
                          inputValidator: InputValidators.emailValidator,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          backgroundColor: Colors.white.withAlpha(40),
                          textStyle: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                        ),
                      ),
                      VerticalSpacer(height: 22),
                      SlideUpAnimationWidget(
                        child: CustomTextInput(
                          id: idLoginPassword,
                          label: "general.password".tr(),
                          hint: "general.hint_password".tr(),
                          initialvalue: "", //todo get Initial value from state,
                          inputType: TextInputType.visiblePassword,
                          inputValidator: InputValidators.passwordValidator,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          onValueChanged: (id, value) => onInputValueChanged,
                          backgroundColor: Colors.white.withAlpha(40),
                          textStyle: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                        ),
                      ),
                      VerticalSpacer(height: 22),
                      SlideUpAnimationWidget(
                        child: CustomTextInput(
                          id: idRegistrationName,
                          label: "general.username".tr(),
                          hint: "general.hint_username".tr(),
                          initialvalue: "", //todo get Initial value from state,
                          onValueChanged: (id, value) => onInputValueChanged,
                          required: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          backgroundColor: Colors.white.withAlpha(40),
                          textStyle: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                        ),
                      ),
                      VerticalSpacer(height: 22),
                      SlideUpAnimationWidget(
                        child: CustomTextInput(
                          id: idRegistrationPhone,
                          label: "general.text_phone".tr(),
                          hint: "general.text_phone".tr(),
                          initialvalue: "", //todo get Initial value from state,
                          onValueChanged: (id, value) => onInputValueChanged,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          backgroundColor: Colors.white.withAlpha(40),
                          textStyle: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                        ),
                      ),
                      VerticalSpacer(height: 22),
                      SlideUpAnimationWidget(
                        child: CustomTextInput(
                          id: idRegistrationAddress,
                          label: "general.text_address".tr(),
                          hint: "general.text_hint_address".tr(),
                          initialvalue: "", //todo get Initial value from state,
                          onValueChanged: (id, value) => onInputValueChanged,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          backgroundColor: Colors.white.withAlpha(40),
                          textStyle: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                        ),
                      ),
                      VerticalSpacer(height: 32),
                      SlideUpAnimationWidget(
                        child: SizedBox(
                          width: double.infinity,
                          child: CustomElevatedButton(
                            loading: false, //todo implement loading state
                            verticalPadding: 12,
                            textStyle: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  fontSize: 12.rf(),
                                  color: Colors.white,
                                ),
                            bgColor: Colors.white.withAlpha(100),
                            title: "general.text_register".tr(),
                            onPressed: () {
                              if (_formKey.currentState?.validate() == true) {
                                //todo implement register functionality
                              }
                            },
                          ),
                        ),
                      ),
                      VerticalSpacer(height: 10),
                      SlideUpAnimationWidget(
                        child: CustomTextButton(
                          title: "general.text_go_back".tr(),
                          textColor: Colors.white,
                          onClicked: () {
                            context.pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
