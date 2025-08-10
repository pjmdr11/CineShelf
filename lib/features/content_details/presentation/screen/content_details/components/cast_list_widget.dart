import 'package:cine_shelf/core/constants/api_constants.dart';
import 'package:cine_shelf/core/constants/route_constants.dart';
import 'package:cine_shelf/core/extensions/responsive_util.dart';
import 'package:cine_shelf/features/content_details/data/models/casts_response_model.dart';
import 'package:cine_shelf/features/movie_home/data/models/content_item.dart';
import 'package:cine_shelf/presentation/common/custom_image_view.dart';
import 'package:cine_shelf/presentation/common/spacers/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class CastListsWidget extends StatelessWidget {
  final ContentItem item;
  const CastListsWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final isLoading = false;
    final isSuccess = false;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      child: () {
        // if (true) return castLoader(context);
        if (isLoading) {
          return castLoader(context);
        }
        if (isSuccess) {
          final CastsResponseModel castModel = CastsResponseModel.fromJson({});
          final castLists = castModel.cast;
          if (castLists?.isNotEmpty == true) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Casts",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                VerticalSpacer(),
                SizedBox(
                  height: 126.r,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CastItemWidget(castModel: castLists![index]);
                    },
                    separatorBuilder: (context, index) {
                      return HorizontalSpacer(width: 12);
                    },
                    itemCount: castLists?.length ?? 0,
                  ),
                ),
              ],
            );
          }
        }
        return Container();
      }(),
    );
  }

  Shimmer castLoader(BuildContext context) {
    final contentSize = 70.w;
    return Shimmer.fromColors(
      baseColor: Theme.of(context).canvasColor,
      highlightColor: Theme.of(context).cardColor,
      child: SizedBox(
        height: 120.r,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(50, (_) {
            return Column(
              children: [
                Container(
                  height: contentSize,
                  width: contentSize,
                  margin: EdgeInsetsDirectional.only(end: 12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).canvasColor,
                  ),
                ),
                VerticalSpacer(),
                Container(width: 50.w, color: Colors.grey),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class CastItemWidget extends StatelessWidget {
  const CastItemWidget({super.key, required this.castModel});

  final Cast? castModel;

  @override
  Widget build(BuildContext context) {
    final castTitle = castModel?.name ?? "";
    final castThumbnail = "$imageRoute${castModel?.profilePath ?? ""}";
    return SizedBox(
      width: 90.r,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(200),
            onTap: () {
              context.push(routeContentByCast, extra: castModel);
            },
            child: CustomImageView(
              imageRes: castThumbnail,
              height: 90.r,
              width: 90.r,
              fit: BoxFit.cover,
              cornerRadius: 200,
            ),
          ),
          VerticalSpacer(height: 6),
          Text(
            castTitle,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontSize: 11.rf()),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
