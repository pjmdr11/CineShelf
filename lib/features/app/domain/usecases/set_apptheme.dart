import 'package:cine_shelf/features/app/domain/respository/app_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SetAppThemeUseCase {
  final AppRepository appRepo;

  SetAppThemeUseCase({required this.appRepo});

  void setAppTheme(String theme) {
    appRepo.changeTheme(theme);
  }
}
