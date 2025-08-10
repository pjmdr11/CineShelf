import 'package:cine_shelf/domain/entities/data_state.dart';
import 'package:cine_shelf/features/content_by_cast/data/model/content_by_cast_responsemodel.dart';
import 'package:cine_shelf/features/content_by_cast/domain/repository/content_by_cast_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetContentByCastUseCase {
  final ContentByCastRepository contentByCastRepository;

  GetContentByCastUseCase({required this.contentByCastRepository});

  Future<DataState<ContentByCastResponseModel>> getContentsByCasts(
    String castId,
  ) async {
    return await contentByCastRepository.getContentsByCasts(castId);
  }
}
