import 'package:cine_shelf/core/constants/api_constants.dart';
import 'package:cine_shelf/core/constants/pref_constants.dart';
import 'package:cine_shelf/data/local/preference_helper.dart';
import 'package:cine_shelf/data/remote/service/api_service.dart';
import 'package:cine_shelf/domain/entities/app_exception_model.dart';
import 'package:cine_shelf/domain/entities/data_state.dart';
import 'package:cine_shelf/features/content_by_cast/data/model/content_by_cast_responsemodel.dart';
import 'package:cine_shelf/features/content_by_cast/domain/repository/content_by_cast_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ContentByCastRepository)
class ContentByCastRepositoryImpl extends ContentByCastRepository {
  final ApiService apiService;
  final PreferenceHelper prefHelper;

  ContentByCastRepositoryImpl({
    required this.apiService,
    required this.prefHelper,
  });

  @override
  Future<DataState<ContentByCastResponseModel>> getContentsByCasts(
    String castId,
  ) async {
    try {
      final endPoint = apiContentByCasts.replaceAll("{cast_id}", castId);
      final response = await apiService.get(
        endPoint,
        headers: apiService.getAppHeaders(),
        queryParams: {
          "language": prefHelper.getString(prefLocale, def: "en-US"),
        },
      );
      final responseModel = ContentByCastResponseModel.fromJson(response.data);
      return ResultSuccess(responseModel);
    } catch (e) {
      return ResultFailure(AppException(message: e.toString()));
    }
  }
}
