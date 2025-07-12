import 'package:cine_shelf/features/app/domain/respository/app_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAppThemeUseCase {
  final AppRepository appRepo;

  GetAppThemeUseCase({required this.appRepo});

  String getAppTheme() => appRepo.getAppTheme();
}
