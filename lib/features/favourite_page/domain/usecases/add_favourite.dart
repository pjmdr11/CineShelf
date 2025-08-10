import 'package:cine_shelf/features/favourite_page/domain/repository/favourites_repository.dart';
import 'package:cine_shelf/features/movie_home/data/models/content_item.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddFavouriteUseCase {
  final FavouriteRepository favouriteRepo;

  AddFavouriteUseCase({required this.favouriteRepo});

  Future<bool> addToFavourite(ContentItem contentId) =>
      favouriteRepo.addFavourite(contentId);
}
