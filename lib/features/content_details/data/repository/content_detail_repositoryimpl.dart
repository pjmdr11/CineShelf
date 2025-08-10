import 'package:cine_shelf/core/constants/api_constants.dart';
import 'package:cine_shelf/core/constants/app_constants.dart';
import 'package:cine_shelf/core/constants/pref_constants.dart';
import 'package:cine_shelf/data/local/env_helper.dart';
import 'package:cine_shelf/data/local/preference_helper.dart';
import 'package:cine_shelf/data/remote/service/api_service.dart';
import 'package:cine_shelf/domain/entities/app_exception_model.dart';
import 'package:cine_shelf/domain/entities/data_state.dart';
import 'package:cine_shelf/features/content_details/data/models/casts_response_model.dart';
import 'package:cine_shelf/features/content_details/data/models/movie_detail.dart';
import 'package:cine_shelf/features/content_details/data/models/tv_detail.dart';
import 'package:cine_shelf/features/content_details/domain/repository/content_detail_repository.dart';
import 'package:cine_shelf/features/movie_home/data/models/content_item.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ContentDetailsRepository)
class ContentDetailRepositoryImpl extends ContentDetailsRepository {
  final ApiService apiService;
  final PreferenceHelper prefHelper;
  final EnvHelper envHelper;

  ContentDetailRepositoryImpl({
    required this.apiService,
    required this.envHelper,
    required this.prefHelper,
  });

  @override
  Future<DataState<MovieDetail>> getMovieDetail(int movieId) async {
    try {
      final results = await apiService.get(
        apiMovieDetails.replaceAll("{movieId}", movieId.toString()),
        headers: apiService.getAppHeaders(),
        queryParams: {
          "language": prefHelper.getString(prefLocale, def: "en-US"),
        },
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
        apiSeriesDetails.replaceAll("{seriesId}", seriesId.toString()),
        headers: apiService.getAppHeaders(),
        queryParams: {
          "language": prefHelper.getString(prefLocale, def: "en-US"),
        },
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

  @override
  Future<DataState<CastsResponseModel>> getCastDetails(
    int contentId,
    ContentType type,
  ) async {
    try {
      final apiEndpoint = type == ContentType.Movie
          ? apiMovieCasts
          : apiTvCasts;

      final response = await apiService.get(
        apiEndpoint.replaceAll("{id}", contentId.toString()),
        headers: apiService.getAppHeaders(),
        queryParams: {
          "language": prefHelper.getString(prefLocale, def: "en-US"),
        },
      );
      final CastsResponseModel castResponseModel = CastsResponseModel.fromJson(
        response.data,
      );
      final actors = castResponseModel.cast
          ?.where((item) => item.knownForDepartment == "Acting")
          .toList();
      return ResultSuccess(CastsResponseModel(cast: actors));
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
  Future<DataState<List<ContentItem>>> getContentRelatedItems(
    int contentId,
    ContentType type,
  ) async {
    final endPoint = type == ContentType.Movie
        ? apiRelatedMovies
        : apiRelatedSeries;
    try {
      final response = await apiService.get(
        endPoint.replaceAll("{id}", contentId.toString()),
        headers: apiService.getAppHeaders(),
        queryParams: {
          "language": prefHelper.getString(prefLocale, def: "en-US"),
        },
      );
      final List<dynamic> results = response.data["results"];
      List<ContentItem> lists = results
          .map((it) => ContentItem.fromJson(it))
          .toList();
      return ResultSuccess(lists);
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
