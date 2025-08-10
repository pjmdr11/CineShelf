import 'package:cine_shelf/domain/entities/app_exception_model.dart';
import 'package:cine_shelf/domain/entities/data_state.dart';
import 'package:cine_shelf/features/auth/domain/repository/user_repository.dart';
import 'package:cine_shelf/features/favourite_page/data/service/remote/favourite_data_store.dart';
import 'package:cine_shelf/features/favourite_page/domain/repository/favourites_repository.dart';
import 'package:cine_shelf/features/movie_home/data/models/content_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FavouriteRepository)
class FavouriteRepositoryImpl extends FavouriteRepository {
  final FavouriteDataSource favouriteService;
  final UserRepository userRepostioryImpl;

  FavouriteRepositoryImpl({
    required this.favouriteService,
    required this.userRepostioryImpl,
  });

  @override
  Future<bool> addFavourite(ContentItem content) async {
    return favouriteService.addFavourite(
      content.id.toString(),
      content.toJson(),
    );
  }

  @override
  Future<DataState<List<ContentItem>>> getAllFavourites() async {
    final user = await userRepostioryImpl.getSessionStatus();
    if (user is ResultFailure) {
      return ResultFailure(
        AppException(
          statusCode: 403,
          message: "error.text_login_required".tr(),
        ),
      );
    }
    final favourites = await favouriteService.getAllFavourites();
    return ResultSuccess(favourites);
  }

  @override
  Future<bool> isFavourite(String contentId) {
    return favouriteService.isFavourite(contentId);
  }

  @override
  Future<bool> removeFavourite(String contentId) {
    return favouriteService.removeFavourite(contentId);
  }

  @override
  Stream<DataState<List<ContentItem>>> watchFavourites() async* {
    final user = await userRepostioryImpl.getSessionStatus();
    if (user is ResultFailure) {
      throw ResultFailure(
        AppException(
          statusCode: 403,
          message: "error.text_login_required".tr(),
        ),
      );
    }
    final result = favouriteService
        .watchAllFavourites()
        .map((items) {
          return ResultSuccess(items);
        })
        .handleError((error) {
          return ResultFailure(AppException(message: error.toString()));
        });
    yield* result;
  }
}
