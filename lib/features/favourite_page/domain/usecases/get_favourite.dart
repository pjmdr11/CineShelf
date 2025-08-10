import 'package:cine_shelf/domain/entities/data_state.dart';
import 'package:cine_shelf/features/favourite_page/domain/repository/favourites_repository.dart';
import 'package:cine_shelf/features/movie_home/data/models/content_item.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetFavourteUseCase {
  final FavouriteRepository favouriteRepository;
  GetFavourteUseCase({required this.favouriteRepository});

  Future<DataState<List<ContentItem>>> getAllFavourites() {
    return favouriteRepository.getAllFavourites();
  }

  Stream<DataState<List<ContentItem>>> watchAllFavourites() {
    return favouriteRepository.watchFavourites();
  }
}
