import 'package:cine_shelf/domain/entities/data_state.dart';
import 'package:cine_shelf/features/movie_home/data/models/response_model.dart';

abstract class SeriesRepository {
  Future<DataState<ResponseModel>> getTvDiscover();
  Future<DataState<ResponseModel>> getPopularTvShows();
  Future<DataState<ResponseModel>> getTopRatedShows();
}
