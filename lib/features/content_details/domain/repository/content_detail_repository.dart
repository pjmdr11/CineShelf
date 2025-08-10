import 'package:cine_shelf/core/constants/app_constants.dart';
import 'package:cine_shelf/domain/entities/data_state.dart';
import 'package:cine_shelf/features/content_details/data/models/casts_response_model.dart';
import 'package:cine_shelf/features/content_details/data/models/movie_detail.dart';
import 'package:cine_shelf/features/content_details/data/models/tv_detail.dart';
import 'package:cine_shelf/features/movie_home/data/models/content_item.dart';

abstract class ContentDetailsRepository {
  Future<DataState<MovieDetail>> getMovieDetail(int movieId);
  Future<DataState<CastsResponseModel>> getCastDetails(
    int movieId,
    ContentType type,
  );
  Future<DataState<TvDetail>> getTvDetails(int seriesId);
  Future<DataState<List<ContentItem>>> getContentRelatedItems(
    int contentId,
    ContentType type,
  );
}
