import 'package:cine_shelf/domain/entities/data_state.dart';
import 'package:cine_shelf/features/movie_home/data/models/content_item.dart';

abstract class FavouriteRepository {
  Future<bool> addFavourite(ContentItem content);
  Future<bool> removeFavourite(String contentId);
  Future<bool> isFavourite(String contentId);
  Future<DataState<List<ContentItem>>> getAllFavourites();
  Stream<DataState<List<ContentItem>>> watchFavourites();
}
