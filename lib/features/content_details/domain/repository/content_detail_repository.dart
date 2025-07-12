import 'package:cine_shelf/domain/entiities/data_state.dart';
import 'package:cine_shelf/features/content_details/data/models/movie_detail.dart';
import 'package:cine_shelf/features/content_details/data/models/tv_detail.dart';

abstract class ContentDetailsRepository {
  Future<DataState<MovieDetail>> getMovieDetail(int movieId, {String locale});
  Future<DataState<TvDetail>> getTvDetails(int seriesId, {String locale});
}
