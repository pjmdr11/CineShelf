import 'package:cine_shelf/domain/entities/data_state.dart';
import 'package:cine_shelf/features/search/data/model/cast_search_responsemodel.dart';
import 'package:cine_shelf/features/search/data/model/content_search_responsemodel.dart';

abstract class SearchRepository {
  Future<DataState<ContentSearchResponseModel>> searchSeries(
    String query, {
    int page = 0,
  });
  Future<DataState<ContentSearchResponseModel>> searchMovies(
    String query, {
    int page = 0,
  });
  Future<DataState<CastSearchResponseModel>> searchCasts(
    String query, {
    int page = 0,
  });
}
