import 'package:cine_shelf/features/favourite_content/domain/repository/favourites_repository.dart';
import 'package:cine_shelf/features/movies/data/models/content_item.dart';
import 'package:cine_shelf/features/favourite_content/data/service/remote/favourite_data_store.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FavouriteRepository)
class FavouriteRepositoryImpl extends FavouriteRepository {
  final FavouriteDataSource favouriteService;

  FavouriteRepositoryImpl({required this.favouriteService});

  @override
  Future<bool> addFavourite(ContentItem content) async {
    return favouriteService.addFavourite(
      content.id.toString(),
      content.toJson(),
    );
  }

  @override
  Future<List<ContentItem>> getAllFavourites() {
    return favouriteService.getAllFavourites();
  }

  @override
  Future<bool> isFavourite(String contentId) {
    return favouriteService.isFavourite(contentId);
  }

  @override
  Future<bool> removeFavourite(String contentId) {
    return favouriteService.removeFavourite(contentId);
  }
}
