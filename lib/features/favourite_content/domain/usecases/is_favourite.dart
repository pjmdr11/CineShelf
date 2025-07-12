import 'package:cine_shelf/features/favourite_content/domain/repository/favourites_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class IsFavouriteUseCase {
  final FavouriteRepository favouriteRepo;
  IsFavouriteUseCase({required this.favouriteRepo});

  Future<bool> isFavourite(String contentItem) =>
      favouriteRepo.isFavourite(contentItem);
}
