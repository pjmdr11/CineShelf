import 'package:cine_shelf/core/extensions/responsive_util.dart';
import 'package:cine_shelf/presentation/common/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  Color? bgColor;
  String? title;
  Function()? onPressed;
  late double border;
  TextStyle? textStyle;
  late Color titleColor;
  late int horizontalPadding;
  late int verticalPadding;
  late bool loading;
  bool enabled = true;
  bool primary;

  CustomElevatedButton({
    Key? key,
    @required this.title,
    @required this.onPressed,
    this.bgColor,
    this.titleColor = Colors.white,
    this.horizontalPadding = 16,
    this.verticalPadding = 8,
    this.loading = false,
    this.primary = true,
    this.enabled = true,
    this.border = 8.0,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var buttonBgColor =
        bgColor ?? Theme.of(context).buttonTheme.colorScheme?.primary;
    var buttonTextStyle =
        textStyle ??
        Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).textTheme.bodyLarge?.color,
          fontSize: 12.rf(),
        );
    if (loading) {
      verticalPadding = 2;
    }
    var style = ButtonStyle(
      padding: WidgetStateProperty.all(
        EdgeInsets.symmetric(
          horizontal: horizontalPadding.r,
          vertical: verticalPadding.r,
        ),
      ),
      backgroundColor: WidgetStateProperty.all(buttonBgColor),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
      ),
    );
    if (!primary) {
      buttonTextStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: Theme.of(context).buttonTheme.colorScheme?.primary,
      );
      style = ButtonStyle(
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding.r,
            vertical: verticalPadding.r,
          ),
        ),
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
            side: BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      );
    }
    return ElevatedButton(
      onPressed: () {
        if (loading) return;
        if (!enabled) return;
        onPressed!();
      },
      style: style,
      child: (loading)
          ? CustomLoader(color: titleColor, size: 20)
          : Text(title ?? "", style: buttonTextStyle),
    );
  }
}
