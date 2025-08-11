import 'package:cine_shelf/features/movie_home/presentation/provider/state/discover_slider/discover_slider_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show StateNotifier;

class DiscoverSliderNotifier extends StateNotifier<DiscoverSliderState> {
  DiscoverSliderNotifier() : super(const DiscoverSliderState());

  void setSliderIndex(int index) {
    state = state.copyWith(selectedSliderIndex: index);
  }
}
