import 'package:cine_shelf/features/movie_home/data/models/content_item.dart';
import 'package:flutter/material.dart';

class FavouriteContentWidget extends StatelessWidget {
  final ContentItem contentItem;
  const FavouriteContentWidget({super.key, required this.contentItem});
  @override
  Widget build(BuildContext context) {
    final isLoading = true;
    final isFavourite = false;
    if (isLoading) {
      return Container(
        height: 20,
        width: 20,
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: CircularProgressIndicator(strokeWidth: 1.0, color: Colors.white),
      );
    }

    return IconButton(
      onPressed: () {
        //todo toggle favourite
      },
      icon: Icon(isFavourite ? Icons.favorite : Icons.favorite_outline),
    );
  }
}
