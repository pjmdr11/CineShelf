import 'package:cine_shelf/core/constants/app_constants.dart';
import 'package:cine_shelf/core/constants/id_constants.dart';
import 'package:cine_shelf/domain/entities/data_state.dart';
import 'package:cine_shelf/features/content_details/data/models/casts_response_model.dart';
import 'package:cine_shelf/features/content_details/data/models/tv_detail.dart';
import 'package:cine_shelf/features/content_details/domain/repository/content_detail_repository.dart';
import 'package:cine_shelf/features/movie_home/data/models/content_item.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetTvDetailUseCase {
  final ContentDetailsRepository contentDetailRepository;

  GetTvDetailUseCase({required this.contentDetailRepository});

  Future<DataState<Map<String, dynamic>>> getTvDetails(int seriesId) async {
    final Map<String, dynamic> result = {};
    final tvDetails = await Future.wait([
      contentDetailRepository.getTvDetails(seriesId),
      contentDetailRepository.getCastDetails(seriesId, ContentType.Tv),
      contentDetailRepository.getContentRelatedItems(seriesId, ContentType.Tv),
    ]);
    for (var element in tvDetails) {
      if (element is ResultSuccess) {
        switch (element.data) {
          case TvDetail seriesDetails:
            result[idContentDetail] = seriesDetails;
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
