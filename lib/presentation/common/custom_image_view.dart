import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_shelf/core/utils/resource_helper.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomImageView extends StatelessWidget {
  final String imageRes;

  BoxFit? fit;
  double? height;
  double? width;

  CustomImageView({
    super.key,
    required this.imageRes,
    this.fit = BoxFit.fill,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    if (imageRes.contains("http") || imageRes.contains("https")) {
      return CachedNetworkImage(
        imageUrl: imageRes,
        height: height,
        width: width,
        fadeInDuration: Duration(milliseconds: 600),
        placeholder: (context, url) {
          return Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.grey,
            child: SizedBox(height: height ?? 500, width: width ?? 500),
          );
        },
        fit: fit,
      );
    } else {
      return Image.asset(
        ResourceHelper.getImagePath(imageRes),
        fit: fit,
        height: height,
        width: width,
      );
    }
  }
}
