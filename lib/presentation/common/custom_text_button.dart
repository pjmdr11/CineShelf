import 'package:cine_shelf/core/extensions/responsive_util.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final Function() onClicked;
  final Color? textColor;
  const CustomTextButton({
    super.key,
    required this.title,
    required this.onClicked,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClicked,
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
        ),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: textColor ?? Theme.of(context).textTheme.bodyLarge?.color,
          fontSize: 12.rf(),
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
