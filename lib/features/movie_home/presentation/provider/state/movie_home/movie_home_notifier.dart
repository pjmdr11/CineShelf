import 'package:cine_shelf/core/di/injection.dart';
import 'package:cine_shelf/domain/entities/data_state.dart';
import 'package:cine_shelf/features/movie_home/domain/usecases/get_movie.dart';
import 'package:cine_shelf/features/movie_home/presentation/provider/state/movie_home/movie_home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieHomeNotifier extends StateNotifier<MovieHomeState> {
  final GetMovieContentUseCase getMovieContentUseCase = getIt();
  MovieHomeNotifier() : super(const MovieHomeState()) {
    fetchMoviesData();
  }

  Future<void> fetchMoviesData() async {
    state = state.copyWith(isLoading: true);
    final results = await getMovieContentUseCase.getDashboardContent();
    if (results is ResultSuccess) {
      state = state.copyWith(
        isLoading: false,
        moviesdata: results.data!,
        error: null,
      );
    } else if (results is ResultFailure) {
      state = state.copyWith(error: results.appException!, isLoading: false);
    }
  }
}
