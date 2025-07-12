import 'package:cine_shelf/domain/entiities/data_state.dart';
import 'package:cine_shelf/features/movies/data/models/response_model.dart';

abstract class SeriesRepository {
  Future<DataState<ResponseModel>> getTvDiscover({String locale = "en_US"});
  Future<DataState<ResponseModel>> getPopularTvShows({String locale = "en_US"});
  Future<DataState<ResponseModel>> getTopRatedShows({String locale = "en_US"});
}
