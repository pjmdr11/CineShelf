import 'package:cine_shelf/core/constants/api_constants.dart';
import 'package:cine_shelf/data/remote/service/api_service.dart';
import 'package:cine_shelf/domain/entiities/app_exception_model.dart';
import 'package:cine_shelf/domain/entiities/data_state.dart';
import 'package:cine_shelf/features/movies/data/models/response_model.dart';
import 'package:cine_shelf/features/movies/domain/repository/series_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SeriesRepository)
class SeriesRepositoryImpl extends SeriesRepository {
  final ApiService apiService;

  SeriesRepositoryImpl({required this.apiService});

  @override
  Future<DataState<ResponseModel>> getPopularTvShows({
    String locale = "en_US",
  }) async {
    try {
      final results = await apiService.get(
        apiPopularSeries,
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
  Future<DataState<ResponseModel>> getTopRatedShows({
    String locale = "en_US",
  }) async {
    try {
      final results = await apiService.get(
        apiTopRatedSeries,
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
  Future<DataState<ResponseModel>> getTvDiscover({
    String locale = "en_US",
  }) async {
    try {
      final results = await apiService.get(
        apiDiscoverTv,
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
