import 'package:cine_shelf/features/favourite_content/domain/repository/favourites_repository.dart';
import 'package:cine_shelf/features/movies/data/models/content_item.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddFavouriteUseCase {
  final FavouriteRepository favouriteRepo;

  AddFavouriteUseCase({required this.favouriteRepo});

  Future<bool> addToFavourite(ContentItem contentId) =>
      favouriteRepo.addFavourite(contentId);
}
