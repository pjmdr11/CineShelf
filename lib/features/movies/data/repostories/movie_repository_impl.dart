import 'package:cine_shelf/core/constants/api_constants.dart';
import 'package:cine_shelf/data/local/env_helper.dart';
import 'package:cine_shelf/data/remote/service/api_service.dart';
import 'package:cine_shelf/domain/entiities/app_exception_model.dart';
import 'package:cine_shelf/domain/entiities/data_state.dart';
import 'package:cine_shelf/features/movies/data/models/response_model.dart';
import 'package:cine_shelf/features/movies/domain/repository/movie_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MovieRepository)
class MovieRepositoryImpl extends MovieRepository {
  final ApiService apiService;
  final EnvHelper envHelper;

  MovieRepositoryImpl({required this.apiService, required this.envHelper});

  @override
  Future<DataState<ResponseModel>> getDiscover({
    String locale = "en_US",
  }) async {
    try {
      final results = await apiService.get(
        apiDiscoverMovie,
        headers: apiService.getAppHeaders(),
        queryParams: {"language": locale},
      );
      final responseModel = ResponseModel.fromJson(results.data);
      return ResultSuccess(responseModel);
    } on DioException catch (err) {
      return ResultFailure(
        AppException(
          message: err.message,
          statusCode: err.response?.statusCode ?? 400,
        ),
      );
    } catch (e) {
      return ResultFailure(
        AppException(statusCode: 400, message: e.toString()),
      );
    }
  }

  @override
  Future<DataState<ResponseModel>> getPopularMovies({
    String locale = "en_US",
  }) async {
    try {
      final results = await apiService.get(
        apiPopularMovies,
        headers: apiService.getAppHeaders(),
        queryParams: {"language": locale},
      );
      final responseModel = ResponseModel.fromJson(results.data);
      return ResultSuccess(responseModel);
    } on DioException catch (err) {
      return ResultFailure(
        AppException(
          message: err.message,
          statusCode: err.response?.statusCode ?? 400,
        ),
      );
    } catch (e) {
      return ResultFailure(
        AppException(statusCode: 400, message: e.toString()),
      );
    }
  }

  @override
  Future<DataState<ResponseModel>> getTopRatedMovies({
    String locale = "en_US",
  }) async {
    try {
      final results = await apiService.get(
        apiTopRatedMovies,
        headers: apiService.getAppHeaders(),
        queryParams: {"language": locale},
      );
      final responseModel = ResponseModel.fromJson(results.data);
      return ResultSuccess(responseModel);
    } on DioException catch (err) {
      return ResultFailure(
        AppException(
          message: err.message,
          statusCode: err.response?.statusCode ?? 400,
        ),
      );
    } catch (e) {
      return ResultFailure(
        AppException(statusCode: 400, message: e.toString()),
      );
    }
  }

  @override
  Future<DataState<ResponseModel>> getTrendingContent({
    String locale = "en_US",
  }) async {
    try {
      final results = await apiService.get(
        apiWeeklyTrendingAll,
        headers: apiService.getAppHeaders(),
        queryParams: {"language": locale},
      );
      final responseModel = ResponseModel.fromJson(results.data);
      return ResultSuccess(responseModel);
    } on DioException catch (err) {
      return ResultFailure(
        AppException(
          message: err.message,
          statusCode: err.response?.statusCode ?? 400,
        ),
      );
    } catch (e) {
      return ResultFailure(
        AppException(statusCode: 400, message: e.toString()),
      );
    }
  }
}
