import 'package:cine_shelf/domain/entiities/data_state.dart';
import 'package:cine_shelf/features/movies/data/models/response_model.dart';

abstract class MovieRepository {
  Future<DataState<ResponseModel>> getDiscover({String locale = "en_US"});
  Future<DataState<ResponseModel>> getTrendingContent({
    String locale = "en_US",
  });
  Future<DataState<ResponseModel>> getPopularMovies({String locale = "en_US"});
  Future<DataState<ResponseModel>> getTopRatedMovies({String locale = "en_US"});
}
