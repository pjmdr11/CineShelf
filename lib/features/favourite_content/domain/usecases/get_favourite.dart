import 'package:cine_shelf/features/favourite_content/domain/repository/favourites_repository.dart';
import 'package:cine_shelf/features/movies/data/models/content_item.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetFavourteUseCase {
  final FavouriteRepository favouriteRepository;
  GetFavourteUseCase({required this.favouriteRepository});

  Future<List<ContentItem>> getAllFavourites() =>
      favouriteRepository.getAllFavourites();
}
