import 'package:cine_shelf/features/movies/data/models/content_item.dart';

abstract class FavouriteRepository {
  Future<bool> addFavourite(ContentItem content);
  Future<bool> removeFavourite(String contentId);
  Future<bool> isFavourite(String contentId);
  Future<List<ContentItem>> getAllFavourites();
}
