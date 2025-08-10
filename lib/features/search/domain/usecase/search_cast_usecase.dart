import 'package:cine_shelf/domain/entities/data_state.dart';
import 'package:cine_shelf/features/search/data/model/cast_search_responsemodel.dart';
import 'package:cine_shelf/features/search/domain/respository/search_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SearchCastUseCase {
  final SearchRepository _searchRepo;

  SearchCastUseCase(this._searchRepo);

  Future<DataState<CastSearchResponseModel>> searchCasts(
    String query, {
    int page = 0,
  }) async {
    return await _searchRepo.searchCasts(query, page: page);
  }
}
