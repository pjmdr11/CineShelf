import 'package:cine_shelf/core/constants/api_constants.dart';
import 'package:cine_shelf/core/constants/route_constants.dart';
import 'package:cine_shelf/core/extensions/responsive_util.dart';
import 'package:cine_shelf/features/movie_home/data/models/content_item.dart';
import 'package:cine_shelf/presentation/common/custom_image_view.dart';
import 'package:cine_shelf/presentation/common/spacers/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class ContentSectionRow extends StatelessWidget {
  const ContentSectionRow({
    super.key,
    required this.viewType,
    required this.item,
  });

  final String viewType;
  final List<ContentItem> item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        VerticalSpacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            viewType,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        VerticalSpacer(),
        SizedBox(
          height: 198.h,
          child: ListView.separated(
            key: PageStorageKey("ContentSectionRow_$viewType"),
            itemCount: item.length,
            padding: EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (ctx, i) {
              return SizedBox(width: 12.w);
            },
            itemBuilder: (context, i) {
              final ContentItem contentItem = item[i];

              return ContentItemWidget(contentItem: contentItem);
            },
          ),
        ),
      ],
    );
  }
}

class ContentItemWidget extends StatelessWidget {
  const ContentItemWidget({super.key, required this.contentItem});

  final ContentItem contentItem;

  @override
  Widget build(BuildContext context) {
    final backdropImage = contentItem.posterPath ?? "";
    final imageUrl = "$imageRoute$backdropImage";
    final title = contentItem.title ?? (contentItem.name ?? "");
    return Hero(
      tag: "HERO_${contentItem.id}",
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            context.push(routeContentDetails, extra: contentItem);
          },
          child: Column(
            children: [
              CustomImageView(
                imageRes: imageUrl,
                cornerRadius: 12,
                placeHolder: Shimmer.fromColors(
                  direction: ShimmerDirection.ltr,
                  baseColor: Theme.of(context).canvasColor,
                  highlightColor: Theme.of(context).disabledColor,
                  child: Container(
                    color: Theme.of(context).canvasColor,
                    width: 90.w,
                    child: Center(child: Text(title)),
                  ),
                ),
                height: 160.r,
                width: 110.r,
              ),
              VerticalSpacer(),
              SizedBox(
                width: 80.r,
                child: Text(
                  title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.labelMedium?.copyWith(fontSize: 11.rf()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
