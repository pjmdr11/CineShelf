import 'package:cine_shelf/core/constants/route_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'splash_screen_cubit.freezed.dart';
part 'splash_screen_state.dart';

@lazySingleton
class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenState.initial()) {
    Future.delayed(Duration(seconds: 2), () {
      emit(SplashScreenState.success(routeHome));
    });
  }
}
