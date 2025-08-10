import 'package:cine_shelf/features/favourite_page/domain/repository/favourites_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RemoveFavouriteUseCase {
  final FavouriteRepository favouriteRepository;
  RemoveFavouriteUseCase({required this.favouriteRepository});

  Future<bool> removeFavourite(String contentId) =>
      favouriteRepository.removeFavourite(contentId);
}
