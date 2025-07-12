import 'package:cine_shelf/core/constants/api_constants.dart';
import 'package:cine_shelf/data/local/env_helper.dart';
import 'package:cine_shelf/data/remote/service/api_service.dart';
import 'package:cine_shelf/domain/entiities/app_exception_model.dart';
import 'package:cine_shelf/domain/entiities/data_state.dart';
import 'package:cine_shelf/features/content_details/data/models/movie_detail.dart';
import 'package:cine_shelf/features/content_details/data/models/tv_detail.dart';
import 'package:cine_shelf/features/content_details/domain/repository/content_detail_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ContentDetailsRepository)
class ContentDetailRepositoryImpl extends ContentDetailsRepository {
  final ApiService apiService;
  final EnvHelper envHelper;

  ContentDetailRepositoryImpl({
    required this.apiService,
    required this.envHelper,
  });

  @override
  Future<DataState<MovieDetail>> getMovieDetail(
    int movieId, {
    String locale = "en-US",
  }) async {
    try {
      final results = await apiService.get(
        apiMovieDetails.replaceAll("{movieId}}", movieId.toString()),
        headers: apiService.getAppHeaders(),
        queryParams: {"language": locale},
      );
      final movieDetails = MovieDetail.fromJson(results.data);
      return ResultSuccess(movieDetails);
    } on DioException catch (de) {
      return ResultFailure(
        BadRequestException(
          de.response?.statusMessage ?? "",
          statusCode: de.response?.statusCode ?? 400,
        ),
      );
    } catch (e) {
      return ResultFailure(AppException(message: e.toString()));
    }
  }

  @override
  Future<DataState<TvDetail>> getTvDetails(
    int seriesId, {
    String locale = "en-US",
  }) async {
    try {
      final results = await apiService.get(
        apiSeriesDetails.replaceAll("{movieId}}", seriesId.toString()),
        headers: apiService.getAppHeaders(),
        queryParams: {"language": locale},
      );
      final tvDetail = TvDetail.fromJson(results.data);
      return ResultSuccess(tvDetail);
    } on DioException catch (de) {
      return ResultFailure(
        BadRequestException(
          de.response?.statusMessage ?? "",
          statusCode: de.response?.statusCode ?? 400,
        ),
      );
    } catch (e) {
      return ResultFailure(AppException(message: e.toString()));
    }
  }
}
