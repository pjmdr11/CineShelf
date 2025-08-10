import 'package:cine_shelf/core/constants/app_constants.dart';
import 'package:cine_shelf/core/extensions/responsive_util.dart';
import 'package:cine_shelf/features/content_details/presentation/screen/content_details/components/cast_list_widget.dart';
import 'package:cine_shelf/features/movie_home/presentation/screens/home/components/content_section_row.dart';
import 'package:cine_shelf/features/search/data/model/cast_search_responsemodel.dart';
import 'package:cine_shelf/features/search/data/model/content_search_responsemodel.dart';
import 'package:cine_shelf/presentation/common/custom_text_input.dart';
import 'package:cine_shelf/presentation/common/spacers/spacer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 28,
        title: CustomTextInput(
          id: "search",
          onValueChanged: (String id, String value) {
            //TODO update search query in viewmodel.
          },
          textStyle: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontSize: 12.rf()),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: Colors.grey),
          ),
          backgroundColor: Theme.of(context).canvasColor,
          isDense: true,
          hint: "How to train a dragon, Dexter ....",
        ),
      ),
      body: Builder(
        builder: (context) {
          return SafeArea(
            child: Container(),
          ); //TODO implement search results view.
        },
      ),
    );
  }
}

class CastResultRow extends StatelessWidget {
  final CastSearchResponseModel? model;
  const CastResultRow({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    final casts = model?.results ?? [];
    if (casts.isNotEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "general.text_casts".tr(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 18.rf(),
              ),
            ),
          ),
          VerticalSpacer(height: 16),
          SizedBox(
            height: 144.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemBuilder: (context, index) {
                final castItem = casts[index];
                return CastItemWidget(castModel: castItem);
              },
              separatorBuilder: (context, index) {
                return HorizontalSpacer();
              },
              itemCount: casts.length,
            ),
          ),
        ],
      );
    }
    return Container();
  }
}

class ContentResultRow extends StatelessWidget {
  final ContentSearchResponseModel? model;
  const ContentResultRow({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    final String headerTitle = model?.contentType == ContentType.Movie
        ? "general.text_movies".tr()
        : "general.text_series".tr();
    final items = model?.results ?? [];
    if (items.isEmpty) {
      return Container();
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            headerTitle,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 18.rf(),
            ),
          ),
        ),
        VerticalSpacer(height: 12),
        SizedBox(
          height: 200.r,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ContentItemWidget(contentItem: items[index]);
            },
            separatorBuilder: (context, index) {
              return HorizontalSpacer(width: 12);
            },
            itemCount: items.length,
          ),
        ),
      ],
    );
  }
}
