import 'package:cine_shelf/core/constants/app_constants.dart';
import 'package:cine_shelf/core/constants/pref_constants.dart';
import 'package:cine_shelf/core/utils/log_utils.dart';
import 'package:cine_shelf/data/local/preference_helper.dart';
import 'package:cine_shelf/features/app/domain/respository/app_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AppRepository)
class AppRepositoryImpl extends AppRepository {
  final PreferenceHelper preferenceHelper;

  AppRepositoryImpl({required this.preferenceHelper});

  @override
  void changeTheme(String theme) {
    preferenceHelper.setString(prefTheme, theme);
  }

  @override
  String getAppTheme() {
    return preferenceHelper.getString(prefTheme, def: appThemeSystem);
  }

  @override
  bool isFirstTimeOpen() {
    return preferenceHelper.getBool(prefFirstOpen, def: false);
  }

  @override
  void setLocale(String locale) {
    LogUtils.log("SETLOCALE", locale);
    preferenceHelper.setString(prefLocale, locale);
  }
}
