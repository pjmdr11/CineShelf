import 'package:cine_shelf/features/app/domain/respository/app_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SetAppTheme {
  final AppRepository appRepo;

  SetAppTheme({required this.appRepo});

  void getAppTheme(String theme) => appRepo.changeTheme(theme);
}
