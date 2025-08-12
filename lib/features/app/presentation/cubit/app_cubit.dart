import 'package:cine_shelf/core/constants/app_constants.dart';
import 'package:cine_shelf/core/di/injection.dart';
import 'package:cine_shelf/features/app/domain/usecases/get_apptheme.dart';
import 'package:cine_shelf/features/app/domain/usecases/set_apptheme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

@lazySingleton
class AppCubit extends Cubit<AppState> {
  final GetAppThemeUseCase getThemeUseCase = getIt();
  final SetAppThemeUseCase setThemeUseCase = getIt();
  AppCubit() : super(AppState()) {
    final currentTheme = getThemeUseCase.getAppTheme();
    emit(state.copyWith(appTheme: currentTheme));
  }

  void changeTheme(String theme) {
    emit(state.copyWith(appTheme: theme));
    setThemeUseCase.setAppTheme(theme);
  }

  String getCurrentTheme() {
    return state.appTheme;
  }
}
