import 'package:cine_shelf/domain/entities/data_state.dart';
import 'package:cine_shelf/features/movie_home/data/models/content_item.dart';
import 'package:cine_shelf/features/movie_home/domain/repository/movie_repository.dart';
import 'package:cine_shelf/features/movie_home/domain/repository/series_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetMovieContentUseCase {
  final MovieRepository movieRepo;
  final SeriesRepository seriesRepository;

  GetMovieContentUseCase({
    required this.movieRepo,
    required this.seriesRepository,
  });

  Future<DataState<Map<String, dynamic>>> getDashboardContent() async {
    final result = await Future.wait([
      movieRepo.getTrendingContent(),
      movieRepo.getDiscover(),
      movieRepo.getPopularMovies(),
      movieRepo.getTopRatedMovies(),
      seriesRepository.getTvDiscover(),
      seriesRepository.getPopularTvShows(),
      seriesRepository.getTopRatedShows(),
    ]);
    final Map<String, dynamic> movieList = {};
    for (var element in result) {
      if (element is ResultSuccess) {
        final type = element.data?.type ?? "";
        final lists = element.data?.results ?? [];
        if (movieList.containsKey(type)) {
          final List<ContentItem> contentLists = movieList[type];
          final list = List.of(contentLists);
          list.addAll(lists);
          list.shuffle();
          movieList[type] = list;
        } else {
          movieList[type] = lists;
        }
      }
    }
    return ResultSuccess(movieList);
  }
}
