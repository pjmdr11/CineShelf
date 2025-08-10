import 'package:cine_shelf/core/constants/api_constants.dart';
import 'package:cine_shelf/core/constants/app_constants.dart';
import 'package:cine_shelf/core/constants/id_constants.dart';
import 'package:cine_shelf/core/extensions/responsive_util.dart';
import 'package:cine_shelf/core/utils/log_utils.dart';
import 'package:cine_shelf/core/utils/screen_utils.dart';
import 'package:cine_shelf/domain/entities/data_state.dart';
import 'package:cine_shelf/features/content_details/data/models/movie_detail.dart';
import 'package:cine_shelf/features/content_details/presentation/screen/content_details/components/cast_list_widget.dart';
import 'package:cine_shelf/features/content_details/presentation/screen/content_details/components/favourite_content_widget.dart';
import 'package:cine_shelf/features/content_details/presentation/screen/content_details/components/similar_content_widget.dart';
import 'package:cine_shelf/features/movie_home/data/models/content_item.dart';
import 'package:cine_shelf/presentation/common/custom_image_view.dart';
import 'package:cine_shelf/presentation/common/spacers/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ContentDetailsPage extends StatefulWidget {
  final ContentItem item;
  const ContentDetailsPage({super.key, required this.item});
  @override
  State<ContentDetailsPage> createState() => _ContentDetailsPageState();
}

class _ContentDetailsPageState extends State<ContentDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final contentItem = widget.item;
    LogUtils.log("CONTENT_DETAIL_ID", contentItem.id);
    final String backDrop = "$imageRoute${contentItem.backdropPath}";
    final String posterPath = "$imageRoute${contentItem.posterPath}";
    final movieTitle = contentItem.title ?? (contentItem.name ?? "");
    final contentId = contentItem.id ?? 0;
    final description = contentItem.overview ?? "";

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          contentDetailAppBar(
            widget.item,
            movieTitle,
            context,
            backDrop,
            contentId,
            posterPath,
          ),
          SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.r, vertical: 0),
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Text(
                      description,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(fontSize: 12.rf()),
                    ),
                    CastListsWidget(item: widget.item),
                    SimilarContentWidget(item: widget.item),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar contentDetailAppBar(
    ContentItem item,
    String movieTitle,
    BuildContext context,
    String backDrop,
    int contentId,
    String posterPath,
  ) {
    final isLoading = false;
    return SliverAppBar(
      expandedHeight: ScreenUtils.isTablet(context) ? 350.r : 310.r,
      snap: false,
      floating: true,
      pinned: true,
      centerTitle: false,
      toolbarHeight: kToolbarHeight.h,
      actions: [FavouriteContentWidget(contentItem: widget.item)],
      title: Text(
        movieTitle,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(fontSize: 18.rf()),
      ),
      titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Stack(
          children: [
            CustomImageView(
              imageRes: backDrop,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300.r,
            ),
            Container(
              color: Theme.of(context).canvasColor.withAlpha(120),
              height: 300.r,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(16.r),

              child: SizedBox(
                height: ScreenUtils.isTablet(context) ? 240.r : 180.r,
                child: Row(
                  children: [
                    Hero(
                      tag: "HERO_${widget.item.id}",
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: CustomImageView(
                          imageRes: posterPath,
                          cornerRadius: 18,
                          height: ScreenUtils.isTablet(context) ? 240.r : 180.r,
                        ),
                      ),
                    ),
                    HorizontalSpacer(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movieTitle,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.rf(),
                                  ),
                            ),
                            VerticalSpacer(height: 4),
                            (isLoading)
                                ? Shimmer.fromColors(
                                    baseColor: Colors.grey,
                                    highlightColor: Colors.white,
                                    child: Container(
                                      height: 12.r,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).canvasColor,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  )
                                : genreWidget(null, ContentType.Movie),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget genreWidget(DataState? result, ContentType? contentType) {
    final data = result?.data[idContentDetail];
    final List<Genre>? genres = data.genres;
    if (genres?.isEmpty == true) {
      return Container(height: 12.h);
    } else {
      return SizedBox(
        width: double.maxFinite,
        height: 12.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final genreItem = genres![index];
            return Text(
              genreItem.name ?? "",
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(fontSize: 11.rf()),
            );
          },
          separatorBuilder: (context, index) {
            return Text(" º ");
          },
          itemCount: genres?.length ?? 0,
        ),
      );
    }
  }
}
