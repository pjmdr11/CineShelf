import 'package:cine_shelf/domain/entiities/data_state.dart';
import 'package:cine_shelf/features/content_details/data/models/movie_detail.dart';
import 'package:cine_shelf/features/content_details/domain/repository/content_detail_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetMovieDetailUsecase {
  final ContentDetailsRepository contentDetailRepository;

  GetMovieDetailUsecase({required this.contentDetailRepository});

  Future<DataState<MovieDetail>> getMovieDetails(int movieId, String locale) =>
      contentDetailRepository.getMovieDetail(
        movieId,
        locale: locale.replaceAll("_", "-"),
      );
}
