import 'package:cine_shelf/core/constants/app_constants.dart';
import 'package:cine_shelf/features/movie_home/data/models/content_item.dart';
import 'package:cine_shelf/features/movie_home/presentation/provider/movie_home_provider.dart';
import 'package:cine_shelf/features/movie_home/presentation/screens/home/components/content_section_row.dart';
import 'package:cine_shelf/features/movie_home/presentation/screens/home/components/discover_slider.dart';
import 'package:cine_shelf/presentation/common/custom_error_view.dart';
import 'package:cine_shelf/presentation/common/spacers/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieHome extends ConsumerWidget {
  const MovieHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homePageState = ref.watch(movieHomeNotifierProvider);
    final isLoading = homePageState.isLoading;
    final appException = homePageState.error;
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (appException != null) {
            return CustomErrorView(
              icon: Icons.error,
              message: appException.message,
            );
          } else {
            final results = homePageState.moviesdata;
            final discover = results[viewTypeDiscover];
            return CustomScrollView(
              slivers: [
                DiscoverSlider(discover: discover),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: viewTypeOrder.length,
                    (context, index) {
                      final viewType = viewTypeOrder[index];
                      final item = results[viewType] as List<ContentItem>;
                      return ContentSectionRow(viewType: viewType, item: item);
                    },
                  ),
                ),
                SliverToBoxAdapter(child: VerticalSpacer(height: 100)),
              ],
            );
          }
        },
      ),
    );
  }
}
