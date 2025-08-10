import 'package:cine_shelf/domain/entities/data_state.dart';
import 'package:cine_shelf/features/content_by_cast/data/model/content_by_cast_responsemodel.dart';

abstract class ContentByCastRepository {
  Future<DataState<ContentByCastResponseModel>> getContentsByCasts(
    String castId,
  );
}
