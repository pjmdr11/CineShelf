import 'package:bloc/bloc.dart';
import 'package:cine_shelf/core/constants/route_constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'dashboard_cubit.freezed.dart';
part 'dashboard_state.dart';

@lazySingleton
class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState());

  void setNavPosition(int index) {
    final id = state.navItems[index]["id"];
    emit(state.copyWith(selectedBottomNavId: id));
  }
}
