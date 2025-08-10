import 'package:cine_shelf/core/constants/api_constants.dart';
import 'package:cine_shelf/core/constants/app_constants.dart';
import 'package:cine_shelf/core/constants/pref_constants.dart';
import 'package:cine_shelf/data/local/preference_helper.dart';
import 'package:cine_shelf/data/remote/service/api_service.dart';
import 'package:cine_shelf/domain/entities/app_exception_model.dart';
import 'package:cine_shelf/domain/entities/data_state.dart';
import 'package:cine_shelf/features/movie_home/data/models/response_model.dart';
import 'package:cine_shelf/features/movie_home/domain/repository/series_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SeriesRepository)
class SeriesRepositoryImpl extends SeriesRepository {
  final ApiService apiService;
  final PreferenceHelper prefHelper;
  SeriesRepositoryImpl({required this.apiService, required this.prefHelper});

  @override
  Future<DataState<ResponseModel>> getPopularTvShows({
    String locale = "en-US",
  }) async {
    try {
      final results = await apiService.get(
        apiPopularSeries,
        headers: apiService.getAppHeaders(),
        queryParams: {
          "language": prefHelper.getString(prefLocale, def: "en-US"),
        },
      );
      final responseModel = ResponseModel.fromJson(results.data);
      return ResultSuccess(responseModel.copyWith(type: viewTypePopular));
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
    String locale = "en-US",
  }) async {
    try {
      final results = await apiService.get(
        apiTopRatedSeries,
        headers: apiService.getAppHeaders(),
        queryParams: {
          "language": prefHelper.getString(prefLocale, def: "en-US"),
        },
      );
      final responseModel = ResponseModel.fromJson(results.data);
      return ResultSuccess(responseModel.copyWith(type: viewTypeTopRated));
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
    String locale = "en-US",
  }) async {
    try {
      final results = await apiService.get(
        apiDiscoverTv,
        headers: apiService.getAppHeaders(),
        queryParams: {
          "language": prefHelper.getString(prefLocale, def: "en-US"),
        },
      );
      final responseModel = ResponseModel.fromJson(results.data);
      return ResultSuccess(responseModel.copyWith(type: viewTypeDiscover));
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
