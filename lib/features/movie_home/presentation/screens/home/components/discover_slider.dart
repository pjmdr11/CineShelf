import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cine_shelf/core/constants/api_constants.dart';
import 'package:cine_shelf/core/constants/route_constants.dart';
import 'package:cine_shelf/core/extensions/responsive_util.dart';
import 'package:cine_shelf/core/utils/screen_utils.dart';
import 'package:cine_shelf/features/movie_home/data/models/content_item.dart';
import 'package:cine_shelf/presentation/common/custom_image_view.dart';
import 'package:cine_shelf/presentation/common/spacers/spacer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DiscoverSlider extends StatelessWidget {
  final List<ContentItem> discover;
  const DiscoverSlider({super.key, required this.discover});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: ScreenUtils.isTablet(context) ? 360.r : 300.r,
      snap: false,
      floating: true,
      pinned: true,
      actions: [
        Container(
          padding: EdgeInsets.all(4.r),
          margin: EdgeInsets.only(right: 12.r),
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).appBarTheme.backgroundColor?.withAlpha(100),
            borderRadius: BorderRadius.circular(100),
          ),
          child: InkWell(
            onTap: () {
              context.push(routeSearch);
            },
            child: Icon(Icons.search),
          ),
        ),
      ],
      title: Text(
        "bottom_nav.home".tr(),
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 18.rf(),
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: false,
      titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 10.rf(),
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Stack(
          children: [
            BackDropWidget(discoverItems: discover),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: ScreenUtils.isTablet(context) ? 20.r : 50.r,
                  ),
                  child: CarouselSlider.builder(
                    itemCount: discover.length,
                    itemBuilder:
                        (
                          BuildContext context,
                          int itemIndex,
                          int pageViewIndex,
                        ) {
                          final ContentItem item = discover[itemIndex];
                          final imagePath = "$imageRoute${item.posterPath}";
                          return ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(12),
                            child: InkWell(
                              onTap: () {
                                context.push(routeContentDetails, extra: item);
                              },
                              child: CustomImageView(
                                imageRes: imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                    options: CarouselOptions(
                      autoPlay: true,
                      animateToClosest: true,
                      height: ScreenUtils.isTablet(context) ? 270.r : 210.r,
                      autoPlayInterval: Duration(seconds: 5),
                      onPageChanged: (index, reason) {
                        //todo handle slider change
                      },
                      autoPlayAnimationDuration: Duration(seconds: 1),
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.2,
                      viewportFraction: 0.4,
                      aspectRatio: 16 / 9,
                      initialPage: 0,
                    ),
                  ),
                ),
                VerticalSpacer(),
                SliderTitleWidget(discoverItems: discover),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SliderTitleWidget extends StatelessWidget {
  final List<ContentItem> discoverItems;
  const SliderTitleWidget({super.key, required this.discoverItems});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = 0; //Todo Get Selected Slider Index from state.
    final selectedItem = discoverItems[selectedIndex];
    final title = selectedItem.title ?? (selectedItem.name ?? "");

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 10.sp,
          shadows: [Shadow(color: Colors.black, blurRadius: 12)],
        ),
      ),
    );
  }
}

class BackDropWidget extends StatelessWidget {
  final List<ContentItem> discoverItems;
  const BackDropWidget({super.key, required this.discoverItems});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = 0; //Get Selected Slider Index from state.
    final selectedItem = discoverItems[selectedIndex];
    final backdropImage = selectedItem.backdropPath ?? "";
    final imageUrl = "$imageRoute$backdropImage";
    return Container(
      width: double.infinity,
      height: 360.r,
      decoration: BoxDecoration(color: Colors.black87),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomImageView(imageRes: imageUrl, fit: BoxFit.fitHeight),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 2.0, // horizontal blur strength
              sigmaY: 2.0, // vertical blur strength
            ),
            child: Container(
              color: Colors.black.withAlpha(40), // must have some widget
            ),
          ),
        ],
      ),
    );
  }
}
