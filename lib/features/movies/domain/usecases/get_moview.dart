import 'package:cine_shelf/domain/entiities/data_state.dart';
import 'package:cine_shelf/features/movies/data/models/content_item.dart';
import 'package:cine_shelf/features/movies/domain/repository/movie_repository.dart';
import 'package:cine_shelf/features/movies/domain/repository/series_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetMovieContentUseCase {
  final MovieRepository movieRepo;
  final SeriesRepository seriesRepository;

  GetMovieContentUseCase({
    required this.movieRepo,
    required this.seriesRepository,
  });

  Future<DataState<Map<String, dynamic>>> getDashboardContent({
    String locale = "en_US",
  }) async {
    final result = await Future.wait([
      movieRepo.getTrendingContent(locale: locale),
      movieRepo.getDiscover(locale: locale),
      movieRepo.getPopularMovies(locale: locale),
      movieRepo.getTopRatedMovies(locale: locale),
      seriesRepository.getPopularTvShows(locale: locale),
      seriesRepository.getTopRatedShows(locale: locale),
    ]);
    final Map<String, dynamic> movieList = {};
    for (var element in result) {
      if (element is ResultSuccess) {
        final type = element.data?.type ?? "";
        final lists = element.data?.results ?? [];
        if (movieList.containsKey(type)) {
          final List<ContentItem> contentLists = movieList[type];
          contentLists.addAll(lists);
          contentLists.shuffle();
          movieList[type] = lists;
        } else {
          movieList[type] = lists;
        }
      }
    }
    return ResultSuccess(movieList);
  }
}
