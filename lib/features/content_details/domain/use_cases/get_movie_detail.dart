import 'package:cine_shelf/core/constants/app_constants.dart';
import 'package:cine_shelf/core/constants/id_constants.dart';
import 'package:cine_shelf/domain/entities/data_state.dart';
import 'package:cine_shelf/features/content_details/data/models/casts_response_model.dart';
import 'package:cine_shelf/features/content_details/data/models/movie_detail.dart';
import 'package:cine_shelf/features/content_details/domain/repository/content_detail_repository.dart';
import 'package:cine_shelf/features/movie_home/data/models/content_item.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetMovieDetailUsecase {
  final ContentDetailsRepository contentDetailRepository;

  GetMovieDetailUsecase({required this.contentDetailRepository});

  Future<DataState<Map<String, dynamic>>> getMovieDetails(int movieId) async {
    final Map<String, dynamic> result = {};
    final movieDetails = await Future.wait([
      contentDetailRepository.getMovieDetail(movieId),
      contentDetailRepository.getCastDetails(movieId, ContentType.Movie),
      contentDetailRepository.getContentRelatedItems(
        movieId,
        ContentType.Movie,
      ),
    ]);
    for (var element in movieDetails) {
      if (element is ResultSuccess) {
        switch (element.data) {
          case MovieDetail movieDetai:
            result[idContentDetail] = movieDetai;
            break;

          case CastsResponseModel castModel:
            result[idCastLists] = castModel;
            break;

          case List<ContentItem> lists:
            result[idRelatedItems] = lists;
            break;
        }
      }
    }

    return ResultSuccess(result);
  }
}
