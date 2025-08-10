import 'package:cine_shelf/features/app/domain/respository/app_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetIsFirstOpen {
  final AppRepository appRepo;

  GetIsFirstOpen({required this.appRepo});

  bool getAppTheme() => appRepo.isFirstTimeOpen();
}
