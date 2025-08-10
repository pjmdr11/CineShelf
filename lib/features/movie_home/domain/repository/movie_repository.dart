import 'package:cine_shelf/domain/entities/data_state.dart';
import 'package:cine_shelf/features/movie_home/data/models/response_model.dart';

abstract class MovieRepository {
  Future<DataState<ResponseModel>> getDiscover();
  Future<DataState<ResponseModel>> getTrendingContent();
  Future<DataState<ResponseModel>> getPopularMovies();
  Future<DataState<ResponseModel>> getTopRatedMovies();
}
