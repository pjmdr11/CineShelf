import 'package:cine_shelf/domain/entiities/data_state.dart';
import 'package:cine_shelf/features/content_details/data/models/tv_detail.dart';
import 'package:cine_shelf/features/content_details/domain/repository/content_detail_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetTvDetailUseCase {
  final ContentDetailsRepository contentDetailRepo;

  GetTvDetailUseCase({required this.contentDetailRepo});

  Future<DataState<TvDetail>> getTvDetail(int id, String locale) =>
      contentDetailRepo.getTvDetails(id, locale: locale.replaceAll("_", "-"));
}
