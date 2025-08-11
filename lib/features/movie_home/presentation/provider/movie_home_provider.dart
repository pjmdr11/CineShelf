import 'package:cine_shelf/features/movie_home/presentation/provider/state/discover_slider/discover_slider_notifier.dart';
import 'package:cine_shelf/features/movie_home/presentation/provider/state/movie_home/movie_home_notifier.dart';
import 'package:cine_shelf/features/movie_home/presentation/provider/state/movie_home/movie_home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieHomeNotifierProvider =
    AutoDisposeStateNotifierProvider<MovieHomeNotifier, MovieHomeState>(
      (ref) => MovieHomeNotifier(),
    );

final discoverSliderNotifierProvider = AutoDisposeStateNotifierProvider(
  (ref) => DiscoverSliderNotifier(),
);
