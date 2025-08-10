import 'package:cine_shelf/core/extensions/responsive_util.dart';
import 'package:cine_shelf/presentation/common/spacers/spacer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomErrorView extends StatelessWidget {
  IconData? icon;
  String? message;

  CustomErrorView({super.key, this.icon, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon ?? Icons.info, size: 120.r),
            VerticalSpacer(height: 22),
            Text(
              message ?? "error.task_failed".tr(),
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(fontSize: 13.rf()),
            ),
          ],
        ),
      ),
    );
  }
}
