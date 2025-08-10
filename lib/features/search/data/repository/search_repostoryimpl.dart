import 'package:cine_shelf/core/constants/api_constants.dart';
import 'package:cine_shelf/core/constants/app_constants.dart';
import 'package:cine_shelf/core/constants/pref_constants.dart';
import 'package:cine_shelf/data/local/preference_helper.dart';
import 'package:cine_shelf/data/remote/service/api_service.dart';
import 'package:cine_shelf/domain/entities/app_exception_model.dart';
import 'package:cine_shelf/domain/entities/data_state.dart';
import 'package:cine_shelf/features/search/data/model/cast_search_responsemodel.dart';
import 'package:cine_shelf/features/search/data/model/content_search_responsemodel.dart';
import 'package:cine_shelf/features/search/domain/respository/search_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SearchRepository)
class SearchRepositoryImpl extends SearchRepository {
  final ApiService apiService;
  final PreferenceHelper prefHelper;

  SearchRepositoryImpl({required this.apiService, required this.prefHelper});

  @override
  Future<DataState<CastSearchResponseModel>> searchCasts(
    String query, {
    int page = 0,
  }) async {
    try {
      final result = await apiService.get(
        apiSearchCasts,
        headers: apiService.getAppHeaders(),
        queryParams: {
          "query": query,
          "page": page,
          "language": prefHelper.getString(prefLocale, def: "en-US"),
        },
      );
      final model = CastSearchResponseModel.fromJson(result.data);
      return ResultSuccess(model);
    } on DioException catch (de) {
      return ResultFailure(AppException(message: de.toString()));
    } catch (e) {
      return ResultFailure(AppException(message: e.toString()));
    }
  }

  @override
  Future<DataState<ContentSearchResponseModel>> searchMovies(
    String query, {
    int page = 0,
  }) async {
    try {
      final response = await apiService.get(
        apiSearchMovies,
        headers: apiService.getAppHeaders(),
        queryParams: {
          "query": query,
          "page": page,
          "language": prefHelper.getString(prefLocale, def: "en-US"),
        },
      );
      final model = ContentSearchResponseModel.fromJson(response.data);
      return ResultSuccess(model.copyWith(contentType: ContentType.Movie));
    } on DioException catch (de) {
      return ResultFailure(AppException(message: de.toString()));
    } catch (e) {
      return ResultFailure(AppException(message: e.toString()));
    }
  }

  @override
  Future<DataState<ContentSearchResponseModel>> searchSeries(
    String query, {
    int page = 0,
  }) async {
    try {
      final response = await apiService.get(
        apiSearchSeries,
        headers: apiService.getAppHeaders(),
        queryParams: {
          "query": query,
          "page": page,
          "language": prefHelper.getString(prefLocale, def: "en-US"),
        },
      );
      final model = ContentSearchResponseModel.fromJson(response.data);
      return ResultSuccess(model.copyWith(contentType: ContentType.Tv));
    } on DioException catch (de) {
      return ResultFailure(AppException(message: de.toString()));
    } catch (e) {
      return ResultFailure(AppException(message: e.toString()));
    }
  }
}
