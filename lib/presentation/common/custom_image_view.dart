import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_shelf/core/utils/resource_helper.dart';
import 'package:flutter/material.dart';

class CustomImageView extends StatelessWidget {
  final String imageRes;

  BoxFit? fit;
  double? height;
  double? width;
  double? cornerRadius;
  Widget? placeHolder;
  Widget? errorWidget;

  CustomImageView({
    super.key,
    required this.imageRes,
    this.fit = BoxFit.fill,
    this.cornerRadius,
    this.height,
    this.width,
    this.errorWidget,
    this.placeHolder,
  });

  @override
  Widget build(BuildContext context) {
    if (imageRes.contains("http") || imageRes.contains("https")) {
      return ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(cornerRadius ?? 0),
        child: CachedNetworkImage(
          imageUrl: imageRes,
          height: height,
          useOldImageOnUrlChange: false,
          fadeInDuration: Duration(milliseconds: 200),
          fadeOutDuration: Duration(milliseconds: 200),
          width: width,
          cacheKey: imageRes,
          errorWidget: (context, url, error) {
            return errorWidget ??
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(
                    cornerRadius ?? 0,
                  ),
                  child: Container(
                    height: height,
                    width: width,
                    color: Theme.of(context).canvasColor,
                  ),
                );
          },
          placeholder: (context, url) =>
              placeHolder ??
              Container(
                height: height,
                width: width,
                color: Theme.of(context).canvasColor,
              ),
          fit: fit,
        ),
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
