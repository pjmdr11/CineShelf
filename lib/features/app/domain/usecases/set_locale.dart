import 'package:cine_shelf/features/app/domain/respository/app_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SetLocaleUseCase {
  final AppRepository appRepo;
  SetLocaleUseCase({required this.appRepo});

  void setLocaleValue(String locale) => appRepo.setLocale(locale);
}
