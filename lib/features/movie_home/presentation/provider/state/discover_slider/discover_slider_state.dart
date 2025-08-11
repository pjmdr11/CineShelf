import 'package:freezed_annotation/freezed_annotation.dart';

part 'discover_slider_state.freezed.dart';

@freezed
abstract class DiscoverSliderState with _$DiscoverSliderState {
  const factory DiscoverSliderState({@Default(0) int selectedSliderIndex}) =
      _DiscoverSliderState;
}
