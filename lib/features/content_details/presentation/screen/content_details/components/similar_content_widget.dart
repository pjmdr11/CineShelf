import 'package:cine_shelf/core/constants/api_constants.dart';
import 'package:cine_shelf/core/constants/app_constants.dart';
import 'package:cine_shelf/core/constants/route_constants.dart';
import 'package:cine_shelf/core/extensions/responsive_util.dart';
import 'package:cine_shelf/features/movie_home/data/models/content_item.dart';
import 'package:cine_shelf/presentation/common/custom_image_view.dart';
import 'package:cine_shelf/presentation/common/spacers/spacer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class SimilarContentWidget extends StatelessWidget {
  final ContentItem item;
  const SimilarContentWidget({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    final isLoading = false;
    final isSuccess = false;
    final contentType = ContentType.Movie;
    return () {
      if (isLoading) {
        return SimilarContentLoader();
      }
      if (isSuccess) {
        final List<ContentItem> lists = [];
        if (lists.isEmpty) {
          return Container();
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contentType == ContentType.Movie
                  ? "general.text_similar_movies".tr()
                  : "general.text_similar_tv_series".tr(),
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            VerticalSpacer(height: 12),
            SizedBox(
              height: 200.r,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final ContentItem item = lists[index];
                  final title = item.title ?? (item.name ?? "");
                  final posterUrl = "$imageRoute${item.posterPath}";
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          context.push(routeContentDetails, extra: item);
                        },
                        child: CustomImageView(
                          imageRes: posterUrl,
                          height: 160.r,
                          width: 110.r,
                          cornerRadius: 12,
                        ),
                      ),
                      VerticalSpacer(),
                      SizedBox(
                        width: 110.r,
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(fontSize: 11.rf()),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return HorizontalSpacer(width: 16);
                },
                itemCount: lists.length,
              ),
            ),
          ],
        );
      }
      return Container();
    }();
  }
}

class SimilarContentLoader extends StatelessWidget {
  const SimilarContentLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).canvasColor,
      highlightColor: Theme.of(context).cardColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 20.h,
            width: 120.w,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          VerticalSpacer(),
          SizedBox(
            height: 110.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(20, (index) {
                return Container(
                  height: 90.h,
                  width: 160.w,
                  margin: EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
