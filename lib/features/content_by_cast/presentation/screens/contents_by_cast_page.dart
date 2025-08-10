import 'package:cine_shelf/core/constants/api_constants.dart';
import 'package:cine_shelf/core/constants/route_constants.dart';
import 'package:cine_shelf/core/extensions/responsive_util.dart';
import 'package:cine_shelf/core/utils/screen_utils.dart';
import 'package:cine_shelf/features/app/presentation/screens/dashboard_page_view/components/app_bar.dart';
import 'package:cine_shelf/features/content_by_cast/presentation/screens/components/content_by_cast_loader.dart';
import 'package:cine_shelf/features/content_details/data/models/casts_response_model.dart';
import 'package:cine_shelf/features/movie_home/data/models/content_item.dart';
import 'package:cine_shelf/presentation/common/custom_image_view.dart';
import 'package:cine_shelf/presentation/common/spacers/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ContentsByCasts extends StatelessWidget {
  final Cast castItem;
  const ContentsByCasts({super.key, required this.castItem});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: castItem.name ?? ""),
      body: SafeArea(
        bottom: true,
        top: false,
        child: Builder(
          builder: (context) {
            final isLoading = false;
            final isError = false;
            final errMessage = "";
            final isSuccess = false;
            if (isLoading) {
              return ContentByCastLoader();
            } else if (isError) {
              return Center(child: Text(errMessage));
            } else if (isSuccess) {
              final castItems = [];
              if (castItems.isNotEmpty == true) {
                return GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 290.r,
                    crossAxisSpacing: 12,
                    crossAxisCount: ScreenUtils.isTablet(context) ? 3 : 2,
                  ),
                  itemCount: castItems.length,
                  itemBuilder: (context, index) {
                    final ContentItem? contentItem = castItems[index];
                    if (contentItem != null) {
                      final posterUrl =
                          "$imageRoute${contentItem.posterPath ?? ""}";
                      final title =
                          contentItem.title ?? (contentItem.name ?? "");
                      return Hero(
                        tag: "HERO_${contentItem.id}",
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              context.push(
                                routeContentDetails,
                                extra: contentItem,
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                  imageRes: posterUrl,
                                  cornerRadius: 12,
                                  height: 260.r,
                                  errorWidget: Container(
                                    height: 260.r,
                                    width: double.infinity,
                                    color: Theme.of(context).canvasColor,
                                  ),
                                ),
                                VerticalSpacer(height: 2),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 12.rf()),
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                );
              } else {}
            }
            return Container();
          },
        ),
      ),
    );
  }
}
