import 'package:cine_shelf/domain/entities/data_state.dart';
import 'package:cine_shelf/features/search/data/model/content_search_responsemodel.dart';
import 'package:cine_shelf/features/search/domain/respository/search_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SearchMovieUseCase {
  final SearchRepository _searchRepository;

  SearchMovieUseCase(this._searchRepository);

  Future<DataState<ContentSearchResponseModel>> searchMovies(
    String query, {
    int page = 0,
  }) async {
    return await _searchRepository.searchMovies(query, page: page);
  }
}
