import 'package:cine_shelf/core/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ContentByCastLoader extends StatelessWidget {
  const ContentByCastLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 300,
        crossAxisCount: ScreenUtils.isTablet(context) ? 3 : 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      children: List.generate(20, (index) {
        return Shimmer.fromColors(
          baseColor: Theme.of(context).canvasColor,
          highlightColor: Theme.of(context).cardColor,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey,
            ),
          ),
        );
      }),
    );
  }
}
